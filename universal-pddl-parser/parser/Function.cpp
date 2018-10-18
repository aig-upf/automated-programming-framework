
#include "Domain.h"

namespace parser { namespace pddl {

void Function::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	Lifted::PDDLPrint( s, indent, ts, d );
	if ( returnType >= 0 ) s << " - " << d.types[returnType]->name;
}

void Function::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	Lifted::parse( f, ts, d );
	
	f.next();
	if ( f.getChar() == '-' ) {
		f.assert_token( "-" );
		std::string s = f.getToken();
		if ( s != "NUMBER" ) {
			f.c -= s.size();
			returnType = d.types.index( f.getToken( d.types ) );
		}
	}
}

} } // namespaces
