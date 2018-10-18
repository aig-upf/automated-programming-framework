
#pragma once

#include "ParamCond.h"

namespace parser { namespace pddl {

class Task : public ParamCond {

public:

	Task() {}

	Task( const std::string & s )
		: ParamCond( s ) {}

	Task( const ParamCond * c )
		: ParamCond( c ) {}

    void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const override {}

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d ) {}

	void addParams( int m, unsigned n ) {}

	Condition * copy( Domain & d ) {
		return new Task( this );
	}

};

typedef std::vector< Task * > TaskVec;

} } // namespaces