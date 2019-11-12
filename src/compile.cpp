/****** COMPILER INCLUDES ***********/
#include "include.h"
#include "domain_creator.h"
#include "types.h"
#include "predicates.h"
#include "actions.h"
#include "instance_creator.h"
#include "derived_actions.h"
#include "sequential_actions.h"
#include "goto_actions.h"
#include "terminal_actions.h"
#include "call_actions.h"
#include "choice_actions.h"
#include "hl_cond_actions.h"
#include "unsupervised_actions.h"
#include "cfg_actions.h"
#include "neg_actions.h"

/****** COMPILER GLOBAL VARIABLES ***********/
parser::pddl::Domain * d;		// Original domain
parser::pddl::Domain * cd;		// Compiled domain
parser::pddl::Instance * cins;	// Compiled instance
InstVec ins;					// Vector of instances

unsigned max_bound;				// Max number of lines for the planning program
unsigned bound;					// Max number of lines for this procedure
unsigned total_instances;		// Number of total instances
unsigned procedures;			// Number of procedures
unsigned novariables;			// Number of variables
unsigned noslots;				// Number of slots
unsigned noclasses;				// Number of classes
bool to_program;				// Boolean to know if program instructions can be called

// PREDICATE & CONSTANT VARIABLES
StringVec rows;					// Constant objects ROWs for the stack
StringVec tests;				// Tests predicates
StringVec empty_lines;			// Empty lines predicates
StringVec select_programs;		// Select programs for CFG procedures
//StringVec allowed_lines;		// Lines allowed to program/repeat for CFG
StringDVec allowed_lines;		// Lines allowed to program/repeat for CFG
StringDVec endinstr;			// End instructions predicates
StringTVec calls;				// Calls predicates
StringTVec instr;				// Instructions predicates
StringTVec conds;				// Condition predicates
StringQVec hl_conds;			// High-Level state condition predicates
StringTVec gotos;				// Gotos predicates
StringQVec hl_neg_conds;		// High-Level state negated condition predicates
StringTVec neg_gotos;			// Negated gotos predicates
StringTVec choiceInstr;			// Choice instructions
StringVec copiedPredicates;		// Copied predicates to detect infinite loops
StringVec correctPredicates;	// Detect correct copies in the current state

StringVec constant_slots;		// slots as constants
StringVec constant_vars;		// variables as constants
StringVec constant_programs;	// programs as constants
StringVec constant_states;		// states as constants
StringVec empty_slots;			// empty slot predicates

StringDVec fsc_true_calls_preds;  	// true programming calls predicates
StringDVec fsc_false_calls_preds; 	// false programming calls predicates
StringVec fsc_accumulator_preds;  	// accumulator predicates
StringVec fsc_evaluating_preds;	  	// evaluating predicates
StringVec fsc_action_preds;		  	// action predicates
StringVec fsc_noconds_preds;		// states without conditions
StringVec fsc_tgotos;				// gotos when true
StringVec fsc_fgotos;				// gotos when false
StringDVec fsc_conds_preds;			// condition predicates
StringDVec fsc_tacts;				// actions when true
StringDVec fsc_facts;				// actions when false
StringVec true_no_act_preds;		// true no-action predicates
StringVec false_no_act_preds; 		// false no-action predicates

/****** COMPILER CLASSES ***********/
Types *types;
Predicates *predicates;
Actions *actions;
SequentialActions *sequential_actions;
GotoActions *goto_actions;
TerminalActions *terminal_actions;
CallActions *call_actions;
ChoiceActions *choice_actions;
DerivedActions *derived_actions;
HLCondActions *hl_cond_actions;
UActions	*u_actions;
CFGActions *cfg_actions;
NegActions *neg_actions;

//NEGATIVE INSTANCES COMPILATION 
unsigned negative_instances;
unsigned positive_instances;

/****** COMPILER FUNCTIONS ***********/
void init(int argc, char *argv[]){
	// check input correctness 
	if ( argc < 14 ) {
		std::cout << "Usage: ./bin/compile <compiler_type> <domain.pddl> <num of tasks> <task\\s.pddl> <max_bound> <current_bound> <procedures> <num of predicates to the stack> <predicate\\s> <num of objects to the call> <object\\s> <stack size> <to program?> <variable\\s> <slot\\s>\n";
		std::cout << "Writes domain file to standard output and instance file to standard error\n";
		exit( 1 );
	}

	int offset = 1;

	// read the compiler type
	compiler_type = String( argv[ offset++ ] );

	// read input domain
	d = new parser::pddl::Domain( argv[ offset++ ] );

	// extract the total number of instances
	ISStream is( argv[ offset++ ] );
	if( ( compiler_type == "NEG" ) || ( compiler_type == "NEGLITE" ) ){
		is >> positive_instances;
		is.clear();
		is.str( argv[ offset++ ] );
		is >> negative_instances;
		total_instances = positive_instances + negative_instances;
	}
	else{
		is >> total_instances;
	}
	// read input instances
	for(unsigned i = 0 ; i < total_instances; i++){
		ins.push_back( new parser::pddl::Instance( *d, argv[ offset++ ] ) );
	}

	// extract max number of lines per procedure and main (bound)
	is.clear();
	is.str( argv[ offset++ ] );
	is >> max_bound;
	is.clear();
	is.str( argv[ offset++ ] );
	is >> bound;

	// extract number of procedures
	is.clear();
	is.str( argv[ offset++ ] );	
	is >> procedures;	

	// extract number of predicates in stack
	is.clear();
	is.str( argv[ offset++ ] );
	is >> total_stack_pred;

	INSTR_WITH_PARAMS = ( total_stack_pred > 0 );

	// read input predicates
	for( unsigned i = 0; i < total_stack_pred; i++ ){
		stack_predicates.insert( String( argv[ offset++ ] ) );
	}

	// extract variables for recursive calls
	is.clear();
	is.str( argv[ offset++ ] );
	is >> total_stack_vars;

	// read input variables for recursive calls
	for( unsigned i = 0; i < total_stack_vars; i++ ){
		stack_variables.insert( String( argv[ offset++ ] ) );

	}
	
	// assigning pile size by default
	is.clear();
	is.str( argv[ offset++ ] );
	is >> stack_size;

	// know if we have to program or not
	is.clear();
	is.str( argv[ offset++ ] );
	is >> to_program;

	// Number of variables for searching high-level state features
	is.clear();
	is.str( argv[ offset++ ] );
	is >> novariables;

	// Number of slots for searching high-level state features
	is.clear();
	is.str( argv[ offset++ ] );
	is >> noslots;
	
	// Number of classes
	is.clear();
	is.str( argv[ offset++ ] );
	is >> noclasses;

	if( compiler_type == "TWO-STEPS" ){
		// Bound on the number of gotos
		is.clear();
		is.str( argv[ offset++ ] );
		is >> max_gotos;
	}


	IS_HIGH_LEVEL = ( novariables > 0 );
	IS_UNSUPERVISED = ( noclasses > 0 );

	// PREPROCESSING GOTOS	
	if( IS_HIGH_LEVEL ){
		// Any predicate is a potential condition!!!
		for ( unsigned i = 0; i < d->preds.size(); ++i ) {
			if ( d->preds[i]->name.substr( 0, 6 ) == "ASSIGN" ||
				 d->preds[i]->name.substr( 0, 8 ) == "INCLUDES" )
			effs.insert( i );
		}	
	}
	else{
		// Detect non-static fluents
		for ( unsigned i = 0; i < d->actions.size(); ++i ) {
			IntSet s = preds( d, d->actions[i]->eff );
			effs.insert( s.begin(), s.end() );
		}
		// Avoid delete derived predicates in the effects
		for ( unsigned i = 0; i < d->derived.size(); ++i ){
			unclean_effs.insert( d->preds.index( d->derived[i]->name ) );
			effs.insert( d->preds.index( d->derived[i]->name ) );
		}
	}

	LIFTED_INSTR = ( compiler_type == "LIFTED" );
}

