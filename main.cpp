#include "main.h"

string Main::getError( int num ){
	string error = "[ERROR]";
	switch(num){
	case 1:
		error += " Less than 2 arguments, the execution must be ./main config/[conf_file].txt";
		break;
	default:
		error += " undefined";
		break;
	}
	return error;
}

string Main::getPlan(){
	for( int i = 10; i > 0; i-- ){
		string sas_plan = "sas_plan." + to_string( i );
		ifstream ifs( sas_plan.c_str() );
		if( ifs ){
			ifs.close();
			return sas_plan;
		}
		ifs.close();
	}
	return "";
}

string Main::getPlannerCommand( unsigned timeout ){
	return "./planner.sh " + dest_domain + " " + dest_ins + " " + to_string( timeout );
}

int main( int argc , char *argv[] ){

	Main *m = new Main( argc, argv );

	m->run();

	if( m ) delete m;

	return 0;

}
