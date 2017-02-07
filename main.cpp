#include<iostream>
#include<fstream>
#include<map>
#include<vector>
#include"bin/include.h"

using namespace std;

#define MAX_SAS 10

string sas_plan[ MAX_SAS ] = { 
		"sas_plan.1", "sas_plan.2", "sas_plan.3", "sas_plan.4" , "sas_plan.5" , 
		"sas_plan.6", "sas_plan.7", "sas_plan.8", "sas_plan.9" , "sas_plan.10" };
string compilation_type;
string exec_prog;
string orig_domain;
string dest_domain;
string dest_ins;
vector< int > bound;
vector< int > timeout;
int max_bound = 0;
int procedures;
//int total_stack_pred;
int stack_vars;
//int stack_size;
int test_stack_size;
int ntest_inst;
int test_time_bound;
unsigned number_variables;
unsigned number_slots;
unsigned number_classes;
vector< string > vstack_pred;
vector< string > vstack_vars;
vector< vector< string > > instances;
vector< string > test_instances;

vector< string > new_instructions;
vector< vector < string > > instruction_params;

bool _debug = false;
ofstream execution("execution.txt");

void init( int argc, char* argv[] ){
	#ifdef DEBUG
		_debug = true;
	#endif

	if( argc < 2 ){
		if( _debug ){
			execution << "[ERROR] Less than 2 arguments, the execution must be ./main config/[conf_file].txt" << endl;
		}
		exit( -1 );
	}

	//Config File
	ifstream ifs( argv[ 1 ] );

	//string comment_line;

	//getline( ifs , comment_line );

	ifs >> compilation_type;

	ifs >> exec_prog;

	ifs >> orig_domain;

	ifs >> dest_domain >> dest_ins;

	ifs >> procedures;

	bound.resize( procedures + 1 );

	timeout.resize( procedures + 1 );

	for( int p = 0 ; p < procedures + 1 ; p++ ){
		int cant;

		ifs >> bound[ p ] >> timeout[ p ] >> cant;
		
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



void read_act2ins(){

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

void toUpper( string &s ){
	for( int i = 0; i < int( s.length() ); i++ ){
		if(s[ i ] >= 'a' && s[ i ] <= 'z' )
			s[ i ] = s[ i ] - 'a' + 'A';	
	}
}

string get_sas_plan(){
	for( int i = MAX_SAS-1; i >= 0 ; i-- ){
		ifstream ifs( sas_plan[i].c_str() );
		if( ifs ){
			ifs.close();
			return sas_plan[ i ];
		}	
	}
	return "";
}

void call_compiler( int p = procedures , bool to_program = true ){ 
	ostringstream compiler;

	compiler << exec_prog << " " << compilation_type << " " << orig_domain << " " << instances[ p ].size();

	for( size_t i = 0; i < instances[ p ].size(); i++ ) 
		compiler << " " << instances[ p ][ i ];

	compiler << " " << max_bound << " " << bound[ p ] << " " << p << " " << total_stack_pred ;
	
	for( unsigned i = 0; i < total_stack_pred; i++ ){
		compiler << " " << vstack_pred[ i ] ;
	}
	
	compiler << " " << stack_vars;
	
	for( int i = 0; i < stack_vars; i++ ){
		compiler << " " << vstack_vars[ i ];	
	}
	
	compiler << " " << stack_size << " " << to_program << " " << number_variables << " " << number_slots << " " << number_classes << " > " << dest_domain << " 2> " << dest_ins;

	if( _debug )
		execution << "[INFO] SYSTEM CALL: " << compiler.str() << endl;

	int res_compiler_call = system( compiler.str().c_str() );
	
	if( _debug )
		execution << "[INFO] COMPILER CALL RESULT: " << res_compiler_call << endl;
}

///////////////////////////////////////////////////////////
// Preparing domain and instance to call the planner script
// Parameters: 
//		p => procedure identifier; 
//		to => timeout to kill the process
// Return: 
//		void
///////////////////////////////////////////////////////////
void call_planner( int p , int to ){
	if( p == procedures + 1 ){
		if( _debug )
			execution << "[INFO] CREATING COMPILED DOMAIN" << endl;
		Domain *cd = new Domain( dest_domain.c_str() );
		if( _debug )
			execution << "\t[INFO] DOMAIN READ" << endl;

		Instance* ins = new Instance( *cd , dest_ins.c_str() );

		if( _debug ){
			execution << "\t[INFO] INSTANCE READ" <<endl;
			execution << "\t[INFO] READING " << new_instructions.size() << " INSTRUCTIONS TO ADD" << endl;
		}
		for( int ins_id = 0; ins_id < int( new_instructions.size() ); ins_id++ ){ 
			if( _debug ){
				execution << "\t[INFO] INSTRUCTION " << ins_id << " - ";
				execution << new_instructions[ ins_id ] ;
			}
			if( instruction_params.size() > 0 ){
				for( string s : instruction_params[ ins_id ] ){	
					execution << " " << s ;
				}
				if( new_instructions[ ins_id ].substr( 0, 4 ) == "CALL" ){
					StringVec ips( ++instruction_params[ ins_id ].begin(), instruction_params[ ins_id ].end() );
					ins->addInit( new_instructions[ ins_id ], ips );
				}
				else{
					StringVec ips( instruction_params[ ins_id ].begin(), instruction_params[ ins_id ].end() );
					ins->addInit( new_instructions[ ins_id ], ips );
				}
			}
			else
				ins->addInit( new_instructions[ ins_id ] );
			if( _debug )
				execution << "\t[INFO] INSTRUCTION INSERTED" << endl;
		}
		if( _debug )
			execution << "\t[INFO] INSTACES ADDED" << endl;
		ofstream ofs( dest_ins.c_str() );
		ins->PDDLPrint( ofs );
		
	}
	else if( p > 0 ){
		if( _debug )
			execution << "[INFO] CREATING COMPILED DOMAIN" << endl;
		Domain *cd = new Domain( dest_domain.c_str() );
		if( _debug )
			execution << "\t[INFO] DOMAIN READ" << endl;
		Instance* ins = new Instance( *cd , dest_ins.c_str() );
		if( _debug ){
			execution << "\t[INFO] INSTANCE READ" <<endl;
			execution << "\t[INFO] READING " << new_instructions.size() << " INSTRUCTIONS TO ADD" << endl;
		}
		for( int ins_id = 0; ins_id < int( new_instructions.size() ); ins_id++ ){ 
			if( _debug ){
				execution << "\t[INFO] INSTRUCTION " << ins_id << " - " << new_instructions[ ins_id ] 
				<< " WITH " << instruction_params[ ins_id ].size() << " PARAMS." << endl;
				execution << "\t\t PARAMS: ";
				for( int ip = 0; ip < instruction_params[ ins_id ].size(); ip++ )
					execution << " " << instruction_params[ ins_id ][ ip ];
				execution << endl;
			}
			ins->addInit( new_instructions[ ins_id ] , instruction_params[ ins_id ] );
			if( _debug )
				execution << "\t[INFO] INSTRUCTION INSERTED" << endl;
		}
		if( _debug )
			execution << "\t[INFO] INSTACES ADDED" << endl;
		ofstream ofs( dest_ins.c_str() );
		ins->PDDLPrint( ofs );
	}

	ostringstream planner;

	planner << "./planner.sh " << dest_domain << " " << dest_ins << " " << to;

	if( _debug )
		execution << "[INFO] CALL TO PLANNER " << planner.str() << endl;

	int res_planner_call = system( planner.str().c_str() );

	if( _debug )
		execution << "[INFO] PLANNER CALL RESULT: " << res_planner_call << endl;
}


void call_test_compiler( bool to_program = false ){
	
		ostringstream compiler;

		compiler << exec_prog << " " << compilation_type << " " << orig_domain << " " << ntest_inst;

		for( string test_inst : test_instances ){
			 compiler << " " << test_inst;
		}

		compiler << " " << max_bound << " " << bound[ procedures ] << " " << procedures << " " << total_stack_pred;
		
		for( string predicate : vstack_pred ){
			compiler << " " << predicate;
		}

		compiler << " " << stack_vars;

		for( string variable : vstack_vars ){
			compiler << " " << variable;	
		}
	
		compiler << " " << test_stack_size << " " << to_program << " " << number_variables << " " << number_slots << " " << number_classes << " > " << dest_domain << " 2> " << dest_ins;

		if( _debug )
			execution << "[INFO] TEST SYSTEM CALL: " << compiler.str() << endl;

		int res_compiler_test = system( compiler.str().c_str() );

		if( _debug )
			execution << "[INFO] COMPILER TEST RESULT: " << res_compiler_test << endl;

		call_planner( procedures + 1, test_time_bound );

}

string convert( string &n , int p ){
	string numbers = "0123456789";
	size_t it = string::npos, itres = string::npos;

	for(int i=0; i < 10 ; i++){
		string tofind = "-" + numbers.substr( i , 1 );
		it = n.find( tofind );
		itres = min( it, itres );
	}

	string res = n;

	if( n.substr( 0 , 4 ) != "CALL" && n.substr( 0 , 4 ) != "GOTO" && n.substr( 0 , 4) != "COND" )
		res = n.substr( 0 , itres ) + "-" + string( 1 , '0' + p ) + n.substr( itres );
	else if( n.substr( 0, 4 ) == "GOTO" || n.substr( 0 , 4 ) == "COND" ){
		res = n.substr( 0 , itres ) + "-" + string( 1 , '0' + p ) + n.substr( itres + 2 );
	}

	if( _debug )
		execution << "[INFO] CONVERTING " << n << " TO " << res << endl;

	return res;
}

void print_instructions(){
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

int main( int argc , char *argv[] ){

	init( argc, argv );

	int pos = 0;

	for(int p = 0; p < procedures + 1; p++ ){

		if( _debug )
			execution << "[INFO] STARTING PROCEDURE " << p << endl;

		call_compiler( p );

		if( _debug )
			execution << "[INFO] COMPILED PROCEDURE " << p << endl;

		//if( p == 0 ) 
		read_act2ins();
	
		if( _debug )
			execution << "[INFO] ACTIONS FOUND: " << act2ins.size() << endl;

		call_planner( p , timeout[ p ] );

		if( _debug )
			execution << "[INFO] PLANNER FINISHED IN PROCEDURE " << p << endl;

		string sp = get_sas_plan();

		if( _debug )
			execution << "[INFO] EXTRACTING PLAN " << sp << endl;

		if(sp.length() == 0) return -1;

		stringstream ss( sp );
		ss << "cp " << sp << " " << p << "-" << sp;
		system( ss.str().c_str() );

		ifstream itest( sp.c_str() );
		string line;

		while( getline( itest , line ) ) {
			line = line.substr( 0 , line.length() - 1 );
			size_t whitespace = line.find_first_of(" ");
			string prog = line.substr( 1 , whitespace - 1 );
			toUpper( prog );
			map< string , vector< string > >::iterator it = act2ins.find( prog );

			if( _debug )
				execution << "[INFO] SEARCHING " << prog << "..." << endl;

			if( it != act2ins.end() ) {

				// vector of params
				vector< string > vp; 
				string params = line.substr( whitespace + 1 ), param;
				istringstream issp( params );
				while( issp>>param ){
					toUpper( param );
					vp.push_back( param );
				}
				// vector of instructions
				vector< string > vi = it->second; 
				for(int i = 0; i < int( vi.size() ); i++ ){
					string converted_instruction = vi[i];
					if( compilation_type == "PLPR" && p < procedures )
						converted_instruction = convert( vi[i] , p );	

					if( _debug )
						execution << "[INFO] FOUND!!! => " << vi[i] << " converted " << converted_instruction << endl;

					new_instructions.push_back( converted_instruction );
					instruction_params.push_back( vector< string > () );

					if( i + 1 == int( vi.size() ) ){
						instruction_params[ pos ] = vp;
					}

					pos++;
				}
			}
		}
		if( _debug )
			execution << "[INFO] PROCEDURE " << p << " FINISHED. " << endl;

		itest.close();		
	}

	if( _debug )
		execution << "[INFO] CALLING PRINT INSTRUCTIONS..." << endl;
	
	print_instructions();

	if( _debug ){
		execution << "[INFO] PRINT INSTRUCTIONS FINISHED" << endl;

		// TEST
		execution << "[INFO] STARTING TESTS..." << endl;
	}

	if( ntest_inst ){
		call_test_compiler( );
	}

	if( _debug ){
		execution << "[INFO] FINISHING EXECUTION" << endl;
		execution.close();
	}

	return 0;

}
