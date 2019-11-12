#ifndef TERMINAL_H
#define TERMINA_H

#include "actions.h"

class TerminalActions : public Actions{

	public:

	TerminalActions( parser::pddl::Domain *_od, parser::pddl::Domain *_cd ): Actions( _od, _cd ){}
	
	void createProgrammingActions( unsigned procedures, unsigned lines, StringVec& empty_lines, StringDVec& endinstr, const StringDVec& allowed_lines = StringDVec() ){
		unsigned offset = 1;

		createValuedActions( "PROGRAM-END", lines + 1, offset, StringVec( 1, "STACKROW" ) );

		StringVec action_names = getNames( "PROGRAM-END" );

		for( unsigned idx = 0; idx < action_names.size(); idx++ ){
			String name = action_names[ idx ];
			unsigned line = idx + offset;

			addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) ); // top
			addPrecondition( name, "STACK-MAIN", false, IntVec( 1, 0 ) ); // main
			addPrecondition( name, empty_lines[ line ] ); // assign corresponding empty
			addPrecondition( name, stack_lines[ line ], false, IntVec( 1, 0 ) ); // stack line

			if( compiler_type == "TWO-STEPS-2" ){
				addPrecondition( name, "MODE-STRUCTURE", false );
			}

			addEffect( name, empty_lines[ line ], true );
			addEffect( name, endinstr[ procedures ][ line ], false );

			if( compiler_type == "CFG" ){
				if( line < lines )
					addEffect( name, allowed_lines[ procedures ][ line + 1 ] );				
			}
			else{
				addPrecondition( name, "TEST-0" ); // first test
			}

			addCost( name, 1 );
		
