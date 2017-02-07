
#include "Instance.h"

int main( int argc, char *argv[] ) {
	if ( argc < 3 ) {
		std::cout << "Usage: ./Domain <domain.pddl> <task.pddl>\n";
		exit( 1 );
	}

	// Read multiagent domain and instance

	Domain d( argv[1] );
	Instance ins( d, argv[2] );

	d.PDDLPrint( std::cout );
	ins.PDDLPrint( std::cerr );
}
