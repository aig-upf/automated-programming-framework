#ifndef MAINPERF_H
#define MAINPERF_H

#include<iostream>
#include<fstream>
#include<map>
#include<vector>
#include<cctype>
#include"src/include.h"

using namespace std;

class Main{
private:
    string config_file;
	string compilation_type;
	string exec_prog;
	string orig_domain;
	string dest_domain;
	string dest_ins;
	vector< int > bound;
	vector< int > timeout;
	vector< int > positive_instances;
	vector< int > negative_instances;
	int max_bound;
	int procedures;
	int stack_vars;
	int test_stack_size;
	int ntest_inst;
	int test_time_bound;
	unsigned number_variables;
	unsigned number_slots;
	unsigned number_classes;
	vector< string > vstack_pred;
	vector< string > vstack_vars;
	vector< string > test_instances;
	vector< string > new_instructions;
	vector< vector < string > > instruction_params;
	vector< vector< string > > instances;
	vector< StringSet > original_constants;
	
	bool _debug;
	ofstream execution;

public:
	////////////////////////////////////////////////////
	//
	// Functions to implement in every different main
	//
	////////////////////////////////////////////////////
	string getError( int number );
	string getPlan();
	string getPlannerCommand( unsigned timeout );

	////////////////////////////////////////////////////
	//
	// Get and Set of different class variables
	//
	////////////////////////////////////////////////////
	int getProcedures(){ return procedures; }
	bool getDebug(){ return _debug; }
	ofstream *getExecution(){ return &execution; }
	int getTimeout( int p ){ 
		if( p < 0 || p >= int( timeout.size() ) )
			return 0;
		return timeout[ p ];
	}
	int getBound( int p ){
		if( p < 0 || p >= int( bound.size() ) )
			return 0;
		return bound[ p ];	
	}
	string getCompilationType(){ return compilation_type; }
	void addNewInstruction( const string &instruction ){
		new_instructions.push_back( instruction );
	}
	void addNewIntructionParameters( const vector< string > &instruction_parameters ){
		instruction_params.push_back( instruction_parameters );
	}
	void assignInstructionParameters( unsigned position, const vector< string > &instruction_parameters ){
		instruction_params[ position ] = instruction_parameters;
	}
	bool isTesting(){
		return ( ntest_inst > 0 );
	}


	////////////////////////////////////////////////////
	//
	// General Main constructor
	//
	////////////////////////////////////////////////////
	Main(){ _debug=false; max_bound = 0; }
	Main( int argc, char* argv[] ){
		_debug=false;
		max_bound = 0;
		#ifdef DEBUG
			_debug = true;
			execution.open( "execution.txt" );
		#endif

		if( argc < 2 ){
			if( _debug ){
				execution << getError( 1 ) << endl;
				execution.close();
			}
			exit( -1 );
		}

		config_file = string( argv[ 1 ] );
		config_file = config_file.substr( config_file.find_last_of( "/" ) + 1 );

		// The variable argv[ 1 ] is the configuration file
		ifstream ifs( argv[ 1 ] );

		ifs >> compilation_type;

		ifs >> exec_prog;

		ifs >> orig_domain;

		ifs >> dest_domain >> dest_ins;

		ifs >> procedures;

		bound.resize( procedures + 1 );

		timeout.resize( procedures + 1 );

		positive_instances.resize( procedures + 1 );

		negative_instances.resize( procedures + 1 );
		for( int p = 0 ; p < procedures + 1 ; p++ ){
			int cant;

			ifs >> bound[ p ] >> timeout[ p ] >> positive_instances[ p ];

			cant = positive_instances[ p ];

			if( compilation_type == "NEG" ){
				ifs >> negative_instances[ p ];
				cant += negative_instances[ p ];
			}		

			max_bound = max( max_bound, bound[ p ] );

			instances.push_back( vector< string >( cant ) );

			for( int q = 0; q < cant; q++ ){
				ifs >> instances[ p ][ q ];
			}
		}

		ifs >> ntest_inst;
	
		if( ntest_inst > 0 ){
			ifs >> test_time_bound;
	
			test_instances.resize( ntest_inst );
	
			for( int t = 0; t < ntest_inst; t++ ){
				ifs >> test_instances[ t ];
			}
		}

		ifs >> total_stack_pred;

		vstack_pred.resize( total_stack_pred );

		for( unsigned i = 0; i < total_stack_pred ; i++ ){
			ifs >> vstack_pred[ i ];
		}

		ifs >> stack_vars;
	
		vstack_vars.resize( stack_vars );
	
		for( int i = 0; i < stack_vars; i++){
			ifs >> vstack_vars[ i ];
		}

		ifs >> stack_size >> test_stack_size;

		ifs >> number_variables >> number_slots;
	
		if( !ifs.eof() ){
			ifs >> number_classes;
		}
		else{
			number_classes = 0;
		}

		ifs.close();
	}