void create_compiled_domain( String &name, bool condeffects = true, bool typed = true, bool cons = true, bool costs = true){
	cd = DomainCreator::create( name, condeffects, typed, cons, costs );	
}

void create_instance( ){
	if( compiler_type == "PLPR" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses );
	}
	else if( compiler_type == "HFSC" ){
		cins = InstanceCreator::createFSCInstance( d, cd, ins[ 0 ], procedures, constant_states, rows, bound, to_program );
	}
	else if( compiler_type == "CFG" ){
		cins = InstanceCreator::createCFGInstance( d, cd, ins[ 0 ], rows, empty_lines, to_program, true, select_programs, bound );
	}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses );
	}
	else if( compiler_type == "LIFTED" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses );
	}
	else if( compiler_type == "TWO-STEPS" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses, ins[ int(ins.size()) - 1 ] );
	}
	else if( compiler_type == "PL-CTRL" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses );
	}
	else if( compiler_type == "TWO-STEPS-2" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses );
	}
	else if( compiler_type == "OPT" ){
		cins = InstanceCreator::create( d, cd, ins[ 0 ], rows, empty_lines, procedures, to_program, true, constant_slots, noclasses );
	}
	else if( compiler_type == "NFA" or compiler_type == "NFA2"){ // Non-deterministic Turing Machine
		cins = InstanceCreator::createFSCInstance( d, cd, ins[ 0 ], procedures, constant_states, rows, bound, to_program );
	}
}

void create_classes( ){
	types = new Types();
	predicates = new Predicates();
	actions = new Actions( d, cd );
	sequential_actions = new SequentialActions( d, cd );
	goto_actions = new GotoActions( d, cd );
	terminal_actions = new TerminalActions( d, cd );
	call_actions = new CallActions( d, cd );
	choice_actions = new ChoiceActions( d, cd );
	derived_actions = new DerivedActions( d, cd );
	hl_cond_actions = new HLCondActions( d, cd );
	u_actions = new UActions( d, cd );
	cfg_actions = new CFGActions( d, cd );
	neg_actions = new NegActions( d, cd );
}

void add_types(){ 
	types->copyTypes( d, cd );
	types->createType( cd, "STACKROW" );
	types->moveObjectsToConstants( cd );
	types->clearObjects( cd );
	types->addValuedConstants( cd, "STACKROW", "ROW", rows, stack_size );

	if( compiler_type == "PLPR" ){
		if( IS_HIGH_LEVEL ){
			types->createType( cd, "CONDITION-SLOT" );
			types->createType( cd, "CONDITION-VARIABLE" );
			types->addValuedConstants( cd, "CONDITION-SLOT", "SLOT", constant_slots, noslots + 1 );
			//types->addValuedConstants( cd, "CONDITION-VARIABLE", "CVAR", constant_vars, novariables + 1, 1 );
			types->addValuedConstants( cd, "CONDITION-VARIABLE", "CVAR", constant_vars, novariables + 1 );
		}
		if( IS_UNSUPERVISED ){
			types->createType( cd, "PROGRAM" );
			types->addValuedConstants( cd, "PROGRAM", "PROG", constant_programs, noclasses);	
		}
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2"){
		types->createType( cd, "STACKSTATE" );
		types->addValuedConstants( cd, "STACKSTATE", "STATE", constant_states, max_bound + 1 );
	}
	else if( compiler_type == "CFG" ){
		//types->createType( cd, "PROGRAM" );
		//types->addValuedConstants( cd, "PROGRAM", "PROG", constant_programs, bound+1 , 0 );
	}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		/*
		IFStream ifs( "constants.txt" );
		String type_aux, const_aux;
		while( ifs >> const_aux ){
			ifs >> type_aux;
			//std::cout << const_aux << " " << type_aux << std::endl;
			types->addConstant( cd, type_aux, const_aux );
		}
		ifs.close();
		*/
	}
	else if( compiler_type == "LIFTED" ){
		if( IS_HIGH_LEVEL ){
			types->createType( cd, "CONDITION-SLOT" );
			types->createType( cd, "CONDITION-VARIABLE" );
			types->addValuedConstants( cd, "CONDITION-SLOT", "SLOT", constant_slots, noslots + 1 );
			types->addValuedConstants( cd, "CONDITION-VARIABLE", "CVAR", constant_vars, novariables + 1 );
		}	
	}
	else if( compiler_type == "TWO-STEPS" ){
		if( max_gotos > 0 ){
			types->createType( cd, "NUM-GOTOS" );
			StringVec constant_num_gotos;
			types->addValuedConstants( cd, "NUM-GOTOS", "CG", constant_num_gotos , max_gotos + 2 ); 
		}
	}
	else if( compiler_type == "PL-CTRL" ){
	}
	else if( compiler_type == "TWO-STEPS-2" ){
	}
}

