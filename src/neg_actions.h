#ifndef NEG_ACT_H
#define NEG_ACT_H

class NegActions : public Actions{
	public:
	NegActions( Domain *_od, Domain *_cd ): Actions( _od, _cd ){}

	void addTerminalEffects( const Action *endact, const String &name, unsigned t, InstVec &ins, unsigned procedures, 
							 unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances){
		if( t + 1 == total_instances ){
			addEffect( name, goal_pred );
		}
		else{
			addEffect( name, "CHECKED-ACTION", true );
			addEffect( name, tests[ t ], true );
			addEffect( name, tests[ t + 1 ] );
			
			int row0 = cd->constantIndex( "ROW-0", "STACKROW" );
			for( unsigned line = 1; line <= lines; line++ )
				for( unsigned st = 0; st < stack_size; st++ ){
					int row = cd->constantIndex( "ROW-"+tostr( st ), "STACKROW" );
					addEffect( name, stack_lines[ line ], true, IntVec( 1, row ) );
				}
				
			addEffect( name, stack_lines[ 0 ], false, IntVec( 1, row0 ) );

			for( unsigned st = 1; st < stack_size; st++ ){
				int row = cd->constantIndex( "ROW-"+tostr( st ), "STACKROW" );
				addEffect( name, "TOP-STACK", true, IntVec( 1, row ) );
			}

			addEffect( name, "TOP-STACK", false, IntVec( 1, row0 ) );

			addEffect( name, "STACK-MAIN", false, IntVec( 1, row0 ) );

			std::vector< std::pair< String , IntVec > > add_eff;
				
			// Add effects of the next instance
			unsigned ins_size = ins[ t + 1 ]->init.size();
			for ( unsigned i = 0; i < ins_size; i++ ){ 
				Ground* init = ins[ t + 1 ]->init[ i ]; 

				Type *t = od->getType( init->name );

				StringVec objects = od->objectList( init );

				Lifted *l = od->preds.get( init->name );

				IntVec constant_idxs;
				for( unsigned k = 0; k < objects.size(); k++ ){
					int constant_idx = cd->constantIndex( objects[ k ], od->types[ l->params[ k ] ]->name );
					constant_idxs.emplace_back( constant_idx );
				}

				if( stack_predicates.find( t->name ) != stack_predicates.end() ){ // Add stack row
					constant_idxs.emplace_back( row0 );
				}

				addEffect( name, init->name, false, constant_idxs );

				add_eff.emplace_back( std::make_pair( init->name, constant_idxs ) );
			}
				
			// Delete fluents of the current instance
			for ( unsigned i = 0; i < od->preds.size(); i++ ) {
				//if( unclean_effs.find( i ) != unclean_effs.end() ) continue;
				if( cd->preds[ i ]->params.size() ){
					Forall * f = new Forall;
					f->params = cd->preds[ i ]->params;

					When *w = new When();
					w->pars = new And();
					( ( And * ) w->pars )->add( cd->ground( od->preds[ i ]->name, incvec( 0, f->params.size() ) ) );
					w->cond = new Not( cd->ground( od->preds[ i ]->name, incvec( 0, f->params.size() ) ) );
					f->cond = w;
					( ( And * )endact->eff )->add( f );
				}
				else
					cd->addEff( 1, name, od->preds[ i ]->name );
			}
			
			addEffect( name, "EXECUTE-ACTION", true );
			addEffect( name, "CHECKED-ACTION", true );
			if( ( t + 1 + negative_instances ) >= total_instances )
				addEffect( name, "TO-SKIP", false );
			addEffect( name, "STORED", true );
			addEffect( name, "STORE-AVAILABLE" );
			addEffect( name, "INF-CHECKED", true );
			addEffect( name, "INF-CHECKED-AVAILABLE", true );

			// Delete fluents COPY and CORRECT of the current instance
			for ( unsigned i = 0; i < od->preds.size(); i++ ) {
				String predicate_name = od->preds[ i ]->name;
				if( cd->preds[ i ]->params.size() ){
					Forall * f = new Forall;
					f->params = cd->preds[ i ]->params;

					When *w = new When();
					w->pars = new And();
					( ( And * ) w->pars )->add( cd->ground( "COPY-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );
					w->cond = new Not( cd->ground( "COPY-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );

					When *w2 = new When();
					w2->pars = new And();
					( ( And * ) w2->pars )->add( cd->ground( "CORRECT-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );
					w2->cond = new Not( cd->ground( "CORRECT-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );

					f->cond = new And();
					( ( And * ) f->cond )->add( w );
					( ( And * ) f->cond )->add( w2 );
					( ( And * ) endact->eff )->add( f );
				}
				else{
					cd->addEff( 1, name, "COPY-" + predicate_name );
					cd->addEff( 1, name, "CORRECT-" + predicate_name );
				}
			}
			for( unsigned i = 0; i < stack_lines.size(); i++ ){
				Forall *f = new Forall;
				f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
				f->cond = new And();
				( ( And * ) f->cond )->add( new Not( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, (endact->params).size() ) ) ) );
				( ( And * ) f->cond )->add( new Not( cd->ground( "CORRECT-" + stack_lines[ i ], IntVec( 1, (endact->params).size() ) ) ) );
				( ( And * ) endact->eff)->add( f );
			}
		}	
	}

	void createRepeatActions( InstVec &ins, unsigned procedures, unsigned total_instances, 
									unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances){
		// Action for the Main in the first stack level
		for( unsigned t = 0; t < total_instances; t++ ){
			//SStream ss;
			//ss << "SKIP-" << t ;
			//String name = ss.str();
			String name = "SKIP-" + std::to_string( t );
			
			Action *endact = createAction( name, StringVec() );
				
			addPrecondition( name, tests[ t ] );
			addPrecondition( name, "CHECKED-ACTION" );
			addPrecondition( name, "TO-SKIP" );
			addPrecondition( name, "EXECUTE-ACTION", true );

			addTerminalEffects( endact, name, t, ins, procedures, total_instances, lines, endinstr, tests, negative_instances );		
		}	
	}
	
	void createInfiniteDetectionActions( const StringVec &copiedPreds, const StringVec &correctPreds,  InstVec &ins, unsigned procedures, 
										 unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances  ){
		// STORE action for current ( line, state ) update to procedures with ( procedure, line, state )
		String name = "STORE";
		Action *storeState = createAction( name, StringVec() );

		addPrecondition( name, "STORED", true );
		addPrecondition( name, "STORE-AVAILABLE" );
		addPrecondition( name, "TO-SKIP" );
		
		addEffect( name, "STORED" );
		addEffect( name, "STORE-AVAILABLE", true );
		//addEffect( name, "INF-CHECKED-AVAILABLE" );
		
		
		for ( unsigned i = 0; i < od->preds.size(); ++i ){
			String predicate_name = od->preds[ i ]->name;
			//StringVec parameter_types = od->typeList( od->preds[ i ] );
			IntVec params = od->preds[ i ]->params;
			Forall *f = new Forall;
			f->params = params;
			When *w = new When();
			w->pars = new And();
			( ( And * ) w->pars )->add( cd->ground( predicate_name,   incvec( 0, f->params.size() ) ) );
			//( ( And * ) w->pars )->add( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) );
			w->cond = new And();
			( ( And * ) w->cond )->add( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) );
			f->cond = w;
			( ( And * )storeState->eff )->add( f );
			
		}
		
		for( unsigned i = 0; i < stack_lines.size(); i++ ){
			Forall *f = new Forall;
			f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
			f->cond = new And();
			When *w = new When();
			w->pars = new And();
			( ( And * ) w->pars )->add( cd->ground( stack_lines[ i ],   IntVec( 1, 0 ) ) );
			w->cond = new And();
			( ( And * ) w->cond )->add( cd->ground( "COPY-" + stack_lines[ i ],   IntVec( 1, 0 ) ) );
			( ( And * ) f->cond )->add( w ) ;
			( ( And * ) storeState->eff )->add( f );
		}

		// CHECK action for current ( line, state ) update to procedures with ( procedure, line, state )
		name = "CHECK-INFINITE-STATE-CANDIDATE";
		Action *checkInfiniteState = createAction( name, StringVec() );

		addPrecondition( name, "STORED" );
		addPrecondition( name, "INF-CHECKED", true );
		addPrecondition( name, "INF-CHECKED-AVAILABLE" );
		addPrecondition( name, "TO-SKIP" );
		
		addEffect( name, "INF-CHECKED" );
		addEffect( name, "INF-CHECKED-AVAILABLE", true );
		addEffect( name, "STORED", true );

		for ( unsigned i = 0; i < od->preds.size(); ++i ){
			String predicate_name = od->preds[ i ]->name;
			//StringVec parameter_types = od->typeList( od->preds[ i ] );
			IntVec params = od->preds[ i ]->params;
			Forall *f = new Forall;
			f->params = params;
			f->cond = new And();

			When *w = new When();
			w->pars = new And();
			( ( And * ) w->pars )->add( cd->ground( predicate_name,   incvec( 0, f->params.size() ) ) );
			( ( And * ) w->pars )->add( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) );
			w->cond = new And();
			( ( And * ) w->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );
			( ( And * ) f->cond )->add( w ); 

			When *w2 = new When();
			w2->pars = new And();
			( ( And * ) w2->pars )->add( new Not( cd->ground( predicate_name,   incvec( 0, f->params.size() ) ) ) );
			( ( And * ) w2->pars )->add( new Not( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) ) );
			w2->cond = new And();
			( ( And * ) w2->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );
			( ( And * ) f->cond )->add( w2 ); 
			
			
			( ( And * )checkInfiniteState->eff )->add( f );
		}

		for( unsigned i = 0; i < stack_lines.size(); i++ ){
			Forall *f = new Forall;
			f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
			f->cond = new And();

			When *w = new When();
			w->pars = new And();
			( ( And * ) w->pars)->add( cd->ground( stack_lines[ i ], IntVec( 1, 0 ) ) );
			( ( And * ) w->pars)->add( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, 0 ) ) );
			w->cond = new And();
			( ( And * ) w->cond)->add( cd->ground( "CORRECT-"+stack_lines[ i ], IntVec( 1, 0 ) ) );

			( ( And * ) f->cond )->add( w );

			When *w2 = new When();
			w2->pars = new And();
			( ( And * ) w2->pars)->add( new Not( cd->ground( stack_lines[ i ], IntVec( 1, 0 ) ) ) );
			( ( And * ) w2->pars)->add( new Not( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) );
			w2->cond = new And();
			( ( And * ) w2->cond)->add( cd->ground( "CORRECT-"+stack_lines[ i ], IntVec( 1, 0 ) ) );

			( ( And * ) f->cond )->add( w2 );

			( ( And * )checkInfiniteState->eff )->add( f );
		}


		// FINISH action for current ( line, state ) update to procedures with ( procedure, line, state )

		for( unsigned t = 0; t < total_instances; t++ ){
			name = "SKIP-INFINITE-" + std::to_string( t );
			Action *finishInfiniteExecution = createAction( name, StringVec() );
		
			addPrecondition( name, "INF-CHECKED" );
			addPrecondition( name, "TO-SKIP" );
			addPrecondition( name, tests[ t ] );

			for ( unsigned i = 0; i < od->preds.size(); ++i ){
				String predicate_name = od->preds[ i ]->name;
				IntVec params = od->preds[ i ]->params;

				Forall *f = new Forall;
				f->params = params;
				f->cond = new And();
				( ( And * ) f->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );	
			
				( ( And * )finishInfiniteExecution->pre )->add( f );
			}
		
			for( unsigned i = 0; i < stack_lines.size(); i++ ){
				Forall *f = new Forall;
				f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
				f->cond = new And();
				( ( And * ) f->cond )->add( cd->ground( "CORRECT-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) ;
				( ( And * ) finishInfiniteExecution->pre)->add( f );
			}

			addTerminalEffects( finishInfiniteExecution, name, t,  ins, procedures, total_instances, lines, endinstr, tests, negative_instances );
		}
	}
};

#endif
