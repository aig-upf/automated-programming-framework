#ifndef SEQUENTIAL_H
#define SEQUENTIAL_H

#include "actions.h"

class SequentialActions : public Actions {
	public:
	SequentialActions( parser::pddl::Domain *_od, parser::pddl::Domain *_cd ): Actions( _od, _cd ){}

	void createProgrammingActions( unsigned procedures, unsigned lines, StringVec& empty_lines, StringTVec& instruction ){
		for( unsigned action_id = 0; action_id < od->actions.size(); action_id++ ){
			// Get original action data
			parser::pddl::Action *oact = od->actions[ action_id ];
			String oname = oact->name;
			unsigned osize = oact->params.size();
			StringVec parameters = od->typeList( oact );
			parameters.push_back( "STACKROW" );

			// Prepare compiled sequential programming actions
			String prefix_name = "PROGRAM-" + oname; 
			createValuedActions( prefix_name, lines, 0, parameters ); 
			StringVec action_names = getNames( prefix_name );

			for( unsigned line = 0; line < action_names.size(); line++ ){
				String name = action_names[ line ];

				copyPreconditions( oname, name ); 
				addParameters( name, osize, 1 ); 
					
				addPrecondition( name, empty_lines[ line ] ); 
				addPrecondition( name, stack_lines[ line ], false, IntVec( 1, osize ) ); 
				addPrecondition( name, "TOP-STACK", 		 false, IntVec( 1, osize ) ); 
				addPrecondition( name, "STACK-MAIN", 		 false, IntVec( 1, osize ) ); 
			
				if( compiler_type == "TWO-STEPS-2" ){
					addPrecondition( name, "MODE-STRUCTURE", false );
				}

				addEffect( name, empty_lines[ line ], true );
				//addEffect( name, instruction[ action_id ][ procedures ][ line ], false, incvec( 0 , ( !LIFTED_INSTR && ( IS_HIGH_LEVEL || INSTR_WITH_PARAMS ) ) ? osize : 0 ) );
				
				if( LIFTED_INSTR ) {
					unsigned paridx = 0;
					while( paridx < parameters.size() ){
						if( parameters[ paridx ] == "RELATION" || parameters[ paridx ] == "VARIABLE" ) paridx++;
						else break;
					}
					addEffect( name, instruction[ action_id ][ procedures ][ line ], false, incvec( 0 , paridx ) );
				}
				else {
					addEffect( name, instruction[ action_id ][ procedures ][ line ], false, incvec( 0 , ( ( IS_HIGH_LEVEL || INSTR_WITH_PARAMS ) ) ? osize : 0 ) );
				}

				addCost( name, 1001 );
			
				addActionToInstruction( name, instruction[ action_id ][ procedures ][ line ] );	
			}
		}
	}
	
	void createRepeatActions( unsigned procedures, unsigned lines, StringTVec& instruction ){
		for( unsigned action_id = 0; action_id < od->actions.size(); action_id++ ){
			// Get original action data
			parser::pddl::Action *oact = od->actions[ action_id ];
			String oname = oact->name;
			unsigned osize = oact->params.size();
			StringVec parameters = od->typeList( oact );
			parameters.push_back( "STACKROW" );
		
			// Prepare new action
			String name_prefix = "REPEAT-" + oname;
			createDValuedActions( name_prefix, procedures + 1, lines, 0, 0, parameters );
			StringVec action_prefixes = getNames( name_prefix );

			for( unsigned procedure = 0; procedure < action_prefixes.size(); procedure++ ){
				StringVec action_names = getNames( action_prefixes[ procedure ] );
				for( unsigned line = 0; line < action_names.size(); line++ ){
					String name = action_names[ line ];

					parser::pddl::Action *act = getAction( cd, name );
					copyPreconditions( oname, name ); 
					addParameters( name, osize, 1 ); 

					addPrecondition( name, "TOP-STACK", false, IntVec( 1 , osize ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1 , osize ) );
					addPrecondition( name, stack_lines[ line ], false, IntVec( 1 , osize ) );
					//addPrecondition( name, instruction[ action_id ][ procedure ][ line ], false, incvec( 0 , ( !LIFTED_INSTR && ( IS_HIGH_LEVEL || INSTR_WITH_PARAMS ) ) ? osize : 0 ) ); 
				
					if( LIFTED_INSTR ) {
						unsigned paridx = 0;
						while( paridx < parameters.size() ){
							if( parameters[ paridx ] == "RELATION" || parameters[ paridx ] == "VARIABLE" ) paridx++;
							else break;
						}
						addPrecondition( name, instruction[ action_id ][ procedure ][ line ], false, incvec( 0 , paridx ) );
					}
					else {
						addPrecondition( name, instruction[ action_id ][ procedure ][ line ], false, incvec( 0 , ( ( IS_HIGH_LEVEL || INSTR_WITH_PARAMS ) ) ? osize : 0 ) );
					}


					copyEffects( oname, name );
					addParameters( name, osize, 1, false );
					addEffect( name, stack_lines[ line ], true, IntVec( 1, osize ) );
					addEffect( name, stack_lines[ line + 1 ], false, IntVec( 1, osize ) );

					addStackRow( act->pre, osize );
					addStackRow( act->eff, osize );

					addCost( name, 1 );
				}
			}
		}
	}

