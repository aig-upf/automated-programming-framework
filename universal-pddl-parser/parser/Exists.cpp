
#include "Domain.h"

namespace parser { namespace pddl {

void Exists::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	tabindent( s, indent );
	s << "( EXISTS\n";

	TokenStruct< std::string > fstruct( ts );

	tabindent( s, indent + 1 );
	printParams( 0, s, fstruct, d );

	if ( cond ) cond->PDDLPrint( s, indent + 1, fstruct, d );
	else {
		tabindent( s, indent + 1 );
		s << "()";
	}
	s << "\n";
	tabindent( s, indent );
	s << ")";
}

void Exists::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	f.next();
	f.assert_token( "(" );

	TokenStruct< std::string > es = f.parseTypedList( true, d.types );
	params = d.convertTypes( es.types );

	TokenStruct< std::string > estruct( ts );
	estruct.append( es );

	f.next();
	f.assert_token( "(" );
	if ( f.getChar() != ')' ) {
		cond = d.createCondition( f );
		cond->parse( f, estruct, d );
	}
	else ++f.c;

	f.next();
	f.assert_token( ")" );
}

} } // namespaces