void add_predicates(){
	predicates->copyPredicates( d, cd );
	if( compiler_type == "PLPR" || compiler_type == "LIFTED" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		predicates->createTValuedPredicates( cd, "GOTO", gotos, procedures + 1, max_bound, max_bound + 1 );
		if( LIFTED_INSTR ){
			predicates->createTValuedPredicates( cd, "NEG-GOTO", neg_gotos, procedures + 1, max_bound, max_bound + 1 );
		}
		//[PERFORMANCE] Not-gotos
		/*StringTVec notgotos;				// notGotos predicates
		predicates->createTValuedPredicates( cd, "NOT-GOTO", notgotos, procedures + 1, max_bound, max_bound + 1 );*/
		//[END-OF-PERFORMANCE]
		if( IS_HIGH_LEVEL ){
			hl_conds.resize( d->preds.size() );
			hl_neg_conds.resize( d->preds.size() );
			for( int eff : effs ){
				StringVec parameters = d->typeList( d->preds[ eff ] );
				for ( unsigned j = 1; j < parameters.size(); ++j )
					parameters[ j ] = "CONDITION-VARIABLE";
				String name = "COND-" + d->preds[ eff ]->name;
				predicates->createTValuedPredicates( cd, name, hl_conds[ eff ], procedures + 1, bound, noslots + 1, 0, 0, 1, parameters);
				if( LIFTED_INSTR ){
					name = "NEG-COND-" + d->preds[ eff ]->name;
					predicates->createTValuedPredicates( cd, name, hl_neg_conds[ eff ], procedures + 1, bound, noslots + 1, 0, 0, 1, parameters);
				}
			}

			// Add predicates related to slots
			predicates->createPredicate( cd, "CURRENT-SLOT", StringVec( 1, "CONDITION-SLOT" ) );
			predicates->createValuedPredicates( cd, "EMPTYSLOT", empty_slots, bound, 0, StringVec( 1, "CONDITION-SLOT" ) );

			StringVec parameters( 1, "CONDITION-SLOT" );
			parameters.insert( parameters.end(), novariables, "VALUE" );
			predicates->createPredicate( cd, "POSSIBLE-VALUE", parameters );
		}
		else{
			predicates->createTValuedPredicates( d, cd, conds, procedures + 1, max_bound, 0, 0 );
		}

		if( IS_UNSUPERVISED ){
			predicates->createPredicate( cd, "INS-SELECT-PROGRAM" );
			predicates->createPredicate( cd, "CHOSEN-PROGRAM", StringVec( 2, "PROGRAM" ) );	
		}
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2"){
		// Add empty predicates	
		if( compiler_type == "HFSC" or compiler_type == "NFA2" ){		
			predicates->createPredicate( cd, stack_empty_cond_pred, StringVec( 1, "STACKSTATE" ) );
		}
		predicates->createPredicate( cd, stack_empty_tgoto_pred, StringVec( 1, "STACKSTATE" ) );
		predicates->createPredicate( cd, stack_empty_fgoto_pred, StringVec( 1, "STACKSTATE" ) );
		predicates->createPredicate( cd, stack_empty_tact_pred, StringVec( 1, "STACKSTATE" ) );
		predicates->createPredicate( cd, stack_empty_fact_pred, StringVec( 1, "STACKSTATE" ) );

		// Add true and false predicates for no action instructions
		//predicates->createPredicate( cd, true_no_act_pred, StringVec( 1, "STACKSTATE" ) );
		//predicates->createPredicate( cd, false_no_act_pred, StringVec( 1, "STACKSTATE" ) );
		predicates->createValuedPredicates( cd, true_no_act_pred, true_no_act_preds, procedures + 1, 0, StringVec( 1, "STACKSTATE" ) );
		predicates->createValuedPredicates( cd, false_no_act_pred, false_no_act_preds, procedures + 1, 0, StringVec( 1, "STACKSTATE" ) );

		// Add predicates for each test
		predicates->createValuedPredicates( cd, "TEST", tests, total_instances );

		

		if( compiler_type == "HFSC" ){	
			// Add stack state predicates
			predicates->createPredicate( cd, stack_state_pred, StringVec() = { "STACKSTATE", "STACKROW" } );

			// Link stack rows
			predicates->createPredicate( cd, stack_row_pred, StringVec( 2, "STACKROW" ) );

			// Add top stack predicate
			predicates->createPredicate( cd, stack_top_pred, StringVec( 1, "STACKROW" ) );

			// Add predicates for each pair procedure-row in the stack
			predicates->createValuedPredicates( cd, "STACK-PROCEDURE", stack_procedures, procedures + 1, 0, StringVec( 1, "STACKROW" ) );
	
			// Add calls predicates for procedures
			StringVec call_params( stack_variables.begin(), stack_variables.end());
			call_params.push_back( "STACKSTATE" );
			fsc_true_calls_preds.resize( procedures + 1 );
			fsc_false_calls_preds.resize( procedures + 1 );
			for(unsigned p_from = 0; p_from < procedures + 1; p_from++){
				fsc_true_calls_preds[ p_from ].resize( procedures + 1 );
				fsc_false_calls_preds[ p_from ].resize( procedures + 1 );
				for( unsigned p_to = 0; p_to < procedures + 1; p_to++ ){
					//SStream ss;
					//ss << "TRUE-CALL-" << p_from << "-" << p_to ;
					//fsc_true_calls_preds[ p_from ][ p_to ] = ss.str();
					//ss.str( "" );
					//ss << "FALSE-CALL-" << p_from << "-" << p_to ;
					//fsc_false_calls_preds[p_from ][ p_to ] = ss.str();
					fsc_true_calls_preds[ p_from ][ p_to ] = "TRUE-CALL-" + tostr( p_from ) + "-" + tostr( p_to );
					fsc_false_calls_preds[p_from ][ p_to ] = "FALSE-CALL-" + tostr( p_from ) + "-" + tostr( p_to );
					if( p_to >= p_from ){
						predicates->createPredicate( cd, fsc_true_calls_preds[ p_from ][ p_to ], call_params );
						predicates->createPredicate( cd, fsc_false_calls_preds[ p_from ][ p_to ], call_params );
					}
				}
			}

			// Add evaluation predicates
			predicates->createValuedPredicates( cd, "ACCUMULATOR",    fsc_accumulator_preds, procedures + 1, 0, StringVec( 1, "STACKROW" ) );
			predicates->createValuedPredicates( cd, "DONE-EVALUATING", fsc_evaluating_preds, procedures + 1, 0, StringVec( 1, "STACKROW" ) );
			predicates->createValuedPredicates( cd, "DONE-APPLYING",       fsc_action_preds, procedures + 1, 0, StringVec( 1, "STACKROW" ) );
		}
	
		if( compiler_type == "NFA2" ){
			// Add evaluation predicates
			//predicates->createValuedPredicates( cd, "ACCUMULATOR",    fsc_accumulator_preds, procedures + 1 );
			//predicates->createValuedPredicates( cd, "DONE-EVALUATING", fsc_evaluating_preds, procedures + 1 );
			//predicates->createValuedPredicates( cd, "DONE-APPLYING",       fsc_action_preds, procedures + 1 );
			predicates->createPredicate( cd, "DONE-STRUCTURE" );
			predicates->createPredicate( cd, "MODE-STRUCTURE" );
			
		}

		if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
			// Add stack state predicates
			predicates->createPredicate( cd, stack_state_pred, StringVec() = { "STACKSTATE" } );

			predicates->createPredicate( cd, "TRUE-APPLIED" );
			predicates->createPredicate( cd, "FALSE-APPLIED" );
			predicates->createPredicate( cd, "EVAL-TRUE" );
			predicates->createPredicate( cd, "EVAL-FALSE" );
		}
		if( compiler_type == "NFA2" ){
		}

		// Add goal predicate
		predicates->createPredicate( cd, goal_pred );

		// Add available state to program
		predicates->createPredicate( cd, available_pred, StringVec( 1, "STACKSTATE" ) );

		// Add next state relations
		predicates->createPredicate( cd, next_state_pred, StringVec( 2, "STACKSTATE" ) );
	
		// Add predicates for conditions		
		if( compiler_type == "HFSC" or compiler_type == "NFA2" ){	
			predicates->createValuedPredicates( cd, "NCOND", fsc_noconds_preds, procedures + 1, 0, StringVec( 1, "STACKSTATE" ) );

			fsc_conds_preds.resize(  d->preds.size() );

			for ( IntSet::iterator i = effs.begin(); i != effs.end(); ++i ) {
				fsc_conds_preds[ *i ].resize( procedures + 1 );
				for( unsigned p = 0; p < procedures + 1; p++ ){
					SStream ss;
					ss << "COND-" << d->preds[ *i ]->name << "-" << p;
					fsc_conds_preds[ *i ][ p ] = ss.str();
					StringVec params_aux = d->typeList( d->preds[ *i ] );
					params_aux.push_back( "STACKSTATE" );
					predicates->createPredicate( cd, fsc_conds_preds[ *i ][ p ], params_aux );
				}
			}	
		}


		// Add predicates for jumps
		predicates->createValuedPredicates( cd, "TRUE-GOTO", fsc_tgotos, procedures + 1, 0, StringVec( 2, "STACKSTATE" ) );
		predicates->createValuedPredicates( cd, "FALSE-GOTO", fsc_fgotos, procedures + 1, 0, StringVec( 2, "STACKSTATE" ) );

		fsc_tacts.resize(  d->actions.size() );
		fsc_facts.resize(  d->actions.size() );

		for ( unsigned i = 0; i < d->actions.size(); ++i ) {
			fsc_tacts[ i ].resize( procedures + 1 );
			fsc_facts[ i ].resize( procedures + 1 );
			for( unsigned p = 0; p < procedures + 1; p++ ) {
				SStream ss;
				ss << "TRUE-" << d->actions[ i ]->name << "-" << p;
				fsc_tacts[ i ][ p ] = ss.str();
				StringVec params_aux = d->typeList( d->actions[ i ] );
				params_aux.push_back( "STACKSTATE" );
				predicates->createPredicate( cd, fsc_tacts[ i ][ p ], params_aux );

				ss.str( "" );
				ss << "FALSE-" << d->actions[ i ]->name << "-" << p;
				fsc_facts[ i ][ p ] = ss.str();
				predicates->createPredicate( cd, fsc_facts[ i ][ p ], params_aux );
			}
		}

		predicates->createDValuedPredicates( cd, "END-COND", endinstr, procedures + 1, max_bound + 1 );

	}
	else if( compiler_type == "CFG" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		//predicates->createPredicate( cd, "INS-SELECT-PROGRAM" );
		predicates->createValuedPredicates( cd, "INS-SELECT-PROGRAM", select_programs, procedures + 1 );
		//predicates->createValuedPredicates( cd, "ALLOWED-LINE", allowed_lines, bound + 1  );
		predicates->createDValuedPredicates( cd, "ALLOWED-LINE", allowed_lines, procedures + 1, max_bound + 1 );
	}
	else if( compiler_type == "NEG" or compiler_type == "NEGLITE" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		predicates->createTValuedPredicates( cd, "GOTO", gotos, procedures + 1, max_bound, max_bound + 1 );
		predicates->createTValuedPredicates( d, cd, conds, procedures + 1, max_bound, 0, 0 );
		predicates->createPredicate( cd, "HOLDS" );
		predicates->createPredicate( cd, "CHECKED" );
		predicates->createPredicate( cd, "NEGEX" );
		predicates->createPredicate( cd, "ACTED" );
		// Predicates to detect inifinite executions
		if(  compiler_type == "NEG" ){
			predicates->createPredicate( cd, "STORED" );
			//predicates->createPredicate( cd, "STORE-AVAILABLE" );
			predicates->createPredicate( cd, "LOOP" );

			for ( unsigned i = 0; i < d->preds.size(); ++i ){
				String predicate_name = d->preds[ i ]->name;
				StringVec parameter_types = d->typeList( d->preds[ i ] );
				// Check if the predicate must be stackable
				if( stack_predicates.find( predicate_name ) != stack_predicates.end() ){
					parameter_types.push_back( "STACKROW" );
				}
				predicates->createPredicate( cd, "COPY-"+predicate_name, parameter_types );
				copiedPredicates.emplace_back( "COPY-"+predicate_name );

				predicates->createPredicate( cd, "CORRECT-"+predicate_name, parameter_types );
				correctPredicates.emplace_back( "CORRECT-"+predicate_name );
			}

			for( unsigned i = 0; i < stack_lines.size(); i++ ){
				predicates->createPredicate( cd, "COPY-"+stack_lines[ i ], StringVec( 1, "STACKROW" ) );
				predicates->createPredicate( cd, "CORRECT-"+stack_lines[ i ], StringVec( 1, "STACKROW" ) );
			}
		}
	}
	if( compiler_type == "TWO-STEPS" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		predicates->createTValuedPredicates( cd, "GOTO", gotos, procedures + 1, max_bound, max_bound + 1 );
		//predicates->createTValuedPredicates( d, cd, conds, procedures + 1, max_bound, 0, 0 );
		if( max_gotos > 0 ){
			predicates->createPredicate( cd, "CURRENT-GOTOS", StringVec() = { "NUM-GOTOS" } );
			predicates->createPredicate( cd, "NEXT-NUM-GOTOS", StringVec( 2, "NUM-GOTOS" ) );
		}
	}
	else if( compiler_type == "PL-CTRL" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		predicates->createTValuedPredicates( cd, "GOTO", gotos, procedures + 1, max_bound, max_bound + 1 );
	}
	else if( compiler_type == "TWO-STEPS-2" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		predicates->createTValuedPredicates( cd, "GOTO", gotos, procedures + 1, max_bound, max_bound + 1 );
		predicates->createTValuedPredicates( d, cd, conds, procedures + 1, max_bound, 0, 0 );
		StringVec empty_conds;
		predicates->createValuedPredicates( cd, "EMPTY-COND", empty_conds, max_bound );
		predicates->createPredicate( cd, "MODE-STRUCTURE" );
		predicates->createPredicate( cd, "MODE-COND" );
	}
	else if( compiler_type == "OPT" ){
		predicates->createPredicates( d, cd, procedures, max_bound, total_instances, tests, empty_lines, endinstr, calls, instr, choiceInstr );
		predicates->createTValuedPredicates( cd, "GOTO", gotos, procedures + 1, max_bound, max_bound + 1 );
		predicates->createTValuedPredicates( d, cd, conds, procedures + 1, max_bound, 0, 0 );
		StringVec steps;
		unsigned max_steps = 0;
		for( unsigned t = 0; t < total_instances; t++ ){		
			max_steps = std::max( max_steps, (unsigned)ins[ t ]->goal.size() );
		}
		predicates->createValuedPredicates( cd, "STEP", steps, max_steps );
	}

}