			// Action to instruction
			addActionToInstruction( name, endinstr[ procedures ][ line ] );
		}
	}

	void createFSCProgrammingActions( unsigned procedures, unsigned nstates, const StringDVec& endinstr, const StringVec& constant_states ){
		//unsigned offset = 1; // Allows to program from first state
		unsigned offset = nstates; // Forces to program end in last state
		if( compiler_type == "HFSC" )
			createValuedActions( "PROGRAM-END", nstates + 1, offset, StringVec() = { "STACKROW" } );
		else if( compiler_type == "NFA"  or compiler_type == "NFA2")
			createValuedActions( "PROGRAM-END", nstates + 1, offset );

		StringVec action_names = getNames( "PROGRAM-END" );

		for( unsigned idx = 0; idx < action_names.size(); idx++ ){
			String name = action_names[ idx ];
			unsigned state = idx + offset;			
			int stateIdx = cd->constantIndex( constant_states[ state ] , "STACKSTATE" );

			if( compiler_type == "HFSC" ){
				addPrecondition( name, stack_top_pred, false, IntVec( 1 , 0 ) );
				addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, 0 ) );			
				addPrecondition( name, stack_state_pred, false, IntVec() = { stateIdx, 0 } );				
				addPrecondition( name, stack_empty_cond_pred, false, IntVec( 1 , stateIdx ) );

				addEffect( name, stack_empty_cond_pred, true, IntVec( 1 , stateIdx ) );
			}
			else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
				addPrecondition( name, stack_state_pred, false, IntVec() = { stateIdx } );	
				if( compiler_type == "NFA2" ){			
					addPrecondition( name, stack_empty_cond_pred, false, IntVec( 1 , stateIdx ) );

					addEffect( name, stack_empty_cond_pred, true, IntVec( 1 , stateIdx ) );
				}
			}

			addEffect( name, endinstr[ procedures ][ state ] );

			addCost( name, 1 );
		
			// Action to instruction
			addActionToInstruction( name, endinstr[ procedures ][ state ] );
		}
	}
	
	

	void createRepeatTerminalAction( unsigned procedures, unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests ){
		// Repeat ends for other procedures or the main recursion
		for( unsigned p = 0; p < procedures + 1 ; p++ ){
			for( unsigned t = 0; t < total_instances; t++){
				for ( unsigned j = 1; j < lines + 1; j++ ) {
					SStream ss;
					ss << "REPEAT-END-" << p << "-" << t << "-" << j;
					String name = ss.str();
				
					parser::pddl::Action* endact = createAction( name, StringVec( 2, "STACKROW" ) );
					addPrecondition( name, endinstr[ p ][ j ] );
					addPrecondition( name, tests[ t ] );
					addPrecondition( name, "NEXT-STACK-ROW", 	   false, incvec( 0, 2 ) );
					addPrecondition( name, "TOP-STACK", 		   false, IntVec( 1, 1 ) );
					addPrecondition( name, stack_procedures[ p ], false, IntVec( 1, 1 ) );
					addPrecondition( name, stack_lines[ j ], 	   false, IntVec( 1, 1 ) );

					addEffect( name, "TOP-STACK", 			 true,  IntVec( 1, 1 ) );
					addEffect( name, "TOP-STACK", 			 false, IntVec( 1, 0 ) );
					addEffect( name, stack_procedures[ p ], true,  IntVec( 1, 1 ) );
					addEffect( name, stack_lines[ j ], 	 true,  IntVec( 1, 1 ) );			

					// Delete all the stackable fluents of the current level
					for( String pred : stack_predicates ){
						parser::pddl::Forall * f = new parser::pddl::Forall;
						parser::pddl::Lifted *l = cd->preds.get( pred );
						f->params = l->params;
						(f->params).resize( (l->params).size() - 1 );
						IntVec parameters;
						for(size_t i = 0; i < f->params.size(); i++)
							parameters.push_back( i + 2 );
						parameters.push_back( 1 );
						f->cond = new parser::pddl::And;	
						( ( parser::pddl::And * )f->cond )->add( new parser::pddl::Not( cd->ground( pred, parameters ) ) );
						( ( parser::pddl::And * )endact->eff )->add( f );
					}

					addCost( name, 1 );
				}
			}
		}
	}
	
	void createRepeatTerminalMain(	InstVec &ins, unsigned procedures, unsigned total_instances, 
									unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances = 0, bool mode_conds = false ){
		// Action for the Main in the first stack level
		for( unsigned t = 0; t + negative_instances < total_instances; t++ ){
			for( unsigned j = 1; j < lines + 1; j++ ){
				SStream ss;
				if( compiler_type == "TWO-STEPS-2" ){
					if( mode_conds ) ss << "REPEAT-END-MAIN-COND-" << t << "-" << j;
					else ss << "REPEAT-END-MAIN-STRUCTURE-" << t << "-" << j;
				}
				else{
					ss << "REPEAT-END-MAIN-" << t << "-" << j;
				}
				String name = ss.str();
			
				parser::pddl::Action *endact = createAction( name, StringVec( 1, "STACKROW" ) );
				
				addPrecondition( name, "TOP-STACK",  false, IntVec( 1, 0 ) );
				addPrecondition( name, "TOP-STACK",  false, IntVec( 1, cd->constantIndex( "ROW-0", "STACKROW" ) ) );
				addPrecondition( name, "STACK-MAIN", false, IntVec( 1, cd->constantIndex( "ROW-0", "STACKROW" ) ) );
				addPrecondition( name, stack_lines[ j ], false, IntVec( 1, cd->constantIndex( "ROW-0", "STACKROW" ) ) );
				addPrecondition( name, endinstr[ procedures ][ j ] );
				addPrecondition( name, tests[ t ] );
				
				if( compiler_type == "TWO-STEPS-2" ){
					if( mode_conds ) addPrecondition( name, "MODE-COND" );
					else addPrecondition( name, "MODE-STRUCTURE" );
				}

				if( compiler_type == "NEG" or compiler_type == "NEGLITE" ){
					addPrecondition( name, "HOLDS" );
					addPrecondition( name, "CHECKED" );
					if( compiler_type == "NEG" ){
						addPrecondition( name, "STORED", true );
					}
				}

				for ( unsigned i = 0; i < ins[ t ]->goal.size(); ++i ) {
					parser::pddl::Ground* goal = ins[ t ]->goal[ i ];
					parser::pddl::Type *t = od->getType( goal->name );
					StringVec objects = od->objectList( goal );
					parser::pddl::Lifted * l = od->preds.get( goal->name );
					IntVec constant_idxs;
					for ( unsigned k = 0; k < objects.size(); k++ ){
						int constant_idx = cd->constantIndex( objects[ k ], od->types[ l->params[ k ] ]->name );
						constant_idxs.emplace_back( constant_idx );
					}

					if( stack_predicates.find( t->name ) != stack_predicates.end() ){ // Add stack row
						constant_idxs.emplace_back( cd->constantIndex( "ROW-0", "STACKROW" ) );
					}
	
					if( compiler_type != "NEG" and compiler_type != "NEGLITE" )
						addPrecondition( name, goal->name, false, constant_idxs );
				}

				if( t + 1 == total_instances && compiler_type != "TWO-STEPS-2" ){
					addEffect( name, goal_pred );
				}
				else if( t + 1 == total_instances && mode_conds && compiler_type == "TWO-STEPS-2" ){
					addEffect( name, goal_pred );
				}		
				else{
					if( compiler_type == "NEG" or compiler_type == "NEGLITE" ){
						addEffect( name, "HOLDS", true );
						addEffect( name, "CHECKED", true );
						if( ( t + 1 + negative_instances ) >= total_instances )
							addEffect( name, "NEGEX", false );
						addEffect( name, "ACTED", true );
						if( compiler_type == "NEG" ){
							addEffect( name, "STORED", true );
							//addEffect( name, "STORE-AVAILABLE" );
							addEffect( name, "LOOP", true );

							// Delete fluents COPY and CORRECT of the current instance
							for ( unsigned i = 0; i < od->preds.size(); i++ ) {
								String predicate_name = od->preds[ i ]->name;
								if( cd->preds[ i ]->params.size() ){
									parser::pddl::Forall * f = new parser::pddl::Forall;
									f->params = cd->preds[ i ]->params;

									parser::pddl::When *w = new parser::pddl::When();
									w->pars = new parser::pddl::And();
									( ( parser::pddl::And * ) w->pars )->add( cd->ground( "COPY-" + predicate_name , incvec( 1, f->params.size() + 1 ) ) );
									w->cond = new parser::pddl::Not( cd->ground( "COPY-" + predicate_name , incvec( 1, f->params.size() + 1 ) ) );

									parser::pddl::When *w2 = new parser::pddl::When();
									w2->pars = new parser::pddl::And();
									( ( parser::pddl::And * ) w2->pars )->add( cd->ground( "CORRECT-" + predicate_name , incvec( 1, f->params.size() + 1 ) ) );
									w2->cond = new parser::pddl::Not( cd->ground( "CORRECT-" + predicate_name , incvec( 1, f->params.size() + 1 ) ) );

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
								( ( parser::pddl::And * ) f->cond )->add( new parser::pddl::Not( cd->ground( "COPY-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) );
								( ( parser::pddl::And * ) f->cond )->add( new parser::pddl::Not( cd->ground( "CORRECT-" + stack_lines[ i ], IntVec( 1, 0 ) ) ) );
								f->addParams( 0, 1 );
								( ( parser::pddl::And * ) endact->eff)->add( f );
							}
						}

					}

					unsigned next_instance = t + 1;

					if( next_instance == total_instances && compiler_type == "TWO-STEPS-2" && !mode_conds){
						next_instance = 0; 
						addEffect( name, "MODE-STRUCTURE", true );
						addEffect( name, "MODE-COND", false );
					}

					addEffect( name, tests[ t ], true );
					addEffect( name, tests[ next_instance ] );
					addEffect( name, stack_lines[ j ], true, IntVec( 1, 0 ) );
					addEffect( name, stack_lines[ 0 ], false, IntVec( 1, 0 ) );
				
					std::vector< std::pair< String , IntVec > > add_eff;
				
					// Add effects of the next instance
					unsigned ins_size = ins[ next_instance ]->init.size();
					for ( unsigned i = 0; i < ins_size; i++ ){ 
						parser::pddl::Ground* init = ins[ next_instance ]->init[ i ]; 

						parser::pddl::Type *t = od->getType( init->name );

						StringVec objects = od->objectList( init );

						parser::pddl::Lifted *l = od->preds.get( init->name );

						IntVec constant_idxs;
						for( unsigned k = 0; k < objects.size(); k++ ){
							int constant_idx = cd->constantIndex( objects[ k ], od->types[ l->params[ k ] ]->name );
							constant_idxs.emplace_back( constant_idx );
						}

						if( stack_predicates.find( t->name ) != stack_predicates.end() ){ // Add stack row
							constant_idxs.emplace_back( cd->constantIndex( "ROW-0", "STACKROW" ) );
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
							( ( parser::pddl::And * ) w->pars )->add( cd->ground( od->preds[ i ]->name, incvec( 1, f->params.size() + 1 ) ) );
							/**for( size_t k = 0; k < add_eff.size(); k++ ){
								if( add_eff[ k ].first == od->preds[ i ]->name ){
									( ( And * ) w->pars )->add( new Not( cd->ground( od->preds[ i ]->name, add_eff[ k ].second ) ) );
								}
							}*/

							w->cond = new parser::pddl::Not( cd->ground( od->preds[ i ]->name, incvec( 1, f->params.size() + 1 ) ) );
							f->cond = w;
							( ( parser::pddl::And * )endact->eff )->add( f );
						}
						else
							cd->addEff( 1, name, od->preds[ i ]->name );
					}
				}			
			}	
		}
	}

	void checkPreconditions( unsigned procedures, unsigned lines, unsigned total_instances, StringDVec& endinstr, StringVec& tests, InstVec &ins ){
		// Prepare new checking actions 
		String name_prefix = "CHECK-MAIN-END";		
		createDValuedActions( name_prefix, total_instances, lines+1, 0, 1, StringVec( 1, "STACKROW" ) );
		StringVec action_prefixes = getNames( name_prefix );

		for( unsigned t = 0; t < total_instances; t++ ){
			StringVec action_names = getNames( action_prefixes[ t ] );
			for( unsigned line = 0; line < action_names.size(); line++ ){
				String name = action_names[ line ];

				parser::pddl::Action *act = getAction( cd, name );
				//copyPreconditions( oname, name );
				addPrecondition( name, "TOP-STACK", false, IntVec( 1 , 0 ) );
				addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1 , 0 ) );
				addPrecondition( name, stack_lines[ line+1 ], false, IntVec( 1 , 0 ) );
				addPrecondition( name, endinstr[ procedures ][ line+1 ] );
				addPrecondition( name, tests[ t ] );
				addPrecondition( name, "CHECKED", true );
				if( compiler_type == "NEG" ){
					addPrecondition( name, "LOOP", true );
				}
				addEffect( name, "CHECKED", false );

				parser::pddl::When *w = new parser::pddl::When();
				//And *old = dynamic_cast< And * >( oact->pre );
				//w->pars = old->copy( *od );
				w->pars = new parser::pddl::And();
				w->cond = new parser::pddl::And();
				( ( parser::pddl::And * ) w->cond)->add( cd->ground( "HOLDS" ) );

				for ( unsigned i = 0; i < ins[ t ]->goal.size(); ++i ) {
					parser::pddl::Ground* goal = ins[ t ]->goal[ i ];
					parser::pddl::Type *t = od->getType( goal->name );
					StringVec objects = od->objectList( goal );
					parser::pddl::Lifted * l = od->preds.get( goal->name );
					IntVec constant_idxs;
					for ( unsigned k = 0; k < objects.size(); k++ ){
						int constant_idx = cd->constantIndex( objects[ k ], od->types[ l->params[ k ] ]->name );
						constant_idxs.emplace_back( constant_idx );
					}
					if( stack_predicates.find( t->name ) != stack_predicates.end() ){ // Add stack row
						constant_idxs.emplace_back( cd->constantIndex( "ROW-0", "STACKROW" ) );
					}
					//addPrecondition( name, goal->name, false, constant_idxs );
					//std::cout << goal->name << std::endl;
					//( ( And * ) w->pars )->add( cd->ground( goal->name, constant_idxs ) );
					( ( parser::pddl::And * ) w->pars )->add( cd->ground( goal->name, constant_idxs ) );
				}

				( ( parser::pddl::And * ) act->eff)->add( w );
			}
		}
	}

	void createRepeatActions(	InstVec &ins, unsigned procedures, unsigned total_instances, 
								unsigned lines, StringDVec& endinstr, StringVec& tests, unsigned negative_instances = 0, bool mode_conds = false ){
		createRepeatTerminalMain( ins, procedures, total_instances, lines, endinstr, tests, negative_instances, mode_conds );
		createRepeatTerminalAction( procedures, total_instances, lines, endinstr, tests );
		if( compiler_type == "NEG" or compiler_type == "NEGLITE" ){
			checkPreconditions(  procedures, lines, total_instances, endinstr, tests, ins );
		}
	}

	void nextFSCInstance( InstVec &ins, parser::pddl::Action *endact, const String &action_name, int next_instance_id ){
		for ( unsigned p = 0; p < od->preds.size(); ++p ) {
			if( unclean_effs.find( p ) != unclean_effs.end() ) continue;
			//if( effs.find(i) == effs.end() ) continue; //[PERFORMANCE] static fluents
			if( cd->preds[ p ]->params.size() ){
				parser::pddl::Forall * f = new parser::pddl::Forall;
				f->params = cd->preds[ p ]->params;
				f->cond = new parser::pddl::Not( cd->ground( od->preds[ p ]->name, incvec( 0, f->params.size() ) ) );
				( ( parser::pddl::And * )endact->eff )->add( f );
			}
			else
				addEffect( action_name, od->preds[ p ]->name, true );
		}
		for ( unsigned i = 0; i < ins[ next_instance_id ]->init.size(); ++i ){ 
			String init_name = ins[ next_instance_id ]->init[ i ]->name;
			parser::pddl::Lifted *l = od->preds.get( init_name ); 
			StringVec params = od->objectList( ins[ next_instance_id ]->init[ i ] ); 
			IntVec iv_parameters;
			for( unsigned j = 0; j < params.size(); ++j){ 
				iv_parameters.push_back( cd->constantIndex( params[ j ], od->types[ l->params[ j ] ]->name ) );
			}
			if( compiler_type == "HFSC" ){
				// Add rows[ 0 ] to this stackable predicate
				if( stack_predicates.find( init_name ) != stack_predicates.end() ){
					int ci_row0 = cd->constantIndex( "ROW-0" , "STACKROW" ); 
					iv_parameters.push_back( ci_row0 );
				}
			}
			addEffect( action_name, init_name, false, iv_parameters );	
		}		
	}

	void createFSCRepeatActions( InstVec &ins, unsigned procedures, unsigned total_instances, unsigned bound, unsigned max_bound, const StringVec &constant_states, const StringVec &tests, const StringDVec &endinstr, bool mode_structure = false ){

		int ci_row0 = cd->constantIndex( "ROW-0" , "STACKROW" ); 
		//int ci_endstN = cd->constantIndex( constant_states[ bound ] , "STACKSTATE" ); 
		int ci_endst0 = cd->constantIndex( constant_states[ 0 ] , "STACKSTATE" ); 
		//IntVec iv_pre = { ci_endstN, ci_row0 }; 
		IntVec iv_eff = { ci_endst0, ci_row0 };

		for( unsigned t = 0; t < total_instances; t++){
			for( unsigned state = 1; state < bound + 1; state++ ){
				int ci_currentstate = cd->constantIndex( constant_states[ state ], "STACKSTATE" );
				IntVec iv_pre = { ci_currentstate, ci_row0 }; 
				SStream ss;
				if( compiler_type == "HFSC" )
					ss << "REPEAT-END-MAIN-" << t << "-" << procedures << "-" << state;
				else if( compiler_type == "NFA" )
					ss << "EXECUTE-END-" << t << "-" << state;
				else if( compiler_type == "NFA2" )
					ss << "EXECUTE-END-" << (mode_structure?"STRUCTURE":"CONDITION") << "-" << t << "-" << state;					
				String name = ss.str();

				parser::pddl::Action * endact = createAction( name );

				addPrecondition( name, tests[ t ] );
				addPrecondition( name, endinstr[ procedures ][ state ] );

				if( compiler_type == "HFSC" ){
					addPrecondition( name, stack_top_pred, false, IntVec( 1, ci_row0 ) );
					addPrecondition( name, stack_state_pred, false, iv_pre );
				}
				else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
					addPrecondition( name, stack_state_pred, false, IntVec() = { ci_currentstate } );
					if( compiler_type == "NFA2" ){
						if( mode_structure ) 
							addPrecondition( name, "MODE-STRUCTURE" );
						else
							addPrecondition( name, "DONE-STRUCTURE" );
					}
				}

				for ( unsigned g = 0; g < ins[ t ]->goal.size(); ++g ) {
					String goal_name = ins[ t ]->goal[ g ]->name;
					parser::pddl::Lifted * l = od->preds.get( goal_name );
					StringVec params = od->objectList( ins[ t ]->goal[ g ] );
					IntVec iv_parameters;
					for ( unsigned j = 0; j < params.size(); ++j )
						iv_parameters.push_back( cd->constantIndex( params[ j ], od->types[ l->params[ j ] ]->name ) );
					addPrecondition( name, goal_name , false, iv_parameters );
				}

				if( t + 1 == total_instances ){
					if( compiler_type == "NFA2" and mode_structure ){
						addEffect( name, "DONE-STRUCTURE" );
						addEffect( name, "MODE-STRUCTURE", true );
						addEffect( name, tests[ t ], true );
						addEffect( name, tests[ 0 ] );
						addEffect( name, stack_state_pred, true, IntVec() = { ci_currentstate } );
						addEffect( name, stack_state_pred, false, IntVec() = { ci_endst0 } );
						addEffect( name, "EVAL-TRUE", true );
						addEffect( name, "EVAL-FALSE", true );			

						nextFSCInstance( ins, endact, name, 0 );									
					}
					else{
						addEffect( name, goal_pred );
					}
				}
				else{
					addEffect( name, tests[ t ], true );
					addEffect( name, tests[ t + 1 ] );
					if( compiler_type == "HFSC" ){
						addEffect( name, stack_state_pred, true, iv_pre );
						addEffect( name, stack_state_pred, false, iv_eff );
					}
					else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
						addEffect( name, stack_state_pred, true, IntVec() = { ci_currentstate } );
						addEffect( name, stack_state_pred, false, IntVec() = { ci_endst0 } );
						addEffect( name, "EVAL-TRUE", true );
						addEffect( name, "EVAL-FALSE", true );
					}

					nextFSCInstance( ins, endact, name, t + 1 );
					/*for ( unsigned p = 0; p < od->preds.size(); ++p ) {
						if( unclean_effs.find( p ) != unclean_effs.end() ) continue;
						//if( effs.find(i) == effs.end() ) continue; //[PERFORMANCE] static fluents
						if( cd->preds[ p ]->params.size() ){
							parser::pddl::Forall * f = new parser::pddl::Forall;
							f->params = cd->preds[ p ]->params;
							f->cond = new parser::pddl::Not( cd->ground( od->preds[ p ]->name, incvec( 0, f->params.size() ) ) );
							( ( parser::pddl::And * )endact->eff )->add( f );
						}
						else
							addEffect( name, od->preds[ p ]->name, true );
					}
			
					for ( unsigned i = 0; i < ins[ t + 1 ]->init.size(); ++i ){ 
						String init_name = ins[ t + 1 ]->init[ i ]->name;
						parser::pddl::Lifted *l = od->preds.get( init_name ); 
						StringVec params = od->objectList( ins[ t + 1 ]->init[ i ] ); 
						IntVec iv_parameters;
						for( unsigned j = 0; j < params.size(); ++j){ 
							iv_parameters.push_back( cd->constantIndex( params[ j ], od->types[ l->params[ j ] ]->name ) );
						}
						// Add rows[ 0 ] to this stackable predicate
						if( stack_predicates.find( init_name ) != stack_predicates.end() ){
							iv_parameters.push_back( ci_row0 );
						}
						addEffect( name, init_name, false, iv_parameters );	
					}*/
				}
			}
		}

		if( compiler_type == "HFSC" ){
			for( unsigned t = 0; t < total_instances; t++ ){
				for( unsigned p = 0; p < procedures + 1; p++){
					for( unsigned state = 1; state < max_bound + 1; state++ ){


						SStream ss;
						ss << "REPEAT-END-" << t << "-" << p << "-" << state;
						String name = ss.str();
			
						parser::pddl::Action * endact = createAction( name, StringVec( 2, "STACKROW" ) );

						//IntVec stack_state_iv = { ci_endstN, 1 };

						IntVec stack_state_iv = { cd->constantIndex( constant_states[ state ] , "STACKSTATE" ), 1 }; 

						addPrecondition( name, tests[ t ] );
						addPrecondition( name, stack_row_pred, false, incvec( 0, 2 ) );					
						addPrecondition( name, stack_top_pred, false, IntVec( 1, 1 ) );
						addPrecondition( name, stack_procedures[ p ], false, IntVec( 1, 1 ) );
						addPrecondition( name, stack_state_pred, false, stack_state_iv );
						addPrecondition( name, endinstr[ p ][ state ] );

						addEffect( name, stack_top_pred, true, IntVec( 1, 1 ) );
						addEffect( name, stack_top_pred, false, IntVec( 1, 0 ) );
						addEffect( name, stack_state_pred, true, stack_state_iv );
						addEffect( name, stack_procedures[ p ], true, IntVec( 1, 1 ) );

						//[BUG] Add Forall delete ASSIGNMENT from this stackrow
						for( StringSet::iterator it = stack_predicates.begin(); it != stack_predicates.end(); it++ ){
							parser::pddl::Forall * f = new parser::pddl::Forall;
							parser::pddl::Lifted *l = od->preds.get( *it );
							f->params = l->params;
							IntVec iv_parameters;
							for( size_t i = 0; i < f->params.size(); i++ )
								iv_parameters.push_back( i + 2 );
							iv_parameters.push_back( 1 );
							f->cond = new parser::pddl::And;	
							( ( parser::pddl::And * )f->cond )->add( new parser::pddl::Not( cd->ground( *it, iv_parameters ) ) );
							( ( parser::pddl::And * )endact->eff )->add( f );
						}
					}

				}
			}
		}
	}
	
	void createNoGoalRepeatActions( InstVec &ins, unsigned procedures, unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests ){
		for( unsigned t = 0; t < total_instances; t++ ){
			for( unsigned j = 1; j < lines + 1; j++ ){
				for ( unsigned i = 0; i < ins[ t ]->goal.size(); ++i ){
					String name = "EXECUTE-END-MAIN-" + tostr( t ) + "-" + tostr( j ) + "-" + tostr( i );
					createNoGoalRepeatTerminalMain( name, t, j, i, false, ins, procedures, total_instances, lines, endinstr, tests );
					name = "SKIP-END-MAIN-" + tostr( t ) + "-" + tostr( j ) + "-" + tostr( i );
					createNoGoalRepeatTerminalMain( name, t, j, i, true, ins, procedures, total_instances, lines, endinstr, tests );
				}
			}
		}
		
	}

	void createNoGoalRepeatTerminalMain( String &name, unsigned t, unsigned j, unsigned i, bool neg, InstVec &ins, unsigned procedures, unsigned total_instances, unsigned lines, StringDVec& endinstr, StringVec& tests ){
		parser::pddl::Action *endact = createAction( name, StringVec( 1, "STACKROW" ) );
				
		addPrecondition( name, "TOP-STACK",  false, IntVec( 1, 0 ) );
		addPrecondition( name, "TOP-STACK",  false, IntVec( 1, cd->constantIndex( "ROW-0", "STACKROW" ) ) );
		addPrecondition( name, "STACK-MAIN", false, IntVec( 1, cd->constantIndex( "ROW-0", "STACKROW" ) ) );
		addPrecondition( name, stack_lines[ j ], false, IntVec( 1, cd->constantIndex( "ROW-0", "STACKROW" ) ) );
		addPrecondition( name, endinstr[ procedures ][ j ] );
		addPrecondition( name, tests[ t ] );

		parser::pddl::Ground* goal = ins[ t ]->goal[ i ];
		parser::pddl::Type *tp1 = od->getType( goal->name );
		StringVec objects = od->objectList( goal );
		parser::pddl::Lifted * l = od->preds.get( goal->name );
		IntVec constant_idxs;
		for ( unsigned k = 0; k < objects.size(); k++ ){
			int constant_idx = cd->constantIndex( objects[ k ], od->types[ l->params[ k ] ]->name );
			constant_idxs.emplace_back( constant_idx );
		}

		if( stack_predicates.find( tp1->name ) != stack_predicates.end() ){ // Add stack row
			constant_idxs.emplace_back( cd->constantIndex( "ROW-0", "STACKROW" ) );
		}
	
		addPrecondition( name, goal->name, neg, constant_idxs );
		addPrecondition( name, "STEP-"+tostr(i), false );

		if( i + 1 < ins[ t ]->goal.size() ){
			addEffect( name, "STEP-"+tostr(i), true );
			addEffect( name, "STEP-"+tostr(i+1) );
		}
		else if( t + 1 == total_instances ){
			addEffect( name, goal_pred );
		}
		else{
			unsigned next_instance = t + 1;
			addEffect( name, "STEP-"+tostr( i ), true );
			addEffect( name, "STEP-0" );
			addEffect( name, tests[ t ], true );
			addEffect( name, tests[ next_instance ] );
			addEffect( name, stack_lines[ j ], true, IntVec( 1, 0 ) );
			addEffect( name, stack_lines[ 0 ], false, IntVec( 1, 0 ) );
				
			std::vector< std::pair< String , IntVec > > add_eff;
				
			// Add effects of the next instance
			unsigned ins_size = ins[ next_instance ]->init.size();
			for ( unsigned p = 0; p < ins_size; p++ ){ 
				parser::pddl::Ground* init = ins[ next_instance ]->init[ p ]; 
				parser::pddl::Type *tp2 = od->getType( init->name );
				StringVec objects = od->objectList( init );
				parser::pddl::Lifted *l = od->preds.get( init->name );
				IntVec constant_idxs;
				for( unsigned k = 0; k < objects.size(); k++ ){
					int constant_idx = cd->constantIndex( objects[ k ], od->types[ l->params[ k ] ]->name );
					constant_idxs.emplace_back( constant_idx );
				}
				if( stack_predicates.find( tp2->name ) != stack_predicates.end() ){ // Add stack row
					constant_idxs.emplace_back( cd->constantIndex( "ROW-0", "STACKROW" ) );
				}

				addEffect( name, init->name, false, constant_idxs );
				add_eff.emplace_back( std::make_pair( init->name, constant_idxs ) );
			}
				
			// Delete fluents of the current instance
			for ( unsigned p = 0; p < od->preds.size(); p++ ) {
				//if( unclean_effs.find( i ) != unclean_effs.end() ) continue;
				if( cd->preds[ p ]->params.size() ){
					parser::pddl::Forall * f = new parser::pddl::Forall;
					f->params = cd->preds[ p ]->params;
					parser::pddl::When *w = new parser::pddl::When();
					w->pars = new parser::pddl::And();
					( ( parser::pddl::And * ) w->pars )->add( cd->ground( od->preds[ p ]->name, incvec( 1, f->params.size() + 1 ) ) );
					w->cond = new parser::pddl::Not( cd->ground( od->preds[ p ]->name, incvec( 1, f->params.size() + 1 ) ) );
					f->cond = w;
					( ( parser::pddl::And * )endact->eff )->add( f );
				}
				else
					cd->addEff( 1, name, od->preds[ p ]->name );
			}
		}
		if( neg ) addCost( name, 10001 );
		else addCost( name, 1 );
	}	
};

#endif
