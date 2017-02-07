
#ifndef _AND_H_
#define _AND_H_

#include "Condition.h"

class And : public Condition {

public:

	CondVec conds;

	And() {}

	And( const And * a, Domain & d ) {
		for ( unsigned i = 0; i < a->conds.size(); ++i )
			conds.push_back( a->conds[i]->copy( d ) );
	}

	~And() {
		for ( unsigned i = 0; i < conds.size(); ++i )
			delete conds[i];
	}

	void print( std::ostream & s ) const {
		for ( unsigned i = 0; i < conds.size(); ++i )
			conds[i]->print( s );
	}

	void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, Domain & d );

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

	void SHOPparse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

	void add( Condition * cond ) {
		conds.push_back( cond );
	}

	void addParams( int m, unsigned n ) {
		for ( unsigned i = 0; i < conds.size(); ++i )
			conds[i]->addParams( m, n );
	}

	Condition * copy( Domain & d ) {
		return new And( this, d );
	}

};

#endif