void add_cost_function(bool total_cost = true){
	// Add total-cost
	if( total_cost ){
		cd->createFunction( "TOTAL-COST", -1 );
	}
}

void add_derived_evaluation(){
	derived_actions->createEvalActions( "DERIVED-EVALUATION" );
}

void add_program_actions(){
	if( compiler_type == "PLPR" or compiler_type == "TWO-STEPS" or compiler_type == "PL-CTRL" or compiler_type == "TWO-STEPS-2" or compiler_type == "OPT" ){
		sequential_actions->createProgrammingActions( procedures, bound, empty_lines, instr );
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2" ){
		sequential_actions->createFSCProgrammingActions( procedures, fsc_accumulator_preds, fsc_evaluating_preds, fsc_tacts, fsc_facts, true_no_act_preds, false_no_act_preds  );
	}
	else if( compiler_type == "CFG" ){
		sequential_actions->createProgrammingActions( procedures, bound, empty_lines, instr );
	}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		sequential_actions->createProgrammingActions( procedures, bound, empty_lines, instr );
	}
	else if( compiler_type == "LIFTED" ){
		sequential_actions->createProgrammingActions( procedures, bound, empty_lines, instr );
	}
}

void add_repeat_actions(){
	if( compiler_type == "PLPR" or compiler_type == "TWO-STEPS"  or compiler_type == "PL-CTRL" or compiler_type == "TWO-STEPS-2" or compiler_type == "OPT" ){
		sequential_actions->createRepeatActions( procedures, max_bound, instr );
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2" ){
		sequential_actions->createRepeatFSCActions( procedures, fsc_accumulator_preds, fsc_evaluating_preds, fsc_action_preds, fsc_tacts, fsc_facts, true_no_act_preds, false_no_act_preds );
	}
	else if( compiler_type == "CFG" ){
		sequential_actions->createRepeatActions( procedures, max_bound, instr );
	}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		sequential_actions->createRepeatNegActions( procedures, max_bound, instr );
	}
	else if( compiler_type == "LIFTED" ){
		sequential_actions->createRepeatActions( procedures, max_bound, instr );
	}
}