	////////////////////////////////////////////////////
	//
	// Read act2ins.txt file that maps planning actions 
	// to instructions as strings
	//
	////////////////////////////////////////////////////
	void readAct2Ins(){

		act2ins.clear();

		ifstream ifs( "act2ins.txt" );

		string line;

		while( getline( ifs, line ) ){

			string action, instr;

			vector< string > instructions;

			istringstream ss( line );

			ss >> action;

			while( ss >> instr ) instructions.push_back( instr );

			act2ins[ action ] = instructions;

		}

	}

	////////////////////////////////////////////////////////////
	//
	// Save constants from an original compilation before testing
	// Parameters:
	//   Domaind *d => original domain
	// Return: void
	//
	////////////////////////////////////////////////////////////
	void getConstants( parser::pddl::Domain *d ){
		for( unsigned i = 0; i < d->types.size(); i++ ){
			original_constants.push_back( StringSet() );
			for( unsigned j = 0; j < d->types[ i ]->constants.size(); j++ ){
				original_constants[ i ].insert( d->types[ i ]->constants[ j ] );
				execution << "[CONSTANT[" << i << "]] " << d->types[ i ]->constants[ j ] << endl;
			}
		}
	}

	////////////////////////////////////////////////////////////
	//
	// Copy the original constants into the destination domain
	// to avoid errors int the compiler about unknown objects
	// Parameters:
	//   Domaind *d => destination domain
	// Return: void
	//
	////////////////////////////////////////////////////////////
	void moveOriginalConstantsToDomain( parser::pddl::Domain *d ){
		if( original_constants.size() == 0u ) return;
		// Avoid duplicate objects in the universal pddl parser (workaround in the compiler)
		for( unsigned i = 0; i < d->types.size(); i++ ){
			//Insert
			for( StringSet::iterator it = original_constants[ i ].begin(); it != original_constants[ i ].end(); it++){
				d->types[ i ]->constants.insert( *it );
			}
		}
	}

	////////////////////////////////////////////////////////////
	//
	// Call to compiler to make the compilation files
	// Parameters:
	//   int p => procedure identifier
	//   bool to_program => include programming actions
	// Return: void
	//
	////////////////////////////////////////////////////////////
	void callCompiler( int p, bool to_program ){ 
		OSStream compiler;

		compiler << exec_prog << " " << compilation_type << " " << orig_domain << " " << positive_instances[ p ];
		if( compilation_type == "NEG" ) compiler << " " << negative_instances[ p ];

		for( auto&& current_instance : instances[ p ] )
			compiler << " " << current_instance;

//		for( size_t i = 0; i < instances[ p ].size(); i++ ) 
//			compiler << " " << instances[ p ][ i ];

		compiler << " " << max_bound << " " << bound[ p ] << " " << p << " " << total_stack_pred ;
		for( auto&& predicate : vstack_pred )
			compiler << " " << predicate;
//		for( unsigned i = 0; i < total_stack_pred; i++ ){
//			compiler << " " << vstack_pred[ i ] ;
//		}
	
		compiler << " " << stack_vars;
		for( auto&& variable : vstack_vars )
			compiler << " " << variable;
//		for( int i = 0; i < stack_vars; i++ ){
//			compiler << " " << vstack_vars[ i ];	
//		}
	
		compiler << " " << stack_size << " " << to_program << " " << number_variables << " " << number_slots << " " << number_classes << " > " << dest_domain << " 2> " << dest_ins;

		if( _debug )
			execution << "[INFO] SYSTEM CALL: " << compiler.str() << endl;

		int res_compiler_call = system( compiler.str().c_str() );
	
		if( _debug )
			execution << "[INFO] COMPILER CALL RESULT: " << res_compiler_call << endl;
	}

