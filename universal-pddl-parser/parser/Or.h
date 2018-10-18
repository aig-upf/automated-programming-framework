
#pragma once

#include "Condition.h"

namespace parser { namespace pddl {

class Or : public Condition {

public:
	Condition *first, *second;

	Or()
		: first( 0 ), second( 0 ) {}

	Or( const Or * o, Domain & d )
		: first( 0 ), second( 0 ) {
		if ( o->first ) first = o->first->copy( d );
		if ( o->second ) second = o->second->copy( d );
	}

	~Or() {
		if ( first ) delete first;
		if ( second ) delete second;
	}

	void print( std::ostream & s ) const {
		s << "OR:\n";
		if ( first ) first->print( s );
		if ( second ) second->print( s );
	}

	void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const override;

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

	void addParams( int m, unsigned n ) {
		first->addParams( m, n );
		second->addParams( m, n );
	}

	Condition * copy( Domain & d ) {
		return new Or( this, d );
	}
};

} } // namespaces