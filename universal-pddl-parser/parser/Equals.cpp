
#include "Domain.h"

namespace parser { namespace pddl {

void Equals::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	tabindent( s, indent );
	s << "( =";
	for ( unsigned i = 0; i < params.size(); ++i )
		s << " " << ts[params[i]];
	s << " )";
}

void Equals::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	f.next();
	params.resize( 2 );

	for ( unsigned i = 0; i < 2; ++i, f.next() ) {
		std::string s = f.getToken();
		int k = ts.index( s );
		if ( k >= 0 ) params[i] = k;
		else f.tokenExit( s );
	}

	f.assert_token( ")" );
}


} } // namespaces
