#ifndef NEG_ACT_H
#define NEG_ACT_H

class NegActions : public Actions{
	public:
	NegActions( parser::pddl::Domain *_od, parser::pddl::Domain *_cd ): Actions( _od, _cd ){}

	void addTerminalEffects( const parser::pddl::Action *endact, const String &name, unsigned t, InstVec &ins, unsigned procedures, 
							 unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances){
		if( t + 1 == total_instances ){
			addEffect( name, goal_pred );
		}
		else{
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
				parser::pddl::Ground* init = ins[ t + 1 ]->init[ i ]; 

				parser::pddl::Type *t = od->getType( init->name );

				StringVec objects = od->objectList( init );

				parser::pddl::Lifted *l = od->preds.get( init->name );

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
					parser::pddl::Forall * f = new parser::pddl::Forall;
					f->params = cd->preds[ i ]->params;

					parser::pddl::When *w = new parser::pddl::When();
					w->pars = new parser::pddl::And();
					( ( parser::pddl::And * ) w->pars )->add( cd->ground( od->preds[ i ]->name, incvec( 0, f->params.size() ) ) );
					w->cond = new parser::pddl::Not( cd->ground( od->preds[ i ]->name, incvec( 0, f->params.size() ) ) );
					f->cond = w;
					( ( parser::pddl::And * )endact->eff )->add( f );
				}
				else
					cd->addEff( 1, name, od->preds[ i ]->name );
			}
			
			addEffect( name, "HOLDS", true );
			addEffect( name, "CHECKED", true );
			if( ( t + 1 + negative_instances ) >= total_instances )
				addEffect( name, "NEGEX", false );
			addEffect( name, "ACTED", true );
	
