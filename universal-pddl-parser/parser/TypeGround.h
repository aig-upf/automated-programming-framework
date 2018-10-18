
#pragma once

#include "Ground.h"

namespace parser { namespace pddl {

class TypeGround : public Ground {

public:

	TypeGround()
		: Ground() {}

	TypeGround( Lifted * l, const IntVec & p = IntVec() )
		: Ground( l, p ) {}

//	TypeGround( const TypeGround * tg )
//		: Ground( tg ) {}

	void PDDLPrint( std::ostream & s, unsigned indent, const TokenStruct< std::string > & ts, const Domain & d ) const override;

	void insert( Domain & d, const StringVec & v );

	void parse( Filereader & f, TokenStruct< std::string > & ts, Domain & d );

};

typedef std::vector< TypeGround * > TypeGroundVec;

} } // namespaces
