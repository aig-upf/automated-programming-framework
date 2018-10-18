
#pragma once

#include "Ground.h"

namespace parser { namespace pddl {

class Not : public Condition {

public:

	Ground * cond;

	Not()
		: cond( 0 ) {}

	Not( Ground * g )
		: cond( g ) {}

	Not( const Not * n, Domain & d )
		: cond( 0 ) {
		if ( n->cond ) cond = ( Ground * )n->cond->copy( d );
	}

	~Not() {
		if ( cond ) delete cond;
	}

	void print( std::ostream & s ) const {
		s << "NOT ";
		if ( cond ) cond->print( s );
	}

	void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const override;

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

	void addParams( int m, unsigned n ) {
		cond->addParams( m, n );
	}

	Condition * copy( Domain & d ) {
		return new Not( this, d );
	}

};

} } // namespaces