void add_program_goto_actions(){ // goto actions
	if( compiler_type == "PLPR" or compiler_type == "OPT" ){
		goto_actions->createProgrammingActions( procedures, bound, empty_lines, conds, gotos, empty_slots, noclasses );
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2" ){
		goto_actions->createFSCProgrammingActions( procedures, fsc_evaluating_preds, fsc_accumulator_preds, fsc_action_preds, fsc_noconds_preds, fsc_conds_preds, fsc_tgotos, fsc_fgotos );
	}
	else if( compiler_type == "CFG" ){}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		goto_actions->createProgrammingActions( procedures, bound, empty_lines, conds, gotos, empty_slots, noclasses );
	}
	else if( compiler_type == "LIFTED" ){
		goto_actions->createProgrammingActions( procedures, bound, empty_lines, conds, gotos, empty_slots, noclasses, false );
		goto_actions->createProgrammingActions( procedures, bound, empty_lines, conds, neg_gotos, empty_slots, noclasses, true );
	}
	else if( compiler_type == "TWO-STEPS" ){
		goto_actions->createProgrammingActionsNoConds( procedures, bound, empty_lines, gotos );
	}
	else if( compiler_type == "PL-CTRL" ){
		goto_actions->createProgrammingActionsNoConds( procedures, bound, empty_lines, gotos );
	}
	else if( compiler_type == "TWO-STEPS-2" ){
		goto_actions->createProgrammingActionsNoConds( procedures, bound, empty_lines, gotos );
		goto_actions->createProgrammingActionConds( procedures, bound, conds, gotos );
	}
}