	///////////////////////////////////////////////////////////
	//
	// Preparing domain and instance to call the planner script
	// Parameters: 
	//    int procedure => procedure identifier; 
	//    int timeout => timeout to kill the process
	// Return: void 
	//		
	///////////////////////////////////////////////////////////
	void callPlanner( int procedure , int timeout ){
		if( _debug ) execution << "[INFO] CREATING COMPILED DOMAIN" << endl;
		parser::pddl::Domain *cd = new parser::pddl::Domain( dest_domain.c_str() );
		if( _debug ) execution << "\t[INFO] DOMAIN READ" << endl;
		parser::pddl::Instance* ins = new parser::pddl::Instance( *cd , dest_ins.c_str() );

		moveOriginalConstantsToDomain( cd );

		if( _debug ){
			execution << "\t[INFO] INSTANCE READ" <<endl;
			execution << "\t[INFO] READING " << new_instructions.size() << " INSTRUCTIONS TO ADD" << endl;
		}
		// Check if we are in the last procedure
		if( procedure == procedures + 1 ){
			for( int ins_id = 0; ins_id < int( new_instructions.size() ); ins_id++ ){ 
				if( _debug ) execution << "\t[INFO] INSTRUCTION " << ins_id << " - " << new_instructions[ ins_id ];
				
				if( instruction_params.size() > 0 ){
					for( auto&& parameter : instruction_params[ ins_id ] )
						execution << " " << parameter ;

					// In case the instruction is a CALL
					// include only parameters from [1,...]
					// skipping parameter 0
					if( new_instructions[ ins_id ].substr( 0, 4 ) == "CALL" ){
						StringVec ips( ++instruction_params[ ins_id ].begin(), instruction_params[ ins_id ].end() );
						ins->addInit( new_instructions[ ins_id ], ips );
					}
					// Otherwise include all parameters
					else{
						StringVec ips( instruction_params[ ins_id ].begin(), instruction_params[ ins_id ].end() );
						ins->addInit( new_instructions[ ins_id ], ips );
					}
				}
				else
					ins->addInit( new_instructions[ ins_id ] );
				if( _debug ) execution << "\t[INFO] INSTRUCTION INSERTED" << endl;
			}
		}
		else if( procedure > 0 ){
			for( int ins_id = 0; ins_id < int( new_instructions.size() ); ins_id++ ){ 
				if( _debug ){
					execution << "\t[INFO] INSTRUCTION " << ins_id << " - " << new_instructions[ ins_id ];
					for( auto&& parameter : instruction_params[ ins_id ] )
						execution << " " << parameter ;
					execution << endl;
				}
				ins->addInit( new_instructions[ ins_id ] , instruction_params[ ins_id ] );
				if( _debug ) execution << "\t[INFO] INSTRUCTION INSERTED" << endl;
			}
		}

		// In case we are not in the first procedure, modify the instance
		// with the instructions of the previous procedure	
		if( procedure > 0 ){
			if( _debug ) execution << "\t[INFO] ALL INSTRUCTIONS ADDED" << endl;
			ofstream ofs( dest_ins.c_str() );
			//ins->PDDLPrint( ofs );
			ins->print( ofs );
		}

		string planner = getPlannerCommand( timeout );
		//ostringstream planner;

		//planner << "./planner.sh " << dest_domain << " " << dest_ins << " " << to;

		if( _debug ) execution << "[INFO] CALL TO PLANNER " << planner << endl;

		int res_planner_call = system( planner.c_str() );

		if( _debug ) execution << "[INFO] PLANNER CALL RESULT: " << res_planner_call << endl;
	}

	///////////////////////////////////////////////////////////////
	//
	// Call to compiler to make the compilation files for testing
	// Parameters:  
	//   bool to_program => include programming actions
	// Return: void 
	//		
	//////////////////////////////////////////////////////////////
	void callTestCompiler( unsigned testID, bool to_program = false ){
		OSStream compiler;
		
		compiler << exec_prog << " " << compilation_type << " " << orig_domain << " " << 1;

		/*for( auto&& test_inst : test_instances ){
			 compiler << " " << test_inst;
		}*/
		compiler << " " << test_instances[ testID ];

		compiler << " " << max_bound << " " << bound[ procedures ] << " " << procedures << " " << total_stack_pred;
		
		for( auto&& predicate : vstack_pred ){
			compiler << " " << predicate;
		}

		compiler << " " << stack_vars;

		for( auto&& variable : vstack_vars ){
			compiler << " " << variable;	
		}
	
		compiler << " " << test_stack_size << " " << to_program << " " << number_variables << " " << number_slots << " " << number_classes << " > " << dest_domain << " 2> " << dest_ins;

		if( _debug ) execution << "[INFO] TEST SYSTEM CALL: " << compiler.str() << endl;

		int res_compiler_test = system( compiler.str().c_str() );

		if( _debug ) execution << "[INFO] COMPILER TEST RESULT: " << res_compiler_test << endl;

		callPlanner( procedures + 1, test_time_bound );
	}

