
#include "Domain.h"

namespace parser { namespace pddl {

void Oneof::PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const {
	tabindent( s, indent );
	s << "( ONEOF\n";
	for ( unsigned i = 0; i < conds.size(); ++i ) {
		conds[i]->PDDLPrint( s, indent + 1, ts, d );
		s << "\n";
	}
	tabindent( s, indent );
	s << ")";
}

void Oneof::parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {
	for ( f.next(); f.getChar() != ')'; f.next() ) {
		f.assert_token( "(" );
		Condition * condition = d.createCondition( f );
		condition->parse( f, ts, d );
		conds.push_back( condition );
	}
	++f.c;
}

} } // namespaces