void add_do_goto_actions(){
	if( compiler_type == "PLPR" or compiler_type == "OPT" ){
		goto_actions->createRepeatActions( procedures, max_bound, gotos, conds, noclasses );
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2" ){
		goto_actions->createFSCTrueGotoActions( procedures, fsc_evaluating_preds, fsc_accumulator_preds, fsc_action_preds, fsc_tgotos);
		goto_actions->createFSCFalseGotoActions( procedures, fsc_evaluating_preds, fsc_accumulator_preds, fsc_action_preds, fsc_fgotos);
		goto_actions->createFSCEvalConditions( procedures, fsc_evaluating_preds, fsc_accumulator_preds, fsc_action_preds, fsc_noconds_preds, fsc_conds_preds );		
	}
	else if( compiler_type == "NEG" or compiler_type == "NEGLITE" ){
		goto_actions->createRepeatActions( procedures, max_bound, gotos, conds, noclasses );
	}
	else if( compiler_type == "LIFTED" ){
		goto_actions->createRepeatActions( procedures, max_bound, gotos, conds, noclasses, false );
		goto_actions->createRepeatActions( procedures, max_bound, neg_gotos, conds, noclasses, true );
	}
	else if( compiler_type == "TWO-STEPS" ){
		//goto_actions->evalGotoNoCond( procedures, max_bound );
		goto_actions->createExecuteGotoActionsNoCond( procedures, max_bound, gotos );
	}
	else if( compiler_type == "PL-CTRL" ){
		goto_actions->createExecuteGotoActionsNoCond( procedures, max_bound, gotos );
	}
	else if( compiler_type == "TWO-STEPS-2" ){
		goto_actions->createRepeatActions( procedures, max_bound, gotos, conds );
		if( to_program )
			goto_actions->createExecuteGotoActionsNoCond( procedures, max_bound, gotos );
	}
}

void add_program_end(){
	if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2" ){
		terminal_actions->createFSCProgrammingActions( procedures, bound, endinstr, constant_states );
	}
	else{
		terminal_actions->createProgrammingActions( procedures, bound, empty_lines, endinstr, allowed_lines );	
	}
}

void add_repeat_end_actions(){
	if( compiler_type == "PLPR" or compiler_type == "TWO-STEPS" or compiler_type == "PL-CTRL"  ){
		terminal_actions->createRepeatActions(	ins, procedures, total_instances, max_bound, endinstr, tests );
	}
	else if( compiler_type == "HFSC" or compiler_type == "NFA"  or compiler_type == "NFA2" ){
		if( compiler_type == "NFA2" )
			terminal_actions->createFSCRepeatActions( ins, procedures, total_instances, bound, max_bound, constant_states, tests, endinstr, true );
		terminal_actions->createFSCRepeatActions( ins, procedures, total_instances, bound, max_bound, constant_states, tests, endinstr );
	}
	else if( compiler_type == "CFG" ){
		terminal_actions->createRepeatActions(	ins, procedures, total_instances, max_bound, endinstr, tests );
	}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		terminal_actions->createRepeatActions(	ins, procedures, total_instances, max_bound, endinstr, tests, negative_instances );
	}
	else if( compiler_type == "LIFTED" ){
		terminal_actions->createRepeatActions(	ins, procedures, total_instances, max_bound, endinstr, tests );
	}
	else if( compiler_type == "TWO-STEPS-2" ){
		terminal_actions->createRepeatActions(	ins, procedures, total_instances, max_bound, endinstr, tests, 0, false );
		terminal_actions->createRepeatActions(	ins, procedures, total_instances, max_bound, endinstr, tests, 0, true );
	}
	else if( compiler_type == "OPT" ){
		terminal_actions->createNoGoalRepeatActions( ins, procedures, total_instances, max_bound, endinstr, tests );
	}
}

void add_program_call_actions(){
	if( compiler_type == "PLPR" ){
		call_actions->createProgrammingActions( procedures, bound, empty_lines, calls );
	}
	else if( compiler_type == "HFSC" ){
		call_actions->createFSCProgrammingActions( procedures, fsc_evaluating_preds, fsc_accumulator_preds, fsc_true_calls_preds, fsc_false_calls_preds );
	}
	else if( compiler_type == "CFG" ){
		call_actions->createProgrammingActions( procedures, bound, empty_lines, calls );
	}
	else if( compiler_type == "NEG" ){
		call_actions->createProgrammingActions( procedures, bound, empty_lines, calls );
	}
	else if( compiler_type == "LIFTED" ){
		call_actions->createProgrammingActions( procedures, bound, empty_lines, calls );
	}
	else if( compiler_type == "TWO-STEPS" ){
	}
	else if( compiler_type == "PL-CTRL" ){
	}
	else if( compiler_type == "TWO-STEPS-2" ){
	}
	else if( compiler_type == "OPT" ){
	}
	else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){

	}
}
	
void add_repeat_call_actions(){
	if( compiler_type == "PLPR" ){
		call_actions->createRepeatActions( procedures, max_bound, calls );
	}
	else if( compiler_type == "HFSC" ){
		call_actions->createFSCRepeatActions( procedures, constant_states, fsc_accumulator_preds, fsc_evaluating_preds, fsc_action_preds, fsc_true_calls_preds, fsc_false_calls_preds );	
	}
	else if( compiler_type == "CFG" ){
		call_actions->createRepeatActions( procedures, max_bound, calls );
	}
	else if( compiler_type == "NEG"  or compiler_type == "NEGLITE" ){
		call_actions->createRepeatActions( procedures, max_bound, calls );
	}
	else if( compiler_type == "LIFTED" ){
		call_actions->createRepeatActions( procedures, max_bound, calls );
	}
	else if( compiler_type == "TWO-STEPS" ){
	}
	else if( compiler_type == "PL-CTRL" ){
	}
	else if( compiler_type == "TWO-STEPS-2" ){
	}
	else if( compiler_type == "OPT" ){
	}
	else if( compiler_type == "NFA"  or compiler_type == "NFA2" ){

	}
}

void add_program_choice_actions(){
	choice_actions->createProgrammingActions( choiceInstr, procedures, bound, empty_lines );
}
	
void add_repeat_choice_actions(){
	choice_actions->createRepeatActions( choiceInstr, procedures, max_bound );
}

void add_program_cond_actions(){ // Cond actions
	hl_cond_actions->createProgrammingActions( procedures, bound, noslots, empty_slots, hl_conds, constant_slots  );
}

void add_step_conditions(){
	hl_cond_actions->createDoStepsConditions( procedures, bound, noslots, constant_slots, constant_vars, novariables, hl_conds );
}

void add_eval_high_level_conditions(){
	hl_cond_actions->evalHighLevelActions( procedures, bound, constant_slots, noslots, novariables );
}


