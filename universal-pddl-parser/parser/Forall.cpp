
#include "Domain.h"

namespace parser { namespace pddl {

void Forall::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	tabindent( s, indent );
	s << "( FORALL\n";

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

void Forall::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	f.next();
	f.assert_token( "(" );

	TokenStruct< std::string > fs = f.parseTypedList( true, d.types );
	params = d.convertTypes( fs.types );

	TokenStruct< std::string > fstruct( ts );
	fstruct.append( fs );

	f.next();
	f.assert_token( "(" );
	if ( f.getChar() != ')' ) {
		cond = d.createCondition( f );
		cond->parse( f, fstruct, d );
	}
	else ++f.c;

	f.next();
	f.assert_token( ")" );
}

} } // namespaces
