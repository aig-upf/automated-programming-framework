
#ifndef _EXISTS_H_
#define _EXISTS_H_

#include "ParamCond.h"

class Exists : public ParamCond {

public:

	Condition * cond;

	Exists()
		: cond( 0 ) {}

	Exists( const Exists * e, Domain & d )
		: ParamCond( e ), cond( 0 ) {
		if ( e->cond ) cond = e->cond->copy( d );
	}

	~Exists() {
		if ( cond ) delete cond;
	}

	void print( std::ostream & s ) const {
		s << "Exists" << params << ":\n";
		cond->print( s );
	}

	void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, Domain & d );

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

	void addParams( int m, unsigned n ) {
		cond->addParams( m, n );
	}

	Condition * copy( Domain & d ) {
		return new Exists( this, d );
	}

};

#endif
