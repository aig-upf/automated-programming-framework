#ifndef GOTO_H
#define GOTO_H

#include "include.h"

class GotoActions : public Actions {
	public:
	GotoActions( parser::pddl::Domain *_od, parser::pddl::Domain *_cd ): Actions( _od, _cd ){}
	
	bool unsupervisedCheck( unsigned line_from, unsigned line_to, unsigned lines, unsigned noclasses ){
		// Constraints for unsupervised gotos
		if( IS_UNSUPERVISED ){
			if( line_from == 0 || line_to == 0) return false;
			unsigned program_lines = lines / noclasses;
			if( line_from % program_lines == 0 ) return false;
			if( ( line_from - 1 ) / program_lines != ( line_to - 1 ) / program_lines ) return false;
		}
		return true;
	}

	void createProgrammingAction( const String &name, const StringVec &parameters, unsigned original_size, unsigned predicate_id, unsigned procedures, unsigned line_from, unsigned line_to, const StringVec &empty_lines, const StringTVec &gotos, const StringTVec &condition ){
		createAction( name, parameters );
		addPrecondition( name, "TOP-STACK", false, IntVec( 1, original_size ) );
		addPrecondition( name, "STACK-MAIN", false, IntVec( 1, original_size ) );
		addPrecondition( name, empty_lines[ line_from ] );
		addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, original_size ) );

		//[PERFORMANCE] Adding preconditions to avoid crossing conditionals
		/*unsigned lines = empty_lines.size() - 1;
		for( unsigned line_from_2 = 0; line_from_2 < lines; line_from_2++ ){
			for( unsigned line_to_2 = 0; line_to_2 < lines + 1; line_to_2++ ){
				if( line_from_2 == line_to_2 || ( line_from_2 + 1 ) == line_to_2 )
					continue;
				if( line_from == line_from_2 && line_to == line_to_2 ) continue;
				if( line_from < line_to ){
					if( line_from_2 < line_to_2 ){
						if( line_to_2 <= line_from ) continue;
						if( line_to <= line_from_2 ) continue;
						if( line_from < line_from_2 && line_to_2 <= line_to ) continue;
					}
					else{
						if( line_from_2 < line_from ) continue;
						if( line_to <= line_to_2 ) continue;
						if( line_from < line_to_2 && line_from_2 < line_to ) continue;
					}
				}
				else{
					if( line_from_2 < line_to_2 ){
						if( line_to_2 <= line_to ) continue;
						if( line_from < line_from_2 ) continue;
						if( line_to < line_from_2 && line_to_2 <= line_from ) continue;
					}
					else{
						if( line_from_2 < line_to ) continue;
						if( line_from < line_to_2 ) continue;
						if( line_to < line_to_2 && line_from_2 < line_from ) continue;
					}
				}
				addPrecondition( name, "NOT-"+gotos[ procedures ][ line_from_2 ][ line_to_2 ] );
			}
		}
		addEffect( name, "NOT-"+gotos[ procedures ][ line_from ][ line_to ], true );*/
		//[END-OF-PERFORMANCE]

		addEffect( name, empty_lines[ line_from ], true );
		addEffect( name, gotos[ procedures ][ line_from ][ line_to ] );
		addEffect( name, condition[ predicate_id ][ procedures ][ line_from ], false, incvec( 0, original_size ) );
		
		addCost( name, 1001 );

		addActionToInstruction( name, gotos[ procedures ][ line_from ][ line_to ] );
		addActionToInstruction( name, condition[ predicate_id ][ procedures ][ line_from ] );
	}

	void createHLProgrammingAction( const String& name , unsigned procedures, unsigned line_from, unsigned line_to, const StringVec &empty_lines, const StringTVec& gotos, const StringVec &empty_slots  ){
		parser::pddl::Action *prog_goto = createAction( name, StringVec( 1, "STACKROW" ) );
		addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
		addPrecondition( name, "STACK-MAIN", false, IntVec( 1, 0 ) );
		addPrecondition( name, empty_lines[ line_from ] );
		addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, 0 ) );

		addEffect( name, empty_lines[ line_from ], true );
		addEffect( name, gotos[ procedures ][ line_from ][ line_to ] );
		
		parser::pddl::Forall *f = new parser::pddl::Forall;
		f->params = IntVec( 1, cd->types.index( "CONDITION-SLOT" ) );
		f->cond = cd->ground( empty_slots[ line_from ], IntVec( 1, 1 ) );
		( ( parser::pddl::And * )prog_goto->eff )->add( f );

		addCost( name, 1001 );

		addActionToInstruction( name, gotos[ procedures ][ line_from ][ line_to ] );
	}

	void createProgrammingActions( unsigned procedures, unsigned lines, StringVec& empty_lines, StringTVec &condition, StringTVec& gotos, StringVec &empty_slots, unsigned noclasses = 0, bool negated_goto = false ){
		String prefix_name = "PROGRAM-GOTO";

		for( unsigned line_from = 0; line_from < lines; line_from++ ){
			for( unsigned line_to = 0; line_to < lines + 1; line_to++ ){
				if( line_from == line_to || line_from + 1 == line_to ) continue;
				if( !unsupervisedCheck( line_from, line_to, lines, noclasses ) ) continue;
				if( IS_HIGH_LEVEL ){
					if( negated_goto ){
						String name = prefix_name + "-NEGATED-" + tostr( line_from ) + "-" + tostr( line_to );
						createHLProgrammingAction( name, procedures, line_from, line_to, empty_lines, gotos, empty_slots );
						
					}
					else{
						String name = prefix_name + "-" + tostr( line_from ) + "-" + tostr( line_to );
						createHLProgrammingAction( name, procedures, line_from, line_to, empty_lines, gotos, empty_slots );
					}
				}
				else{
					for( int predicate_id : effs ){
						StringVec parameters = od->typeList( od->preds[ predicate_id ] );
						parameters.emplace_back( "STACKROW" );
						unsigned osize = od->preds[ predicate_id ]->params.size();
						if( negated_goto ){
							String name = prefix_name + "-NEGATED-" + cd->preds[ predicate_id ]->name + "-" + tostr( line_from ) + "-" + tostr( line_to );
							createProgrammingAction( name, parameters, osize, predicate_id, procedures, line_from, line_to, empty_lines, gotos, condition );
						}
						else{
							String name = prefix_name + "-" + cd->preds[ predicate_id ]->name + "-" + tostr( line_from ) + "-" + tostr( line_to );
							createProgrammingAction( name, parameters, osize, predicate_id, procedures, line_from, line_to, empty_lines, gotos, condition );
						}
					}
				}
			}
		}
	}

	void createDoGotoActions( bool donot, unsigned procedures, unsigned lines, StringTVec& gotos, unsigned noclasses = 0, bool negated_goto = false ){
		String prefix_name = "DO-GOTO";
		if( donot ) prefix_name = "DONT-GOTO";
		if( negated_goto ) prefix_name += "-NEGATED";

		for( unsigned procedure = 0; procedure < procedures + 1; procedure++ ){
			for( unsigned line_from = 0; line_from < lines; line_from++ ){
				for( unsigned line_to = 0; line_to < lines + 1; line_to++ ){
					if( line_from == line_to || line_from + 1 == line_to ) continue;
					if( !unsupervisedCheck( line_from, line_to, lines, noclasses ) ) continue;
					String name = prefix_name + "-" + tostr( procedure ) + "-" + tostr( line_from ) + "-" + tostr( line_to );

					createAction( name, StringVec( 1, "STACKROW" ) );

					addPrecondition( name, gotos[ procedure ][ line_from ][ line_to ] );
					addPrecondition( name, eval_pred );

					if( compiler_type == "TWO-STEPS-2" ){
						addPrecondition( name, "MODE-COND", false );
					}

					if( donot ){
						if( negated_goto )
							addPrecondition( name, accu_pred, true );
						else
							addPrecondition( name, accu_pred );
					}
					else{
						if( negated_goto )
							addPrecondition( name, accu_pred );
						else						
							addPrecondition( name, accu_pred, true );
					}
					addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, 0 ) );

					addEffect( name, eval_pred, true );
					addEffect( name, stack_lines[ line_from ], true, IntVec( 1, 0 ) );
					if( donot ){
						if( !negated_goto )
							addEffect( name, accu_pred, true );
						addEffect( name, stack_lines[ line_from + 1 ], false, IntVec( 1, 0 ) );
					}
					else{
						if( negated_goto )
							addEffect( name, accu_pred, true );
						addEffect( name, stack_lines[ line_to ], false, IntVec( 1, 0 ) );
					}

					addCost( name, 1 ) ;
				}
			}
		}
	}

	void createEvalActions( unsigned procedures, unsigned lines, StringTVec &conds, unsigned noclasses = 0, bool negated_goto = false ){
		for( int effect_id : effs ){
			String prefix_name = od->preds[ effect_id ]->name;
			if( negated_goto )
				prefix_name = "NEGATED-" + prefix_name;
			unsigned osize = od->preds[ effect_id ]->params.size();
			StringVec parameters = od->typeList( od->preds[ effect_id ] );
			parameters.emplace_back( "STACKROW" );

			for( unsigned procedure = 0; procedure < procedures + 1; procedure++ ){
				for( unsigned line = 0; line < lines; line++ ){ 
					if( !unsupervisedCheck( line, line, lines, noclasses ) ) continue;

					String name = "EVAL-COND-" + prefix_name + "-" + tostr( procedure ) + "-" + tostr( line );

					parser::pddl::Action *eval = createAction( name, parameters );
					addPrecondition( name, conds[ effect_id ][ procedure ][ line ], false, incvec( 0, osize ) );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1, osize ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1, osize ) );
					addPrecondition( name, stack_lines[ line ], false, IntVec( 1, osize ) );

					if( compiler_type == "TWO-STEPS-2" ){
						addPrecondition( name, "MODE-COND", false );
					}

					addEffect( name, eval_pred );

					if( EVAL_DERIVED && !IS_HIGH_LEVEL ){
						addPrecondition( name, "DONE-DERIVED" );

						addEffect( name, "DONE-DERIVED", true );
						addEffect( name, "TODO-DERIVED" );
					}

					parser::pddl::When *w = new parser::pddl::When;
					w->cond = new parser::pddl::And;

					if( negated_goto )
						( (parser::pddl::And *) w->cond )->add( new parser::pddl::Not( cd->ground( accu_pred ) ) );
					else
						( (parser::pddl::And *) w->cond )->add( cd->ground( accu_pred ) );
				
					if( unclean_effs.find( effect_id ) == unclean_effs.end() ){
						// It is not a derived predicate
						w->pars = cd->ground( prefix_name, incvec( 0, osize ) );
						addStackRow( w , osize );
						( ( parser::pddl::And * )eval->eff )->add( w );
					}
					else{
						// Derived predicates as effects of eval actions
						for ( unsigned derived_id = 0; derived_id < od->derived.size(); derived_id++ ){
							if( od->derived[ derived_id ]->name != prefix_name ) continue;
							unsigned dsize = od->derived[ derived_id ]->params.size();
							IntVec derived_params = incvec( 0 , dsize );

							( ( parser::pddl::And * )eval->eff )->add( new parser::pddl::Not( cd->ground( prefix_name, derived_params ) ) );

							( ( parser::pddl::And *) w->cond)->add( cd->ground( prefix_name, derived_params ) );
						
							parser::pddl::Exists * exists = dynamic_cast< parser::pddl::Exists * >( od->derived[ derived_id ]->cond );

							if ( exists ) {
								w->pars = exists->cond->copy( *cd );
								w->addParams( dsize, 1 );

								parser::pddl::Forall * f = new parser::pddl::Forall;
								f->params = exists->params;
								f->cond = w;

								addStackRow( f, osize );

								( ( parser::pddl::And * )eval->eff )->add( f );
							}
							else {
								w->pars = od->derived[ derived_id ]->cond->copy( *cd );
								w->addParams( dsize, 1 );

								addStackRow( w, osize );

								( ( parser::pddl::And * )eval->eff )->add( w );
							}
							break;
						}
					}

					addCost( name, 1 );
				}
			}
		}
	}

	void createRepeatActions( unsigned procedures, unsigned lines, StringTVec& gotos, StringTVec& conds, unsigned noclasses = 0, bool negated_goto = false ){
		createDoGotoActions( false, procedures, lines, gotos, noclasses, negated_goto );
		createDoGotoActions( true,  procedures, lines, gotos, noclasses, negated_goto );
		if( !IS_HIGH_LEVEL )
			createEvalActions( procedures, lines, conds, noclasses, negated_goto );
	}

	void createFSCProgrammingActions( unsigned procedures, const StringVec& evaluating_preds, const StringVec &accumulator_preds, const StringVec &action_preds, const StringVec &nconds, const StringDVec &conds, const StringVec &tgotos, const StringVec &fgotos ){ // Goto actions
		// Program NO-CONDITION
		SStream ss;
		String name;

		if( compiler_type == "HFSC" ){
			ss << "PROGRAM-NOCOND-" << procedures;
			name = ss.str();
		
			createAction( name , StringVec() = { "STACKSTATE", "STACKROW" } );

			addPrecondition( name, stack_top_pred, false, IntVec( 1 , 1 ) );
			addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_state_pred, false, incvec( 0 , 2 ) );
			addPrecondition( name, stack_empty_cond_pred, false, IntVec( 1 , 0 ) );
		
			addEffect( name, stack_empty_cond_pred, true, IntVec( 1 , 0 ) );
			addEffect( name, nconds[ procedures ], false, IntVec( 1 , 0 ) );
			
			// Add instruction
			addActionToInstruction( name, nconds[ procedures ] );

			for ( IntSet::iterator eff = effs.begin(); eff != effs.end(); ++eff ){
				// Program condition
				ss.str("");
				ss << "PROGRAM-COND-" << od->preds[ *eff ]->name << "-" << procedures;
				name = ss.str();
				StringVec params = od->typeList( od->preds[ *eff ] );
				params.push_back( "STACKSTATE" );
				params.push_back( "STACKROW" );
				unsigned par_size = params.size();
				createAction( name, params );

				addPrecondition( name, stack_top_pred, false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, par_size - 1 ) );
				addPrecondition( name, stack_state_pred, false, incvec( par_size - 2 , par_size ) );
				addPrecondition( name, stack_empty_cond_pred, false, IntVec( 1 , par_size - 2 ) );

				addEffect( name, stack_empty_cond_pred, true, IntVec( 1 , par_size - 2 ) );
				addEffect( name, conds[ *eff ][ procedures ], false, incvec( 0, par_size - 1 ) );

				// Add instruction
				addActionToInstruction( name, conds[ *eff ][ procedures ] );
			}
		}
		else if( compiler_type == "NFA2" ){
			name = "PROGRAM-NOCOND";
		
			createAction( name , StringVec() = { "STACKSTATE" } );

			addPrecondition( name, stack_state_pred, false, IntVec( 1 , 0 ) );
			addPrecondition( name, stack_empty_cond_pred, false, IntVec( 1 , 0 ) );
			addPrecondition( name, "DONE-STRUCTURE" );

			addEffect( name, stack_empty_cond_pred, true, IntVec( 1 , 0 ) );
			addEffect( name, nconds[ procedures ], false, IntVec( 1 , 0 ) );
			
			// Add instruction
			addActionToInstruction( name, nconds[ procedures ] );

			for ( IntSet::iterator eff = effs.begin(); eff != effs.end(); ++eff ){
				// Program condition
				ss.str("");
				ss << "PROGRAM-COND-" << od->preds[ *eff ]->name ;
				name = ss.str();
				StringVec params = od->typeList( od->preds[ *eff ] );
				params.push_back( "STACKSTATE" );
				unsigned par_size = params.size();
				createAction( name, params );
	
				addPrecondition( name, "DONE-STRUCTURE" );
				addPrecondition( name, stack_state_pred, false, incvec( par_size - 1 , par_size ) );
				addPrecondition( name, stack_empty_cond_pred, false, IntVec( 1 , par_size - 1 ) );

				addEffect( name, stack_empty_cond_pred, true, IntVec( 1 , par_size - 1 ) );
				addEffect( name, conds[ *eff ][ procedures ], false, incvec( 0, par_size ) );

				// Add instruction
				addActionToInstruction( name, conds[ *eff ][ procedures ] );
			}
		}

		// Program TRUE GOTO
		ss.str("");
		if( compiler_type == "HFSC" )
			ss << "PROGRAM-TRUE-GOTO-" << procedures;
		else if( compiler_type == "NFA" or compiler_type == "NFA2" )
			ss << "PROGRAM-TRUE-GOTO";
		name = ss.str();

		parser::pddl::Action *prog_tgoto = NULL;

		if( compiler_type == "HFSC" ){
			prog_tgoto = createAction( name , StringVec() = { "STACKSTATE" , "STACKSTATE", "STACKROW" } );
			addPrecondition( name, evaluating_preds[ procedures ], false, IntVec( 1 , 2 ) );
			addPrecondition( name, accumulator_preds[ procedures ] , false, IntVec( 1 , 2 ) );
			addPrecondition( name, action_preds[ procedures ], false, IntVec( 1 , 2 ) );
			addPrecondition( name, stack_top_pred, false, IntVec( 1 , 2 ) );
			addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, 2 ) );
			addPrecondition( name, stack_state_pred, false, IntVec() = { 0, 2 } );
		}
		else if( compiler_type == "NFA" or compiler_type == "NFA2" ){
			prog_tgoto = createAction( name , StringVec() = { "STACKSTATE" , "STACKSTATE" } );
			addPrecondition( name, stack_state_pred, false, IntVec() = { 0 } );
			addPrecondition( name, "TRUE-APPLIED" );
			addPrecondition( name, "EVAL-TRUE" );
		}

		addPrecondition( name, stack_empty_tgoto_pred, false, IntVec( 1 , 0 ) );
		addPrecondition( name, available_pred, false, IntVec( 1, 1 ) );

		addEffect( name, stack_empty_tgoto_pred, true, IntVec( 1 , 0 ) );
		addEffect( name, tgotos[ procedures ], false, incvec( 0 , 2 ) );


		parser::pddl::When *wtgoto = new parser::pddl::When;
		if( compiler_type == "HFSC" ){
			wtgoto->pars = cd->ground( next_state_pred , IntVec() = { 1, 3 } );
			wtgoto->cond = cd->ground( available_pred , IntVec() = { 3 } );
		}	
		else if( compiler_type == "NFA" or compiler_type == "NFA2" ){
			wtgoto->pars = cd->ground( next_state_pred , IntVec() = { 1, 2 } );
			wtgoto->cond = cd->ground( available_pred , IntVec() = { 2 } );
		}

		parser::pddl::Forall *ftgoto = new parser::pddl::Forall;
		ftgoto->params = cd->preds.get( available_pred )->params;
		ftgoto->cond = wtgoto;
	
		( ( parser::pddl::And * ) prog_tgoto->eff )->add( ftgoto );

		// Add instruction
		addActionToInstruction( name, tgotos[ procedures ] );

		// Program FALSE GOTO
		ss.str( "" );
		if( compiler_type == "HFSC" )
			ss << "PROGRAM-FALSE-GOTO-" << procedures;
		else if( compiler_type == "NFA" or compiler_type == "NFA2" )
			ss << "PROGRAM-FALSE-GOTO";
		name = ss.str();

		parser::pddl::Action *prog_fgoto = NULL;

		if( compiler_type == "HFSC" ){
			prog_fgoto  = createAction( name , StringVec() = { "STACKSTATE" , "STACKSTATE", "STACKROW" } );

			addPrecondition( name, evaluating_preds[ procedures ], false, IntVec( 1 , 2 ) );
			addPrecondition( name, accumulator_preds[ procedures ], true, IntVec( 1 , 2 ) );
			addPrecondition( name, action_preds[ procedures ] , false, IntVec( 1 , 2 ) );
			addPrecondition( name, stack_top_pred, false, IntVec( 1 , 2 ) );
			addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, 2 ) );
			addPrecondition( name, stack_state_pred, false, IntVec() = { 0, 2 } );
		}
		else if( compiler_type == "NFA" or compiler_type == "NFA2" ){
			prog_fgoto  = createAction( name , StringVec() = { "STACKSTATE" , "STACKSTATE" } );

			addPrecondition( name, stack_state_pred, false, IntVec() = { 0 } );
			addPrecondition( name, "FALSE-APPLIED" );
			addPrecondition( name, "EVAL-FALSE" );
		}

		addPrecondition( name, stack_empty_fgoto_pred, false, IntVec( 1 , 0 ) );
		addPrecondition( name, available_pred, false, IntVec( 1, 1 ) );

		addEffect( name, stack_empty_fgoto_pred, true, IntVec( 1 , 0 ) );
		addEffect( name, fgotos[ procedures ], false, incvec( 0 , 2 ) );

		parser::pddl::When *wfgoto = new parser::pddl::When;
		if( compiler_type == "HFSC" ){
			wfgoto->pars = cd->ground( next_state_pred , IntVec() = { 1, 3 } );
			wfgoto->cond = cd->ground( available_pred , IntVec() = { 3 } );
		}
		else if( compiler_type == "NFA" or compiler_type == "NFA2" ){
			wfgoto->pars = cd->ground( next_state_pred , IntVec() = { 1, 2 } );
			wfgoto->cond = cd->ground( available_pred , IntVec() = { 2 } );
		}

		parser::pddl::Forall *ffgoto = new parser::pddl::Forall;
		ffgoto->params = cd->preds.get( available_pred )->params;
		ffgoto->cond = wfgoto;
	
		( ( parser::pddl::And * ) prog_fgoto->eff )->add( ffgoto );

		// Add instruction
		addActionToInstruction( name, fgotos[ procedures ] );
	}

	void createFSCTrueGotoActions( unsigned procedures, const StringVec& evaluating_preds, const StringVec &accumulator_preds, const StringVec &action_preds, const StringVec &tgotos ){
		for( unsigned p = 0; p < procedures + 1; p++){
			// Repeat TRUE GOTO
			SStream ss;
			if( compiler_type == "HFSC" )
				ss << "REPEAT-TRUE-GOTO-" << p ;
			else if( compiler_type == "NFA" or compiler_type == "NFA2" )
				ss << "EXECUTE-TRUE-GOTO";
			String name = ss.str();

			if( compiler_type == "HFSC" )
				createAction( name , StringVec() = { "STACKSTATE", "STACKSTATE", "STACKROW" } );
			else if( compiler_type == "NFA" or compiler_type == "NFA2" )
				createAction( name, StringVec() = { "STACKSTATE", "STACKSTATE" } );

			addPrecondition( name, tgotos[ p ], false, incvec( 0 , 2 ) );

			if( compiler_type == "HFSC" ){
				addPrecondition( name, stack_top_pred, false,IntVec( 1, 2 ) );
				addPrecondition( name, stack_procedures[ p ], false, IntVec( 1, 2 ) );
				addPrecondition( name, stack_state_pred, false, IntVec() = { 0, 2 } );
				addPrecondition( name, action_preds[ p ], false, IntVec( 1, 2 ) );
				addPrecondition( name, evaluating_preds[ p ], false,  IntVec( 1, 2 )  );
				addPrecondition( name, accumulator_preds[ p ], false,  IntVec( 1, 2 ) );
						
				addEffect( name, evaluating_preds[ p ], true,  IntVec( 1, 2 ) );
				addEffect( name, accumulator_preds[ p ], true, IntVec( 1, 2 ) );
				addEffect( name, action_preds[ p ], true, IntVec( 1, 2 ) );
				addEffect( name, stack_state_pred, true, IntVec() = { 0, 2 }  );
				addEffect( name, stack_state_pred, false, IntVec() = { 1, 2 }  );
			}
			else if( compiler_type == "NFA" or compiler_type == "NFA2" ){
				addPrecondition( name, stack_state_pred, false, IntVec() = { 0 } );
				addPrecondition( name, "EVAL-TRUE" );
				addPrecondition( name, "TRUE-APPLIED" );

				addEffect( name, stack_state_pred, true, IntVec() = { 0 }  );
				addEffect( name, stack_state_pred, false, IntVec() = { 1 }  );
				addEffect( name, "TRUE-APPLIED", true );
				addEffect( name, "EVAL-TRUE", true );
			}
		}
	}

	void createFSCFalseGotoActions(unsigned procedures, const StringVec& evaluating_preds, const StringVec &accumulator_preds, const StringVec &action_preds, const StringVec &fgotos ){
		for( unsigned p = 0; p < procedures + 1; p++){
			// Repeat FALSE GOTO
			SStream ss;
			if( compiler_type == "HFSC" )
				ss << "REPEAT-FALSE-GOTO-" << p ;
			else if( compiler_type == "NFA" or compiler_type == "NFA2" )
				ss << "EXECUTE-FALSE-GOTO" ;
			String name = ss.str();

			if( compiler_type == "HFSC" )
				createAction( name , StringVec() = { "STACKSTATE", "STACKSTATE", "STACKROW" } );
			else if( compiler_type == "NFA" or compiler_type == "NFA2" )				
				createAction( name , StringVec() = { "STACKSTATE", "STACKSTATE" } );

			addPrecondition( name, fgotos[ p ], false, incvec( 0 , 2 ) );

			if( compiler_type == "HFSC" ){
				addPrecondition( name, stack_top_pred, false,IntVec( 1, 2 ) );
				addPrecondition( name, stack_procedures[ p ], false, IntVec( 1, 2 ) );
				addPrecondition( name, stack_state_pred, false, IntVec() = { 0, 2 } );
				addPrecondition( name, action_preds[ p ], false, IntVec( 1, 2 ) );
				addPrecondition( name, evaluating_preds[ p ], false,  IntVec( 1, 2 )  );
				addPrecondition( name, accumulator_preds[ p ], true,  IntVec( 1, 2 ) );

				addEffect( name, evaluating_preds[ p ], true,  IntVec( 1, 2 ) );
				addEffect( name, action_preds[ p ], true, IntVec( 1, 2 ) );
				addEffect( name, stack_state_pred, true, IntVec() = { 0, 2 }  );
				addEffect( name, stack_state_pred, false, IntVec() = { 1, 2 }  );
			}
			else if( compiler_type == "NFA" or compiler_type == "NFA2" ){
				addPrecondition( name, stack_state_pred, false, IntVec() = { 0 } );
				addPrecondition( name, "FALSE-APPLIED" );
				addPrecondition( name, "EVAL-FALSE" );

				addEffect( name, stack_state_pred, true, IntVec() = { 0 }  );
				addEffect( name, stack_state_pred, false, IntVec() = { 1 }  );
				addEffect( name, "FALSE-APPLIED", true );
				addEffect( name, "EVAL-FALSE", true );
			}
		}
	}

	void createFSCEvalConditions( unsigned procedures, const StringVec& evaluating_preds, const StringVec &accumulator_preds, const StringVec &action_preds, const StringVec &nconds, const StringDVec &conds  ){
		if( compiler_type == "HFSC" or compiler_type == "NFA2" ){
			for( unsigned p = 0; p < procedures + 1; p++ ){
				// Evaluate NO CONDITION
				SStream ss;
				String name;
				if( compiler_type == "HFSC" ){
					ss << "EVAL-NOCOND-" << p;
					name = ss.str(); 

					createAction( name , StringVec() = { "STACKSTATE", "STACKROW" } );	
					addPrecondition( name, stack_top_pred, false, IntVec( 1 , 1 ) );
					addPrecondition( name, stack_procedures[ p ], false, IntVec( 1, 1 ) );

					addPrecondition( name, stack_state_pred, false, incvec( 0 , 2 ) );
					addPrecondition( name, nconds[ p ], false, IntVec( 1 , 0 ) );
					addPrecondition( name, evaluating_preds[ p ], true, IntVec( 1 , 1 ) );
						
					addEffect( name, evaluating_preds[ p ], false, IntVec( 1 , 1 ) );
					addEffect( name, accumulator_preds[ p ], false, IntVec( 1 , 1 ) );
				}
				else if( compiler_type == "NFA2" ){
					ss << "EVAL-NOCOND";
					name = ss.str(); 

					createAction( name , StringVec() = { "STACKSTATE" } );	

					addPrecondition( name, stack_state_pred, false, IntVec( 1 , 0 ) );
					addPrecondition( name, nconds[ p ], false, IntVec( 1 , 0 ) );
					//addPrecondition( name, evaluating_preds[ p ], true );
					addPrecondition( name, "EVAL-TRUE", true );
					addPrecondition( name, "EVAL-FALSE", true );
					addPrecondition( name, "DONE-STRUCTURE" );
						
					//addEffect( name, evaluating_preds[ p ], false );
					//addEffect( name, accumulator_preds[ p ], false );			
					addEffect( name, "EVAL-TRUE", false );
				}
			}

			// Evaluate conditions on each original action
			for ( IntSet::iterator eff = effs.begin(); eff != effs.end(); ++eff ){
				for( unsigned p = 0; p < procedures + 1; p++ ){ 
					SStream ss;
					if( compiler_type == "HFSC" )
						ss << "EVAL-COND-" << od->preds[ *eff ]->name << "-" << p;
					else if( compiler_type == "NFA2" )
						ss << "EVAL-COND-" << od->preds[ *eff ]->name ;

					String name = ss.str(); 
					StringVec params_aux = od->typeList( od->preds[ *eff ] );
					params_aux.push_back( "STACKSTATE" );

					if( compiler_type == "HFSC" )
						params_aux.push_back( "STACKROW" );

					unsigned par_size = params_aux.size();

					parser::pddl::Action * eval = createAction( name, params_aux );

					if( compiler_type == "HFSC" ){
						addPrecondition( name, stack_top_pred, false, IntVec( 1 , par_size - 1 ) );
						addPrecondition( name, stack_procedures[ p ], false, IntVec( 1, par_size - 1 ) );

						addPrecondition( name, stack_state_pred, false, incvec( par_size - 2 , par_size ) );
						addPrecondition( name, conds[ *eff ][ p ], false, incvec( 0, par_size - 1) );
						addPrecondition( name, evaluating_preds[ p ], true, IntVec( 1 , par_size - 1 ) );
			
						addEffect( name, evaluating_preds[ p ], false, IntVec( 1 , par_size - 1 ) );

						parser::pddl::When * w = new parser::pddl::When;
						w->cond = new parser::pddl::And;
						if ( unclean_effs.find( *eff ) == unclean_effs.end() ) {
							( ( parser::pddl::And *) w->cond)->add( cd->ground( accumulator_preds[ p ] , IntVec( 1 , par_size - 1 ) ) );
							w->pars = cd->ground( od->preds[ *eff ]->name, incvec( 0, par_size - 2 ) );
							addStackRow( w , par_size - 1 );
							( ( parser::pddl::And * )eval->eff )->add( w );
						}
						else {
							for ( unsigned j = 0; j < od->derived.size(); ++j ){
								if ( od->derived[ j ]->name == od->preds[ *eff ]->name ) {
									// To allow jumps over derived predicates
									parser::pddl::Exists * exists = dynamic_cast< parser::pddl::Exists * >( od->derived[ j ]->cond );
									if ( exists ) {
										w->pars = exists->cond->copy( *cd );
										w->addParams( od->derived[j]->params.size(), 2 );
										( ( parser::pddl::And *) w->cond )->add( cd->ground( accumulator_preds[ p ] , IntVec( 1 , par_size - 1 ) ) );
										parser::pddl::Forall * f = new parser::pddl::Forall;
										f->params = exists->params;
										f->cond = w;
										addStackRow( f, par_size - 1 );
										( ( parser::pddl::And * )eval->eff )->add( f );
									}
									else {
										w->pars = od->derived[ j ]->cond->copy( *cd );
										w->addParams( od->derived[j]->params.size(), 2 );
										( ( parser::pddl::And *) w->cond)->add( cd->ground( accumulator_preds[ p ] , IntVec( 1 , par_size - 1 ) ) );
										addStackRow( w, par_size - 1 );
										( ( parser::pddl::And * ) eval->eff )->add( w );
									}
									break;
								}
							}
						}
					}				
					else if( compiler_type == "NFA2" ){
						addPrecondition( name, stack_state_pred, false, incvec( par_size - 1 , par_size ) );
						addPrecondition( name, conds[ *eff ][ p ], false, incvec( 0, par_size) );
						//addPrecondition( name, evaluating_preds[ p ], true );
						addPrecondition( name, "EVAL-TRUE", true );
						addPrecondition( name, "EVAL-FALSE", true );
						addPrecondition( name, "DONE-STRUCTURE" );
			
						//addEffect( name, evaluating_preds[ p ], false );

						if ( unclean_effs.find( *eff ) == unclean_effs.end() ) {
							parser::pddl::When * w = new parser::pddl::When;
							w->cond = new parser::pddl::And;
							//( ( parser::pddl::And *) w->cond)->add( cd->ground( accumulator_preds[ p ] ) );
							( ( parser::pddl::And *) w->cond)->add( cd->ground( "EVAL-TRUE" ) );
							w->pars = cd->ground( od->preds[ *eff ]->name, incvec( 0, par_size - 1 ) );
							( ( parser::pddl::And * )eval->eff )->add( w );
							
							parser::pddl::When *w2 = new parser::pddl::When;
							w2->cond = new parser::pddl::And;
							( ( parser::pddl::And *) w2->cond)->add( cd->ground( "EVAL-FALSE" ) );
							w2->pars = new parser::pddl::Not( cd->ground( od->preds[ *eff ]->name, incvec( 0, par_size - 1 ) ) );
							( ( parser::pddl::And * )eval->eff )->add( w2 );
						}
						else {
							for ( unsigned j = 0; j < od->derived.size(); ++j ){
								if ( od->derived[ j ]->name == od->preds[ *eff ]->name ) {
									// To allow jumps over derived predicates
									parser::pddl::Exists * exists = dynamic_cast< parser::pddl::Exists * >( od->derived[ j ]->cond );
									if ( exists ) {
										parser::pddl::When * w = new parser::pddl::When;
										w->cond = new parser::pddl::And;
										w->pars = exists->cond->copy( *cd );
										w->addParams( od->derived[j]->params.size(), par_size );
										( ( parser::pddl::And *) w->cond )->add( cd->ground( "EVAL-TRUE" ) );
										parser::pddl::Forall * f = new parser::pddl::Forall;
										f->params = exists->params;
										f->cond = w;
										( ( parser::pddl::And * )eval->eff )->add( f );

										/*parser::pddl::When * w2 = new parser::pddl::When; // [TODO] NFA2
										w2->cond = new parser::pddl::And;
										w2->pars = new parser::pddl::Not( exists->cond->copy( *cd ) );
										w2->addParams( od->derived[j]->params.size(), par_size );
										( ( parser::pddl::And *) w2->cond )->add( cd->ground( "EVAL-FALSE" ) );
										parser::pddl::Forall * f2 = new parser::pddl::Forall;
										f2->params = exists->params;
										f2->cond = w2;
										( ( parser::pddl::And * )eval->eff )->add( f2 );*/
									}
									else {
										parser::pddl::When * w = new parser::pddl::When;
										w->cond = new parser::pddl::And;
										w->pars = od->derived[ j ]->cond->copy( *cd );
										w->addParams( od->derived[j]->params.size(), par_size );
										( ( parser::pddl::And *) w->cond)->add( cd->ground( "EVAL-TRUE" ) );
										( ( parser::pddl::And * ) eval->eff )->add( w );

										/*parser::pddl::When * w2 = new parser::pddl::When; // [TODO] NFA2
										w2->cond = new parser::pddl::And;
										//w2->pars = new parser::pddl::Not( od->derived[ j ]->cond->copy( *cd ) );
										w2->pars = od->derived[ j ]->cond->copy( *cd );
										w2->addParams( od->derived[j]->params.size(), par_size );
										w2->pars = new parser::pddl::Not( cd->ground( w2->pars ) );
										( ( parser::pddl::And *) w2->cond)->add( cd->ground( "EVAL-FALSE" ) );
										( ( parser::pddl::And * ) eval->eff )->add( w2 );*/
									}
									break;
								}
							}
						}
					}					
				}
			}
		}
		if( compiler_type == "NFA" or compiler_type == "NFA2" ){
			String name = "TRUE-EVALUATION";
			createAction( name );
			addPrecondition( name, "EVAL-TRUE", true );
			addPrecondition( name, "EVAL-FALSE", true );
			if( compiler_type == "NFA2" )
				addPrecondition( name, "DONE-STRUCTURE", true );
			addEffect( name, "EVAL-TRUE" );

			name = "FALSE-EVALUATION" ;
			createAction( name );
			addPrecondition( name, "EVAL-TRUE", true );
			addPrecondition( name, "EVAL-FALSE", true );
			if( compiler_type == "NFA2" )
				addPrecondition( name, "DONE-STRUCTURE", true );
			addEffect( name, "EVAL-FALSE" );
		}
	}

	void createProgrammingActionsNoConds( unsigned procedures, unsigned lines, StringVec& empty_lines, StringTVec& gotos){
		String prefix_name = "PROGRAM-GOTO";


		if( max_gotos == 0 ){
			for( unsigned line_from = 0; line_from < lines; line_from++ ){
				for( unsigned line_to = 0; line_to < lines + 1; line_to++ ){
					if( line_from == line_to || line_from + 1 == line_to ) continue;
					String name = "PROGRAM-GOTO-" + tostr( line_from ) + "-" + tostr( line_to );
					createAction( name, StringVec() = {"STACKROW" } );

					addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
					addPrecondition( name, "STACK-MAIN", false, IntVec( 1, 0 ) );
					addPrecondition( name, empty_lines[ line_from ] );
					addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, 0 ) );

					if( compiler_type == "TWO-STEPS-2" ){
						addPrecondition( name, "MODE-STRUCTURE", false );
						addEffect( name, "EMPTY-COND-" + tostr( line_from ), false );
					}
				
					addEffect( name, empty_lines[ line_from ], true );
					addEffect( name, gotos[ procedures ][ line_from ][ line_to ] );

					addCost( name, 1001 );

					addActionToInstruction( name, gotos[ procedures ][ line_from ][ line_to ] );	
				}
			}
			return;
		}
		for( unsigned line_from = 0; line_from < lines; line_from++ ){
			for( unsigned line_to = 0; line_to < lines + 1; line_to++ ){
				if( line_from == line_to || line_from + 1 == line_to ) continue;
					for( unsigned cg = 0; cg < max_gotos + 1; cg++ ){
						String name = "PROGRAM-GOTO-" + tostr( line_from ) + "-" + tostr( line_to ) + "-" + tostr( cg );
						createAction( name, StringVec() = {"STACKROW"} );

						addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
						addPrecondition( name, "STACK-MAIN", false, IntVec( 1, 0 ) );
						addPrecondition( name, empty_lines[ line_from ] );
						addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, 0 ) );

						int cg_idx = cd->constantIndex( "CG-" + tostr( cg ) , "NUM-GOTOS" );
						int ng_idx = cd->constantIndex( "CG-" + tostr( cg + 1 ), "NUM-GOTOS" );

						addPrecondition( name, "CURRENT-GOTOS", false, IntVec( 1, cg_idx ) );

						addEffect( name, empty_lines[ line_from ], true );
						addEffect( name, gotos[ procedures ][ line_from ][ line_to ] );
				
						addEffect( name, "CURRENT-GOTOS", true, IntVec( 1, cg_idx ) );
						addEffect( name, "CURRENT-GOTOS", false, IntVec( 1, ng_idx ) );

						addCost( name, 1001 );

						addActionToInstruction( name, gotos[ procedures ][ line_from ][ line_to ] );	
					}
				}
			}
	}

	// 
	/*void evalGotoNoCond( unsigned procedures, unsigned lines ){
		for( unsigned procedure = 0; procedure < procedures + 1; procedure++ ){
				for( unsigned line = 0; line < lines; line++ ){ 
					String name = "EVAL-TRUE-" + tostr( procedure ) + "-" + tostr( line );

					createAction( name, StringVec( 1, "STACKROW" ) );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_lines[ line ], false, IntVec( 1, 0 ) );
					addPrecondition( name, eval_pred, true );

					addEffect( name, eval_pred );
					addEffect( name, accu_pred );

					addCost( name, 1 );
					
					name = "EVAL-FALSE-" + tostr( procedure ) + "-" + tostr( line );
					
					createAction( name, StringVec( 1, "STACKROW" ) );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_lines[ line ], false, IntVec( 1, 0 ) );
					addPrecondition( name, eval_pred, true );

					addEffect( name, eval_pred );
					//addEffect( name, accu_pred );

					addCost( name, 1 );
				}
			}
	}*/

	void createExecuteGotoActionsNoCond( unsigned procedures, unsigned lines, StringTVec& gotos ){
		for( unsigned procedure = 0; procedure < procedures + 1; procedure++ ){
			for( unsigned line_from = 0; line_from < lines; line_from++ ){
				for( unsigned line_to = 0; line_to < lines + 1; line_to++ ){
					if( line_from == line_to || line_from + 1 == line_to ) continue;
					String name = "EXECUTE-GOTO-FALSE-" + tostr( procedure ) + "-" + tostr( line_from ) + "-" + tostr( line_to );

					createAction( name, StringVec( 1, "STACKROW" ) );

					addPrecondition( name, gotos[ procedure ][ line_from ][ line_to ] );
					//addPrecondition( name, eval_pred );
					//addPrecondition( name, accu_pred );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, 0 ) );

					if( compiler_type == "TWO-STEPS-2" ){
						addPrecondition( name, "MODE-STRUCTURE", false );
					}

					addEffect( name, stack_lines[ line_from ], true, IntVec( 1, 0 ) );
					addEffect( name, stack_lines[ line_from + 1 ], false, IntVec( 1, 0 ) );
					//addEffect( name, eval_pred, true );
					//addEffect( name, accu_pred, true );

					addCost( name, 1 ) ;
			
					name = "EXECUTE-GOTO-TRUE-" + tostr( procedure ) + "-" + tostr( line_from ) + "-" + tostr( line_to );

					createAction( name, StringVec( 1, "STACKROW" ) );

					addPrecondition( name, gotos[ procedure ][ line_from ][ line_to ] );
					//addPrecondition( name, eval_pred );
					//addPrecondition( name, accu_pred, true );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1, 0 ) );
					addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, 0 ) );

					if( compiler_type == "TWO-STEPS-2" ){
						addPrecondition( name, "MODE-STRUCTURE", false );
					}

					addEffect( name, stack_lines[ line_from ], true, IntVec( 1, 0 ) );
					addEffect( name, stack_lines[ line_to ], false, IntVec( 1, 0 ) );
					//addEffect( name, eval_pred, true );

					addCost( name, 1 );
				}
			}
		}
	}

	void createProgrammingActionConds( unsigned procedures, unsigned lines, StringTVec &condition, StringTVec& gotos ){
		String prefix_name = "PROGRAM-COND";

		for( unsigned line_from = 0; line_from < lines; line_from++ ){
			for( int predicate_id : effs ){
				StringVec parameters = od->typeList( od->preds[ predicate_id ] );
				parameters.emplace_back( "STACKROW" );
				unsigned osize = od->preds[ predicate_id ]->params.size();
				String name = prefix_name + "-" + cd->preds[ predicate_id ]->name + "-" + tostr( line_from ) ;
				//createProgrammingAction( name, parameters, osize, predicate_id, procedures, line_from, empty_lines, gotos, condition );	
				createAction( name, parameters );
				addPrecondition( name, "TOP-STACK", false, IntVec( 1, osize ) );
				addPrecondition( name, "STACK-MAIN", false, IntVec( 1, osize ) );
				addPrecondition( name, "EMPTY-COND-" + tostr( line_from ) );
				addPrecondition( name, stack_lines[ line_from ], false, IntVec( 1, osize ) );
				addPrecondition( name, "MODE-COND", false );

				addEffect( name, "EMPTY-COND-" + tostr( line_from ), true );
				addEffect( name, condition[ predicate_id ][ procedures ][ line_from ], false, incvec( 0, osize ) );
		
				addCost( name, 1 );

				addActionToInstruction( name, condition[ predicate_id ][ procedures ][ line_from ] );
			}
		}
	}


};


#endif