	void createFSCProgrammingActions( unsigned procedures, const StringVec &accumulator_preds, const StringVec &evaluating_preds, const StringDVec &tacts, const StringDVec &facts, const StringVec& true_no_act_preds, const StringVec & false_no_act_preds ){
		// Program NO-ACT in True transition
		SStream ss;
		ss << "PROGRAM-TRUE-NO-ACT-" << procedures;
		String name = ss.str();

		if( compiler_type == "HFSC" ){
			createAction( name, StringVec() = { "STACKSTATE", "STACKROW" } );

			addPrecondition( name, stack_empty_tact_pred, false, IntVec( 1, 0 ) );
			addPrecondition( name, stack_top_pred, false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_state_pred, false, incvec( 0, 2 ) );
			addPrecondition( name, evaluating_preds[ procedures ], false, IntVec( 1, 1 ) );
			addPrecondition( name, accumulator_preds[ procedures ], false, IntVec( 1, 1 ) );
		}
		else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
			createAction( name, StringVec() = { "STACKSTATE" } );

			addPrecondition( name, stack_empty_tact_pred, false, IntVec( 1, 0 ) );
			addPrecondition( name, stack_state_pred, false, incvec( 0, 1 ) );
			addPrecondition( name, "EVAL-TRUE" );

		}

		addEffect( name, stack_empty_tact_pred, true, IntVec( 1, 0 ) );
		addEffect( name, true_no_act_preds[ procedures ], false, incvec( 0, 1 ) );

		// Add instruction
		addActionToInstruction( name, true_no_act_preds[ procedures ] );

		// Program NO-ACT in False transition
		ss.str("");
		ss << "PROGRAM-FALSE-NO-ACT-" << procedures;
		name = ss.str();

		if( compiler_type == "HFSC" ){

			createAction( name, StringVec() = { "STACKSTATE", "STACKROW" }  );
			
			addPrecondition( name, stack_top_pred, false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_state_pred, false, incvec( 0, 2 ) );
			addPrecondition( name, stack_empty_fact_pred, false, IntVec( 1, 0 ) );
			addPrecondition( name, evaluating_preds[ procedures ], false, IntVec( 1, 1 ) );
			addPrecondition( name, accumulator_preds[ procedures ], true, IntVec( 1, 1 ) );
		}
		else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
			createAction( name, StringVec() = { "STACKSTATE" } );

