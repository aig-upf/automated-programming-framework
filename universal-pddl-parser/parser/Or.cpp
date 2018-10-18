
#include "Domain.h"

namespace parser { namespace pddl {

void Or::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	tabindent( s, indent );
	s << "( OR\n";
	if ( first ) first->PDDLPrint( s, indent + 1, ts, d );
	else {
		tabindent( s, indent + 1 );
		s << "()";
	}
	s << "\n";
	if ( second ) second->PDDLPrint( s, indent + 1, ts, d );
	else {
		tabindent( s, indent + 1 );
		s << "()";
	}
	s << "\n";
	tabindent( s, indent );
	s << ")";
}

void Or::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	f.next();
	f.assert_token( "(" );
	if ( f.getChar() != ')' ) {
		first = d.createCondition( f );
		first->parse( f, ts, d );
	}
	else ++f.c;

	f.next();
	f.assert_token( "(" );
	if ( f.getChar() != ')' ) {
		second = d.createCondition( f );
		second->parse( f, ts, d );
	}
	else ++f.c;

	f.next();
	f.assert_token( ")" );
}


} } // namespaces