void print_domain(){
	//cd->PDDLPrint( std::cout );
	cd->print( std::cout );
}

void print_instance(){
	//cins->PDDLPrint( std::cerr );
	cins->print( std::cerr );
}

void print_act2ins(){
	// Print actions to instructions file
	OFStream ofs( "act2ins.txt" );
	for( MapStrSVec::iterator it = act2ins.begin(); it != act2ins.end(); it++){
		ofs << it->first; // Action
		for( String instruction : (it->second) ){
			ofs << " " << instruction;
		}
		ofs << std::endl;
	}
	ofs.close();
}

void print_constants(){
	OFStream ofs( "constants.txt" );
	for( unsigned i = 0; i < cd->types.size(); i++ ){
		for ( unsigned j = 0; j < cd->types[ i ]->constants.size(); ++j){
			ofs << cd->types[ i ]->constants[ j ] << " " << cd->types[ i ]->getName() << std::endl;
		}
	}
	ofs.close();
}

void clean_variables(){
	delete cins;
	delete cd;
	for(unsigned i = 0; i < total_instances; i++)
		delete ins[i];
	delete d;
	if( types ) 
		delete types;
	if( predicates )
		delete predicates;
	if( sequential_actions )
		delete sequential_actions;
	if( terminal_actions )
		delete terminal_actions;
	if( call_actions )
		delete call_actions;
	if( choice_actions )
		delete choice_actions;
	if( derived_actions )
		delete derived_actions;
	if( hl_cond_actions )
		delete hl_cond_actions;
	if( u_actions )
		delete u_actions;
	if( cfg_actions )
		delete cfg_actions;
	if( neg_actions )
		delete neg_actions;
	if( actions )
		delete actions;
	
}

void planning_programs_compilation( ){
	if( EVAL_DERIVED && !IS_HIGH_LEVEL )
		add_derived_evaluation();

	// PROGRAMMING ACTIONS
	if( to_program ){
		add_program_actions(); 
		add_program_goto_actions(); 
		if( !IS_UNSUPERVISED ){
			add_program_end();
			add_program_call_actions(); 
			add_program_choice_actions();
		} 

		if( IS_HIGH_LEVEL ){ 
			add_program_cond_actions(); 
		}
	}

	// REPEAT ACTIONS
	add_repeat_actions(); 
	add_do_goto_actions();
	add_repeat_end_actions();
	if( !IS_UNSUPERVISED ){
		add_repeat_call_actions(); 
		add_repeat_choice_actions(); 
	}

	if( IS_HIGH_LEVEL ){
		add_step_conditions(); 
		add_eval_high_level_conditions();
	}
	if( IS_UNSUPERVISED ){
		u_actions->createRepeatActions( bound, noclasses, constant_programs );
	}
}

void hierachical_fsc_compilation(){
	if( to_program ){
		add_program_actions();
		add_program_end();
		add_program_goto_actions(); 
		add_program_call_actions(); 
	}

	add_repeat_actions();
	add_do_goto_actions();
	add_repeat_end_actions();
	add_repeat_call_actions();
}

void nfa_compilation(){
	if( to_program ){
		add_program_actions(); 
		add_program_goto_actions(); 
		add_program_end();
	}
	add_repeat_actions();
	add_do_goto_actions();
	add_repeat_end_actions();
}

void cfg_compilation(){
	if( to_program ){ 
		add_program_actions();
		add_program_end();
		add_program_call_actions();
	}
	
	add_repeat_actions();
	add_repeat_end_actions();
	add_repeat_call_actions();
	cfg_actions->createRepeatActions( procedures + 1, max_bound, allowed_lines, select_programs );
}

void neg_compilation(){
	if( to_program ){ 
		add_program_actions();
		add_program_goto_actions();
		add_program_end(); 
		//add_program_call_actions(); 		
	}
	add_repeat_actions();
	add_do_goto_actions();
	add_repeat_end_actions();
	//add_repeat_call_actions();
	neg_actions->createRepeatActions( ins, procedures, total_instances, max_bound, endinstr, tests, negative_instances  ); 
	if( compiler_type == "NEG" ){
		neg_actions->createInfiniteDetectionActions( copiedPredicates, correctPredicates, ins, procedures, total_instances, max_bound, endinstr, tests, negative_instances );
	}
}

void twosteps_compilation(){
	if( to_program ){
		add_program_actions();
		add_program_goto_actions();
		add_program_end();
	}
	add_repeat_actions();
	add_do_goto_actions();
	add_repeat_end_actions();
}

void plctrl_compilation(){
	if( to_program ){
		add_program_actions();
		//add_program_goto_actions();
		add_program_end();
	}
	add_repeat_actions();
	add_do_goto_actions();
	add_repeat_end_actions();
}

void programs_optimization( ){
	if( EVAL_DERIVED && !IS_HIGH_LEVEL )
		add_derived_evaluation();

	// PROGRAMMING ACTIONS
	if( to_program ){
		add_program_actions(); 
		add_program_goto_actions(); 
		add_program_end();
	}

	// REPEAT ACTIONS
	add_repeat_actions(); 
	add_do_goto_actions();
	add_repeat_end_actions();
}

bool hold_pred( parser::pddl::Condition * c, const String &s ) {
    parser::pddl::And * a = dynamic_cast< parser::pddl::And * >( c );
    if ( a ) {
        for ( unsigned i = 0; i < a->conds.size(); ++i ) {
            if ( hold_pred( a->conds[i], s ) ) {
                return true;
            }
        }
    }

    //Equals * eq = dynamic_cast< Equals * >( c );
    //if ( eq ) {
    //    StringVec objParams = getObjectParameters( d, eq, params );
    //    return objParams[0] == objParams[1];
    //}

    //Derived * dv = dynamic_cast< Derived * >( c );
    //if ( dv ) {
    //    return holdsRec( s, d, dv->cond, params );
    //}

    parser::pddl::Ground * g = dynamic_cast< parser::pddl::Ground * >( c );
    if ( g ) {
        // check if the ground is actually a derived predicate
        //if ( cd->derived.index( g->name ) >= 0 ) {
        //    Derived * dv = d->derived.get( g->name );
        //    return holdsRec( s, d, dv->cond, params );
        //}

        // if it is an actual ground...
        if ( (g->name) == s ) {
//std::cout << (g->name) << " " << s << std::endl;
            return true;
        }
    }

    parser::pddl::Not * n = dynamic_cast< parser::pddl::Not * >( c );
    if ( n ) {
        return hold_pred( n->cond, s );
    }

   // parser::pddl::Forall * f = dynamic_cast< parser::pddl::Forall * >( c );
    //if ( f ) {		
        //StringVec forallParams = cd->typeList( f );
        //return forallHoldsRec( forallParams, 0, s, d, f->cond, params );
    //}

    //Exists * e = dynamic_cast< Exists * >( c );
    //if ( e ) {
    //    StringVec existsParams = d->typeList( e );
    //    return existsHoldsRec( existsParams, 0, s, d, e->cond, params );
    //}

    parser::pddl::Or * o = dynamic_cast< parser::pddl::Or * >( c );
    if ( o ) {
        return hold_pred( o->first, s ) || hold_pred( o->second, s );
    }

    return false;
}