			addPrecondition( name, stack_empty_fact_pred, false, IntVec( 1, 0 ) );
			addPrecondition( name, stack_state_pred, false, incvec( 0, 1 ) );
			addPrecondition( name, "EVAL-FALSE" );

		}

		addEffect( name, stack_empty_fact_pred, true, IntVec( 1, 0 ) );
		addEffect( name, false_no_act_preds[ procedures ], false, incvec( 0, 1 ) );

		// Add instruction
		addActionToInstruction( name, false_no_act_preds[ procedures ]  );

		// Program actions
		for ( unsigned i = 0; i < od->actions.size(); ++i ){

			// Program true actions
			ss.str("");
			if( compiler_type == "HFSC" )
				ss << "PROGRAM-TRUE-" << od->actions[ i ]->name << "-" << procedures;
			else if( compiler_type == "NFA"  or compiler_type == "NFA2" )
				ss << "PROGRAM-TRUE-" << od->actions[ i ]->name;
			name = ss.str();
			
			StringVec params = od->typeList( od->actions[i] );
			params.push_back( "STACKSTATE" );
			if( compiler_type == "HFSC" )
				params.push_back( "STACKROW" );
			unsigned par_size = params.size();
			
			createAction( name, params );
			
			copyPreconditions( od->actions[ i ]->name, name );

			if( compiler_type == "HFSC" ){
				addParameters( name, par_size - 2, 2, true );

				addPrecondition( name, stack_empty_tact_pred, false, IntVec( 1 , par_size - 2 ) );
				addPrecondition( name, stack_top_pred, false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, par_size - 1 ) );
				addPrecondition( name, stack_state_pred, false, incvec( par_size - 2 , par_size ) );
				addPrecondition( name, evaluating_preds[ procedures ], false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, accumulator_preds[ procedures ], false, IntVec( 1 , par_size - 1 ) );

				addEffect( name, stack_empty_tact_pred, true, IntVec( 1 , par_size - 2 ) );
				addEffect( name, tacts[ i ][ procedures ], false, incvec( 0, par_size - 1) );
			}
			else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
				addParameters( name, par_size - 1, 1, true );

				addPrecondition( name, stack_empty_tact_pred, false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, stack_state_pred, false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, "EVAL-TRUE" );

				addEffect( name, stack_empty_tact_pred, true, IntVec( 1 , par_size - 1 ) );
				addEffect( name, tacts[ i ][ procedures ], false, incvec( 0, par_size ) );
			}

			// Add instruction
			addActionToInstruction( name, tacts[ i ][ procedures ]  );

			// Program false actions
			ss.str( "" );
			if( compiler_type == "HFSC" )
				ss << "PROGRAM-FALSE-" << od->actions[ i ]->name << "-" << procedures;
			else if( compiler_type == "NFA"  or compiler_type == "NFA2" )
				ss << "PROGRAM-FALSE-" << od->actions[ i ]->name;
			name = ss.str();
			
			createAction( name, params );
			
			copyPreconditions( od->actions[ i ]->name, name );

			if( compiler_type == "HFSC" ){			
				addPrecondition( name, stack_top_pred, false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, stack_procedures[ procedures ], false, IntVec( 1, par_size - 1 ) );
				addPrecondition( name, stack_state_pred, false, incvec( par_size - 2 , par_size ) );
				addPrecondition( name, stack_empty_fact_pred, false, IntVec( 1 , par_size - 2 ) );
				addPrecondition( name, evaluating_preds[ procedures ], false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, accumulator_preds[ procedures ], true, IntVec( 1 , par_size - 1 ) );

				addEffect( name, stack_empty_fact_pred, true, IntVec( 1 , par_size - 2 ) );
				addEffect( name, facts[ i ][ procedures ], false, incvec( 0 , par_size - 1 ) );
			}
			else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
				addPrecondition( name, stack_empty_fact_pred, false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, stack_state_pred, false, incvec( par_size - 1 , par_size ) );
				addPrecondition( name, "EVAL-FALSE" );

				addEffect( name, stack_empty_fact_pred, true, IntVec( 1 , par_size - 1 ) );
				addEffect( name, facts[ i ][ procedures ], false, incvec( 0 , par_size ) );
			}
		
			// Add instruction
			addActionToInstruction( name, facts[ i ][ procedures ]  );
		}
	}

	void createRepeatFSCNoAct( const String &name, int proc, bool is_true, const StringVec &accumulator_preds, const StringVec &evaluating_preds, const StringVec &action_preds, const StringVec& true_no_act_preds, const StringVec & false_no_act_preds ){
		// Repeat true and false no actions
		if( compiler_type == "HFSC" ){
			createAction( name, StringVec() = { "STACKSTATE", "STACKROW" } );

			addPrecondition( name, stack_top_pred, false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_procedures[ proc ], false, IntVec( 1, 1 ) );
			addPrecondition( name, stack_state_pred, false, incvec( 0, 2 ) );
			addPrecondition( name, evaluating_preds[ proc ], false, IntVec( 1, 1 ) );
			addPrecondition( name, action_preds[ proc ], true, IntVec( 1, 1 ) );
			if( is_true ){
				addPrecondition( name, accumulator_preds[ proc ], false, IntVec( 1, 1 ) );
				addPrecondition( name, true_no_act_preds[ proc ], false, incvec( 0, 1 ) );
			}
			else{
				addPrecondition( name, accumulator_preds[ proc ], true, IntVec( 1, 1 ) );
				addPrecondition( name, false_no_act_preds[ proc ], false, incvec( 0, 1 ) );
			}
			addEffect( name, action_preds[ proc ], false, IntVec( 1, 1 ) );	
		}
		else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
			createAction( name, StringVec() = { "STACKSTATE" } );

			addPrecondition( name, stack_state_pred, false, incvec( 0, 1 ) );

			if( is_true ){
				addPrecondition( name, true_no_act_preds[ proc ], false, incvec( 0, 1 ) );
				addPrecondition( name, "EVAL-TRUE" );
				addPrecondition( name, "TRUE-APPLIED", true );
				addEffect( name, "TRUE-APPLIED" );
			}
			else{
				addPrecondition( name, false_no_act_preds[ proc ], false, incvec( 0, 1 ) );
				addPrecondition( name, "EVAL-FALSE" );
				addPrecondition( name, "FALSE-APPLIED", true );

				addEffect( name, "FALSE-APPLIED" );
			}			
		}
	}

	void createRepeatFSCAction( const String &name, int act, int proc, bool is_true, const StringVec &accumulator_preds, const StringVec &evaluating_preds, const StringVec &action_preds, const StringDVec &tacts, const StringDVec &facts  ){
			StringVec params = od->typeList( od->actions[ act ] );
			params.push_back( "STACKSTATE" );
			if( compiler_type == "HFSC" )
				params.push_back( "STACKROW" );
			unsigned par_size = params.size();
			
			parser::pddl::Action *repeat_act = createAction( name, params );
		
			copyPreconditions( od->actions[ act ]->name, name );

			if( compiler_type == "HFSC" ){
				addParameters( name, par_size - 2, 2 );

				addPrecondition( name, stack_top_pred, false, IntVec( 1, par_size - 1 ) );
				addPrecondition( name, stack_procedures[ proc ], false, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, stack_state_pred, false, incvec( par_size - 2 , par_size ) );
				addPrecondition( name, action_preds[ proc ], true, IntVec( 1 , par_size - 1 ) );
				addPrecondition( name, evaluating_preds[ proc ], false, IntVec( 1 , par_size - 1 ) );
				if( is_true ){
					addPrecondition( name, accumulator_preds[ proc ], false, IntVec( 1 , par_size - 1 ) );
					addPrecondition( name, tacts[ act ][ proc ], false, incvec( 0, par_size - 1 ) );
				}
				else{
					addPrecondition( name, accumulator_preds[ proc ], true, IntVec( 1 , par_size - 1 ) );
					addPrecondition( name, facts[ act ][ proc ], false, incvec( 0, par_size - 1 ) );
				}

				addStackRow( repeat_act->pre, par_size - 1 );

				copyEffects( od->actions[ act ]->name, name );
				addParameters( name, par_size - 2, 2, false );

				addEffect( name, action_preds[ proc ], false, IntVec( 1, par_size - 1 ) ) ;

				addStackRow( repeat_act->eff, par_size - 1 );
			}
			else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
				addParameters( name, par_size - 1, 1, true );

				addPrecondition( name, stack_state_pred, false, incvec( par_size - 1 , par_size ) );
				
				if( is_true ){
					addPrecondition( name, tacts[ act ][ proc ], false, incvec( 0, par_size ) );
					addPrecondition( name, "EVAL-TRUE" );
					addPrecondition( name, "TRUE-APPLIED", true );

					copyEffects( od->actions[ act ]->name, name );
					addParameters( name, par_size - 1, 1, false );
					addEffect( name, "TRUE-APPLIED" );
				}
				else{
					addPrecondition( name, facts[ act ][ proc ], false, incvec( 0, par_size ) );
					addPrecondition( name, "EVAL-FALSE" );
					addPrecondition( name, "FALSE-APPLIED", true );

					copyEffects( od->actions[ act ]->name, name );
					addParameters( name, par_size - 1, 1, false );
					addEffect( name, "FALSE-APPLIED" );
				}
			}	
	}

	void createRepeatFSCActions( unsigned procedures, const StringVec &accumulator_preds, const StringVec &evaluating_preds, const StringVec &action_preds, const StringDVec &tacts, const StringDVec &facts, const StringVec& true_no_act_preds, const StringVec & false_no_act_preds ){ 
		if( compiler_type == "HFSC" ){
			// Repeat no actions
			for( unsigned p = 0; p < procedures + 1; p++ ){
				SStream ss;
				ss << "REPEAT-TRUE-NO-ACT-" << p;
				createRepeatFSCNoAct( ss.str() , p, true, accumulator_preds, evaluating_preds, action_preds, true_no_act_preds, false_no_act_preds );
				ss.str( "" );
				ss << "REPEAT-FALSE-NO-ACT-" << p;
				createRepeatFSCNoAct( ss.str() , p, false, accumulator_preds, evaluating_preds, action_preds, true_no_act_preds, false_no_act_preds  );
			}
			// Repeat actions
			for ( unsigned act = 0; act < od->actions.size(); ++act ){
				for( unsigned p = 0; p < procedures + 1; p++ ){
					SStream ss;
					ss << "REPEAT-TRUE-" << od->actions[ act ]->name << "-" << p;
					createRepeatFSCAction( ss.str(), act, p, true, accumulator_preds, evaluating_preds, action_preds, tacts, facts );
					ss.str("");
					ss << "REPEAT-FALSE-" << od->actions[ act ]->name << "-" << p;
					createRepeatFSCAction( ss.str(), act, p, false, accumulator_preds, evaluating_preds, action_preds, tacts, facts );
				}
			}
		}
		else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
			// Repeat no actions
			for( unsigned p = 0; p < procedures + 1; p++ ){
				SStream ss;
				ss << "EXECUTE-TRUE-NO-ACT-" << p;
				createRepeatFSCNoAct( ss.str() , p, true, accumulator_preds, evaluating_preds, action_preds, true_no_act_preds, false_no_act_preds );
				ss.str( "" );
				ss << "EXECUTE-FALSE-NO-ACT-" << p;
				createRepeatFSCNoAct( ss.str() , p, false, accumulator_preds, evaluating_preds, action_preds, true_no_act_preds, false_no_act_preds  );
			}
			// Repeat actions
			for ( unsigned act = 0; act < od->actions.size(); ++act ){
				for( unsigned p = 0; p < procedures + 1; p++ ){
					SStream ss;
					ss << "EXECUTE-TRUE-" << od->actions[ act ]->name << "-" << p;
					createRepeatFSCAction( ss.str(), act, p, true, accumulator_preds, evaluating_preds, action_preds, tacts, facts );
					ss.str("");
					ss << "EXECUTE-FALSE-" << od->actions[ act ]->name << "-" << p;
					createRepeatFSCAction( ss.str(), act, p, false, accumulator_preds, evaluating_preds, action_preds, tacts, facts );
				}
			}
		}
	}

	void createRepeatNegActions( unsigned procedures, unsigned lines, StringTVec& instruction ){

		for( unsigned action_id = 0; action_id < od->actions.size(); action_id++ ){
			// Get original action data
			parser::pddl::Action *oact = od->actions[ action_id ];
			String oname = oact->name;
			unsigned osize = oact->params.size();
			StringVec parameters = od->typeList( oact );
			parameters.push_back( "STACKROW" );
		
			// Prepare new repeating action
			String name_prefix = "EXECUTE-" + oname;
			createDValuedActions( name_prefix, procedures + 1, lines, 0, 0, parameters );
			StringVec action_prefixes = getNames( name_prefix );
			for( unsigned procedure = 0; procedure < action_prefixes.size(); procedure++ ){
				StringVec action_names = getNames( action_prefixes[ procedure ] );
				for( unsigned line = 0; line < action_names.size(); line++ ){
					String name = action_names[ line ];

					parser::pddl::Action *act = getAction( cd, name );
					//copyPreconditions( oname, name ); 
					addParameters( name, osize, 1 ); 

					addPrecondition( name, "CHECKED", false );
					addPrecondition( name, "HOLDS", false );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1 , osize ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1 , osize ) );
					addPrecondition( name, stack_lines[ line ], false, IntVec( 1 , osize ) );
					addPrecondition( name, instruction[ action_id ][ procedure ][ line ], false, incvec( 0 , ( !LIFTED_INSTR && ( IS_HIGH_LEVEL || INSTR_WITH_PARAMS ) ) ? osize : 0 ) ); 
			
					copyEffects( oname, name );
					addParameters( name, osize, 1, false );
					addEffect( name, stack_lines[ line ], true, IntVec( 1, osize ) );
					addEffect( name, stack_lines[ line + 1 ], false, IntVec( 1, osize ) );
					addEffect( name, "CHECKED", true );
					addEffect( name, "HOLDS", true );
					addEffect( name, "ACTED" );		
			
					/*parser::pddl::When *w = new parser::pddl::When();
					w->pars = new parser::pddl::And();
					( ( parser::pddl::And * ) w->pars )->add( cd->ground( "STORED" ) );
					( ( parser::pddl::And * ) w->pars )->add( new parser::pddl::Not( cd->ground( "INF-CHECKED-AVAILABLE" ) ) );
					w->cond = new parser::pddl::And();
					( ( parser::pddl::And * ) w->cond)->add( cd->ground( "INF-CHECKED-AVAILABLE" ) );

					( ( parser::pddl::And * ) act->eff)->add( w );*/

					addStackRow( act->pre, osize );
					addStackRow( act->eff, osize );

					addCost( name, 1 );
				}
			}
			
			// Prepare new checking actions 
			name_prefix = "CHECK-" + oname;
			createDValuedActions( name_prefix, procedures + 1, lines, 0, 0, parameters );
			action_prefixes = getNames( name_prefix );

			for( unsigned procedure = 0; procedure < action_prefixes.size(); procedure++ ){
				StringVec action_names = getNames( action_prefixes[ procedure ] );
				for( unsigned line = 0; line < action_names.size(); line++ ){
					String name = action_names[ line ];

					parser::pddl::Action *act = getAction( cd, name );
					//copyPreconditions( oname, name );
					addPrecondition( name, "TOP-STACK", false, IntVec( 1 , osize ) );
					addPrecondition( name, stack_procedures[ procedure ], false, IntVec( 1 , osize ) );
					addPrecondition( name, stack_lines[ line ], false, IntVec( 1 , osize ) );
					addPrecondition( name, instruction[ action_id ][ procedure ][ line ], false, incvec( 0 , ( !LIFTED_INSTR && ( IS_HIGH_LEVEL || INSTR_WITH_PARAMS ) ) ? osize : 0 ) ); 
					addPrecondition( name, "CHECKED", true );
					if( compiler_type == "NEG" ){
						addPrecondition( name, "LOOP", true );
					}

					addEffect( name, "CHECKED", false );

					parser::pddl::When *w = new parser::pddl::When();
					parser::pddl::And *old = dynamic_cast< parser::pddl::And * >( oact->pre ); 
					w->pars = (old->copy( *od ));
					w->cond = new parser::pddl::And();
					( ( parser::pddl::And * ) w->cond)->add( cd->ground( "HOLDS" ) );
					( ( parser::pddl::And * ) act->eff)->add( w );
				}
			}
		}
	}

};

#endif
