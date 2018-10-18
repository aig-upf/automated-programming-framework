
#pragma once

#include "Condition.h"

namespace parser { namespace pddl {

class When : public Condition {

public:

	Condition *pars, *cond;

	When()
		: pars( 0 ), cond( 0 ) {}

	When( const When * w, Domain & d )
		: pars( 0 ), cond( 0 ) {
		if ( w->pars ) pars = w->pars->copy( d );
		if ( w->cond ) cond = w->cond->copy( d );
	}

	~When() {
		if ( pars ) delete pars;
		if ( cond ) delete cond;
	}

	void print( std::ostream & s ) const {
		s << "WHEN:\n";
		if ( pars ) pars->print( s );
		if ( cond ) cond->print( s );
	}

	void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const override;

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

	void addParams( int m, unsigned n ) {
		pars->addParams( m, n );
		cond->addParams( m, n );
	}

	Condition * copy( Domain & d ) {
		return new When( this, d );
	}

};

} } // namespaces