			if( compiler_type == "NEG" ){
				addEffect( name, "STORED", true );
				addEffect( name, "LOOP", true );

				// Delete fluents COPY and CORRECT of the current instance
				for ( unsigned i = 0; i < od->preds.size(); i++ ) {
					String predicate_name = od->preds[ i ]->name;
					if( cd->preds[ i ]->params.size() ){
						parser::pddl::Forall * f = new parser::pddl::Forall;
						f->params = cd->preds[ i ]->params;

						parser::pddl::When *w = new parser::pddl::When();
						w->pars = new parser::pddl::And();
						( ( parser::pddl::And * ) w->pars )->add( cd->ground( "COPY-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );
						w->cond = new parser::pddl::Not( cd->ground( "COPY-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );

						parser::pddl::When *w2 = new parser::pddl::When();
						w2->pars = new parser::pddl::And();
						( ( parser::pddl::And * ) w2->pars )->add( cd->ground( "CORRECT-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );
						w2->cond = new parser::pddl::Not( cd->ground( "CORRECT-" + predicate_name , incvec( (endact->params).size(), (endact->params).size() + f->params.size() ) ) );

						f->cond = new parser::pddl::And();
						( ( parser::pddl::And * ) f->cond )->add( w );
						( ( parser::pddl::And * ) f->cond )->add( w2 );
						( ( parser::pddl::And * ) endact->eff )->add( f );
					}
					else{
						cd->addEff( 1, name, "COPY-" + predicate_name );
						cd->addEff( 1, name, "CORRECT-" + predicate_name );
					}
				}
				for( unsigned i = 0; i < stack_lines.size(); i++ ){
					parser::pddl::Forall *f = new parser::pddl::Forall;
					f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
					f->cond = new parser::pddl::And();
					( ( parser::pddl::And * ) f->cond )->add( new parser::pddl::Not( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, (endact->params).size() ) ) ) );
					( ( parser::pddl::And * ) f->cond )->add( new parser::pddl::Not( cd->ground( "CORRECT-" + stack_lines[ i ], IntVec( 1, (endact->params).size() ) ) ) );
					( ( parser::pddl::And * ) endact->eff)->add( f );
				}
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
			
			parser::pddl::Action *endact = createAction( name, StringVec() );
				
			addPrecondition( name, tests[ t ] );
			addPrecondition( name, "CHECKED" );
			addPrecondition( name, "NEGEX" );
			addPrecondition( name, "HOLDS", true );

			addTerminalEffects( endact, name, t, ins, procedures, total_instances, lines, endinstr, tests, negative_instances );		
		}	
	}
	
	void createInfiniteDetectionActions( const StringVec &copiedPreds, const StringVec &correctPreds,  InstVec &ins, unsigned procedures, 
										 unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances  ){
		// STORE action for current ( line, state ) update to procedures with ( procedure, line, state )
		String name = "STORE";
		parser::pddl::Action *storeState = createAction( name, StringVec() );

		addPrecondition( name, "CHECKED", true );
		addPrecondition( name, "STORED", true );
		addPrecondition( name, "ACTED" );
		addPrecondition( name, "NEGEX" );
		
		addEffect( name, "STORED" );
		addEffect( name, "ACTED", true );
		//addEffect( name, "STORE-AVAILABLE", true );
		//addEffect( name, "ACTED" );
		
		
		for ( unsigned i = 0; i < od->preds.size(); ++i ){
			String predicate_name = od->preds[ i ]->name;
			//StringVec parameter_types = od->typeList( od->preds[ i ] );
			IntVec params = od->preds[ i ]->params;
			parser::pddl::Forall *f = new parser::pddl::Forall;
			f->params = params;
			parser::pddl::When *w = new parser::pddl::When();
			w->pars = new parser::pddl::And();
			( ( parser::pddl::And * ) w->pars )->add( cd->ground( predicate_name,   incvec( 0, f->params.size() ) ) );
			//( ( And * ) w->pars )->add( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) );
			w->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) w->cond )->add( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) );
			f->cond = w;
			( ( parser::pddl::And * )storeState->eff )->add( f );
			
		}
		
		for( unsigned i = 0; i < stack_lines.size(); i++ ){
			parser::pddl::Forall *f = new parser::pddl::Forall;
			f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
			f->cond = new parser::pddl::And();
			parser::pddl::When *w = new parser::pddl::When();
			w->pars = new parser::pddl::And();
			( ( parser::pddl::And * ) w->pars )->add( cd->ground( stack_lines[ i ],   IntVec( 1, 0 ) ) );
			w->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) w->cond )->add( cd->ground( "COPY-" + stack_lines[ i ],   IntVec( 1, 0 ) ) );
			( ( parser::pddl::And * ) f->cond )->add( w ) ;
			( ( parser::pddl::And * ) storeState->eff )->add( f );
		}

		// CHECK action for current ( line, state ) update to procedures with ( procedure, line, state )
		name = "COMPARE";
		parser::pddl::Action *checkInfiniteState = createAction( name, StringVec() );

		addPrecondition( name, "CHECKED", true );
		addPrecondition( name, "STORED" );
		addPrecondition( name, "ACTED" );
		addPrecondition( name, "LOOP", true );
		addPrecondition( name, "NEGEX" );
		
		addEffect( name, "LOOP" );
		addEffect( name, "ACTED", true );
		addEffect( name, "STORED", true );

		for ( unsigned i = 0; i < od->preds.size(); ++i ){
			String predicate_name = od->preds[ i ]->name;
			//StringVec parameter_types = od->typeList( od->preds[ i ] );
			IntVec params = od->preds[ i ]->params;
			parser::pddl::Forall *f = new parser::pddl::Forall;
			f->params = params;
			f->cond = new parser::pddl::And();

			parser::pddl::When *w = new parser::pddl::When();
			w->pars = new parser::pddl::And();
			( ( parser::pddl::And * ) w->pars )->add( cd->ground( predicate_name,   incvec( 0, f->params.size() ) ) );
			( ( parser::pddl::And * ) w->pars )->add( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) );
			w->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) w->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );
			( ( parser::pddl::And * ) f->cond )->add( w ); 

			parser::pddl::When *w2 = new parser::pddl::When();
			w2->pars = new parser::pddl::And();
			( ( parser::pddl::And * ) w2->pars )->add( new parser::pddl::Not( cd->ground( predicate_name,   incvec( 0, f->params.size() ) ) ) );
			( ( parser::pddl::And * ) w2->pars )->add( new parser::pddl::Not( cd->ground( copiedPreds[ i ], incvec( 0, f->params.size() ) ) ) );
			w2->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) w2->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );
			( ( parser::pddl::And * ) f->cond )->add( w2 ); 
			
			
			( ( parser::pddl::And * )checkInfiniteState->eff )->add( f );
		}

		for( unsigned i = 0; i < stack_lines.size(); i++ ){
			parser::pddl::Forall *f = new parser::pddl::Forall;
			f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
			f->cond = new parser::pddl::And();

			parser::pddl::When *w = new parser::pddl::When();
			w->pars = new parser::pddl::And();
			( ( parser::pddl::And * ) w->pars)->add( cd->ground( stack_lines[ i ], IntVec( 1, 0 ) ) );
			( ( parser::pddl::And * ) w->pars)->add( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, 0 ) ) );
			w->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) w->cond)->add( cd->ground( "CORRECT-"+stack_lines[ i ], IntVec( 1, 0 ) ) );

			( ( parser::pddl::And * ) f->cond )->add( w );

			parser::pddl::When *w2 = new parser::pddl::When();
			w2->pars = new parser::pddl::And();
			( ( parser::pddl::And * ) w2->pars)->add( new parser::pddl::Not( cd->ground( stack_lines[ i ], IntVec( 1, 0 ) ) ) );
			( ( parser::pddl::And * ) w2->pars)->add( new parser::pddl::Not( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) );
			w2->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) w2->cond)->add( cd->ground( "CORRECT-"+stack_lines[ i ], IntVec( 1, 0 ) ) );

			( ( parser::pddl::And * ) f->cond )->add( w2 );

			( ( parser::pddl::And * )checkInfiniteState->eff )->add( f );
		}


		// FINISH action for current ( line, state ) update to procedures with ( procedure, line, state )
		name = "PROCESS";
		parser::pddl::Action *processInfiniteExecution = createAction( name, StringVec() );

		addPrecondition( name, "LOOP" );
		addPrecondition( name, "NEGEX" );

		for ( unsigned i = 0; i < od->preds.size(); ++i ){
			String predicate_name = od->preds[ i ]->name;
			IntVec params = od->preds[ i ]->params;

			parser::pddl::Forall *f = new parser::pddl::Forall;
			f->params = params;
			f->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) f->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );	
			
			( ( parser::pddl::And * )processInfiniteExecution->pre )->add( f );
		}
		
		for( unsigned i = 0; i < stack_lines.size(); i++ ){
			parser::pddl::Forall *f = new parser::pddl::Forall;
			f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
			f->cond = new parser::pddl::And();
			( ( parser::pddl::And * ) f->cond )->add( cd->ground( "CORRECT-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) ;
			( ( parser::pddl::And * ) processInfiniteExecution->pre)->add( f );
		}

		addEffect( name, "LOOP", true );
		addEffect( name, "CHECKED" );

		/*for( unsigned t = 0; t < total_instances; t++ ){
			name = "SKIP-INFINITE-" + std::to_string( t );
			parser::pddl::Action *finishInfiniteExecution = createAction( name, StringVec() );
		
			addPrecondition( name, "LOOP" );
			addPrecondition( name, "NEGEX" );
			addPrecondition( name, tests[ t ] );

			for ( unsigned i = 0; i < od->preds.size(); ++i ){
				String predicate_name = od->preds[ i ]->name;
				IntVec params = od->preds[ i ]->params;

				parser::pddl::Forall *f = new parser::pddl::Forall;
				f->params = params;
				f->cond = new parser::pddl::And();
				( ( parser::pddl::And * ) f->cond )->add( cd->ground( correctPreds[ i ], incvec( 0, f->params.size() ) ) );	
			
				( ( parser::pddl::And * )finishInfiniteExecution->pre )->add( f );
			}
		
			for( unsigned i = 0; i < stack_lines.size(); i++ ){
				parser::pddl::Forall *f = new parser::pddl::Forall;
				f->params = cd->convertTypes( StringVec( 1, "STACKROW" ) );
				f->cond = new parser::pddl::And();
				( ( parser::pddl::And * ) f->cond )->add( cd->ground( "CORRECT-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) ;
				( ( parser::pddl::And * ) finishInfiniteExecution->pre)->add( f );
			}

			addTerminalEffects( finishInfiniteExecution, name, t,  ins, procedures, total_instances, lines, endinstr, tests, negative_instances );
		}*/
	}
};

#endif