void cleanup_domain(){
	IFStream ifs( "program.txt" );
	String line;
	// find ins for each action in cd
	parser::pddl::TokenStruct< parser::pddl::Action * > *oa = new parser::pddl::TokenStruct< parser::pddl::Action * >( cd->actions );
	std::vector< parser::pddl::Action* > ca;
	/*std::vector< std::string > names;
	std::vector< IntVec > params;
	std::vector< parser::pddl::Condition* > precs;
	std::vector< parser::pddl::Condition* > effs;*/
	while( getline( ifs, line ) ){
//std::cout << "LINE: " << line << std::endl;
		ISStream iss( line );
		String instruction;
		iss >> instruction;
		// copy the set of actions
//std::cout << "INS => " << instruction << std::endl;
		for( unsigned id = 0; id < (*oa).size(); id++){
			if( hold_pred( (*oa)[ id ]->pre, instruction ) ){
//std::cout << (*oa)[ id ]<< std::endl;
				//parser::pddl::Action *act = new parser::pddl::Action((*oa)[ id ], *cd);
				//ca.push_back( *(*oa)[ id ] );
/*std::cout << act->name << std::endl;
std::cout << act->pre << std::endl;
std::cout << act->eff << std::endl;*/
				ca.push_back( new parser::pddl::Action( (*oa)[id], *cd ) );
				/*names.push_back( (*oa)[id]->name );
				params.push_back( (*oa)[id]->params );
				precs.push_back( (*oa)[id]->pre->copy( *cd ) );
				effs.push_back( (*oa)[id]->eff->copy( *cd ) );
				std::cout << "NAME: " << names[ id ]  << std::endl;
				std::cout << "PARAMS: " << params[ id ] << std::endl;
				std::cout << "PRECS: " << precs[ id ] << std::endl;
				std::cout << "EFFS: " << effs[ id ] << std::endl;*/
			}
		}
	}
	
	if( compiler_type == "NEG" or compiler_type == "NEGLITE" ){
		for( unsigned id = 0; id < (*oa).size(); id++){
			if( ( (*oa)[id]->name ).find( "SKIP" ) != std::string::npos ){
				ca.push_back( new parser::pddl::Action( (*oa)[id], *cd ) );
			}
		}
	}
	
	if( compiler_type == "NFA"  or compiler_type == "NFA2" ){
		for( unsigned id = 0; id < (*oa).size(); id++){
			if( ( (*oa)[id]->name ).find( "-EVALUATION" ) != std::string::npos ){
				ca.push_back( new parser::pddl::Action( (*oa)[id], *cd ) );
			}
		}
	}

	// remove all actions from cd
	cd->actions.clear();
	// add the new set to cd 
//std::cout << ca.size() << std::endl;
	for( unsigned id = 0; id < ca.size(); id++){
/*std::cout << id << "/" << ca.size() << std::endl;
std::cout << ca[ id ]->name << std::endl << std::endl;
std::cout << ca[ id ]->pre << std::endl << std::endl;
std::cout << ca[ id ]->eff << std::endl << std::endl;*/
		cd->actions.insert( ca[ id ] );
		/*parser::pddl::Action *act = cd->createAction( names[ id ] );
		act->params = params[ id ];
		cd->setPre( names[ id ], precs[ id ] );
		cd->setEff( names[ id ], effs[ id ] );
		std::cout << "ID " << id << ": " << act << std::endl;*/
	}
}

/****** COMPILER MAIN ***********/
int main( int argc, char *argv[] ) {

	// INITIALIZE; COMPILED DOMAIN & CLASSES
	//std::cout << 0 << std::endl;
	init(argc, argv); //std::cout << 1 << std::endl;
	create_compiled_domain( d->name ); //std::cout << 2 << std::endl;
	create_classes();  //std::cout << 3 << std::endl;
	add_types(); //std::cout << 4 << std::endl;
	add_predicates(); //std::cout << 5 << std::endl;
	create_instance();  //std::cout << 6 << std::endl;
	add_cost_function(); //std::cout << 7 << std::endl;

	if( compiler_type == "PLPR" ) // Basic Planning Programs
		planning_programs_compilation();
	else if( compiler_type == "HFSC" ) // Hierarchical Finite State Controllers
		hierachical_fsc_compilation();
	else if( compiler_type == "CFG" ) // Context-Free Grammars
		cfg_compilation();
	else if( ( compiler_type == "NEG" ) || ( compiler_type == "NEGLITE" ) ) // Planning Programs with Negative Examples
		neg_compilation();
	else if( compiler_type == "LIFTED" ) // Lifted Programs
		planning_programs_compilation();
	else if( compiler_type == "TWO-STEPS" ) // Unconditional Planning Programs with bounded gotos
		twosteps_compilation();
	else if( compiler_type == "PL-CTRL" ) // 
		plctrl_compilation();
	else if( compiler_type == "TWO-STEPS-2" ) // Unconditional Planning programs
		twosteps_compilation();
	else if( compiler_type == "OPT" ) // Program optimization
		programs_optimization();
	else if( compiler_type == "NFA"  or compiler_type == "NFA2" ) // Non-deterministic Finite-state Automaton
		nfa_compilation();

	if( !to_program ){
		cleanup_domain();
	}

	// PRINT DOMAIN, INSTANCE & ACTIONS TO INSTRUCTIONS
	print_domain(); 
	print_instance(); 
	print_act2ins();
	/*if( to_program and ( compiler_type == "NEG" or compiler_type == "NEGLITE" ) ){
	    print_constants();
	}*/
	// CLEAN THE COMPILATOR
	clean_variables();
	
}
