#include "main.h"

string Main::getError( int num ){
	string error = "[ERROR]";
	switch(num){
	case 1:
		error += " Less than 2 arguments, the execution must be ./main_nir config/[conf_file].txt";
		break;
	default:
		error += " undefined";
		break;
	}
	return error;
}

string Main::getPlan(){
	ifstream ifs( "plan.ipc" );
	if( ifs ){
		ifs.close();
		return "plan.ipc";
	}
	return "";
}

string Main::getPlannerCommand( unsigned timeout ){
	//return "python2.7 PLANNERS/BFWS/fd-version/bfws.py domain.pddl ins.pddl DUAL-BFWS";
	return "python2.7 PLANNERS/BFWS/fd-version/bfws.py domain.pddl ins.pddl BFWS-f5-landmarks";
	//return "python2.7 PLANNERS/BFWS/fd-version/bfws.py domain.pddl ins.pddl BFWS-f5";
	//return "python2.7 PLANNERS/lapkt/planners/brfs/brfs.py domain.pddl ins.pddl out";
}

int main( int argc , char *argv[] ){

	Main *m = new Main( argc, argv );

	m->run();

	if( m ) delete m;

	return 0;

}