	///////////////////////////////////////////////////////////////
	//
	// Modify new instruction assigning them to a procedure
	// Parameters:  
	//   string instruction => the instruction to modify
	//   int procedure => procedure id to be assigned
	// Return: string new_instruction 
	//		
	//////////////////////////////////////////////////////////////
	string assignProcedure2Instruction( string &instruction , int procedure ){
		size_t itres = string::npos;

		for(int i=0; i < 10 ; i++){
			string tofind = "-" + to_string( i );
			size_t it = instruction.find( tofind );
			itres = min( it, itres );
		}

		string new_instruction = instruction;
		string tocheck = instruction.substr( 0, 4 );

		if( tocheck != "CALL" && tocheck != "GOTO" && tocheck != "COND" )
			new_instruction = instruction.substr( 0 , itres ) + "-" + to_string( procedure ) + instruction.substr( itres );
		else if( tocheck == "GOTO" || tocheck == "COND" )
			new_instruction = instruction.substr( 0 , itres ) + "-" + to_string( procedure ) + instruction.substr( itres + 2 );

		if( _debug ) execution << "[INFO] CONVERTING " << instruction << " TO " << new_instruction << endl;

		return new_instruction;
	}

	///////////////////////////////////////////////////////////////
	//
	// Extracting the line number of an instruction
	// Parameters:  
	//   string instruction => the instruction to modify
	// Return: int line 
	//		
	//////////////////////////////////////////////////////////////
	int getInstructionLine( const String &instruction ){
		String numbers = instruction.substr( instruction.find_last_of( "-" ) + 1 );
		ISStream iss( numbers );
		int line;
		iss >> line;
		return (line + 1);
	}

	///////////////////////////////////////////////////////////////
	//
	// Print all the instructions in a file called program.txt.
	// Actually is the resulting program
	// Parameters: void
	// Return: void
	//		
	//////////////////////////////////////////////////////////////
	void printInstructions(){
		ofstream ofs("program.txt");
		for( int i = 0; i < int( new_instructions.size() ); i++ ){
			ofs << new_instructions[ i ] ;
			for( int j = 0; j < int( instruction_params[i].size() ); j++ ) {
				ofs << " " << instruction_params[i][j];
			}
			ofs << endl;	
		}
		ofs.close();
	}

	int run(){
		int pos = 0;

		for(int p = 0; p < procedures + 1; p++ ){
			if( _debug ) execution << "[INFO] STARTING PROCEDURE " << p << endl;

			callCompiler( p, true );
			if( _debug ) execution << "[INFO] COMPILED PROCEDURE " << p << endl;

			readAct2Ins();
			if( _debug ) execution << "[INFO] ACTIONS FOUND: " << act2ins.size() << endl;

			int current_timeout = getTimeout( p );
			callPlanner( p, current_timeout );

			if( _debug ) execution << "[INFO] PLANNER FINISHED IN PROCEDURE " << p << endl;

			string plan = getPlan();

			if( _debug ) execution << "[INFO] EXTRACTING PLAN " << plan << endl;

			if(plan.length() == 0) return -1;

			// Saving current domain, instance and plan with [id]-domain, [id]-instance, [id]-plan
			string save_dom = "cp domain.pddl " + to_string( p ) + "-domain.pddl";
			int res_saving_dom = system( save_dom.c_str() );
			if( _debug ) execution << "[INFO] RESULT OF SAVING domain.pddl TO " << p << "-domain.pddl: " << res_saving_dom;
			string save_ins = "cp ins.pddl " + to_string( p ) + "-ins.pddl";
			int res_saving_ins = system( save_ins.c_str() );
			if( _debug ) execution << "[INFO] RESULT OF SAVING ins.pddl  TO " << p << "-ins.pddl: " << res_saving_ins;
			string save_plan = "cp " + plan + " " + to_string( p ) + "-" + plan;
			int res_saving_plan = system( save_plan.c_str() );
			if( _debug ) execution << "[INFO] RESULT OF SAVING PLAN " << plan << " TO " << p << "-" << plan << ": " << res_saving_plan;

			ifstream itest( plan.c_str() );
			string line;

			while( getline( itest , line ) ) {
				line = line.substr( 0 , line.length() - 1 ); 
				size_t whitespace = line.find_first_of(" ");
				string prog = line.substr( 1 , whitespace - 1 );			
				transform( prog.begin(), prog.end(), prog.begin(), ::toupper);
				map< string , vector< string > >::iterator it = act2ins.find( prog );

				if( _debug ) execution << "[INFO] SEARCHING " << prog << "..." << endl;

				if( it != act2ins.end() ) {
					// vector of params
					vector< string > vp; 
					string params = line.substr( whitespace + 1 ), param;
					istringstream issp( params );
					while( issp>>param ){					
						transform(param.begin(), param.end(), param.begin(), ::toupper);
						vp.push_back( param );
					}
					// vector of instructions
					vector< string > vi = it->second; 
					for(int i = 0; i < int( vi.size() ); i++ ){
						string converted_instruction = vi[i];
						if( compilation_type == "PLPR" && p < procedures )
							converted_instruction = assignProcedure2Instruction( vi[i] , p );
						else if( compilation_type == "CFG" && p <= procedures ){
							if( p < procedures ) converted_instruction = assignProcedure2Instruction( vi[ i ], p );
							else converted_instruction = vi[ i ];
							if( converted_instruction.size() > 7u && converted_instruction.substr( 0, 7 ) == "INS-END" ){
								SStream ss;
								ss << "ALLOWED-LINE-" << p << "-" << getInstructionLine( vi[ i ] );
								addNewInstruction( ss.str() );
								addNewIntructionParameters( vector< string >() );
								pos++;
							}
						}

						if( _debug ) execution << "[INFO] FOUND!!! => " << vi[ i ] << " converted " << converted_instruction << endl;

						addNewInstruction( converted_instruction );
						addNewIntructionParameters( vector< string >() );

						if( i + 1 == int( vi.size() ) ){
							assignInstructionParameters( pos, vp );
						}

						pos++;
					}
				}
			}
	
			// add alloweds and ends
			if( compilation_type == "CFG" && p < procedures ){
				SStream ss;
				ss << "ALLOWED-LINE-" << p << "-1";
				addNewInstruction( ss.str() );
				addNewIntructionParameters( vector< string >() );
				pos++;
				ss.str("");
				int current_bound = getBound( p );
				if( current_bound > 1 ){
					ss << "ALLOWED-LINE-" << p << "-" << current_bound;
					addNewInstruction( ss.str() );
					addNewIntructionParameters( vector< string >() );
					pos++;
				}
				ss.str("");
				ss << "INS-END-" << p << "-" << current_bound;
				addNewInstruction( ss.str() );
				addNewIntructionParameters( vector< string >() );
				pos++;
			}

			if( _debug ) execution << "[INFO] PROCEDURE " << p << " FINISHED. " << endl;

			itest.close();		
		}

		if( _debug ) execution << "[INFO] CALLING PRINT INSTRUCTIONS..." << endl;
	
		printInstructions();

		if( _debug ){
			execution << "[INFO] PRINT INSTRUCTIONS FINISHED" << endl;
			// TEST
			execution << "[INFO] STARTING TESTS..." << endl;
		}

		if( isTesting() ){
			parser::pddl::Domain *cd = new parser::pddl::Domain( dest_domain.c_str() );
			getConstants( cd );
			vector< int > solved, unsolved;
		
			for( unsigned i = 0; i < (unsigned)ntest_inst; i++ ){
				callTestCompiler( i );
				if( getPlan().length() != 0 ){
					solved.push_back( i );
					for( int i = 10; i > 0; i-- ){
						string sas_plan = "sas_plan." + to_string( i );
						ifstream ifs( sas_plan.c_str() );
						if( ifs ){
							ifs.close();
							system( string( "rm -f " + sas_plan ).c_str() );
						}
						ifs.close();
					}
				}
				else unsolved.push_back( i );
			}
			execution << "[INFO] Test solved[" << config_file << "]: " << solved.size() << "/" << ntest_inst << endl;
			execution << "[INFO] Solved:";
			for( unsigned i = 0; i < solved.size(); i++ ) execution << " " << solved[ i ]; execution << endl;
			execution << "[INFO] Unsolved:";
			for( unsigned i = 0; i < unsolved.size(); i++ ) execution << " " << unsolved[ i ]; execution << endl;
		}

		if( _debug ){
			execution << "[INFO] FINISHING EXECUTION" << endl;
			execution.close();
		}

		return 0;
	}
};
#endif
