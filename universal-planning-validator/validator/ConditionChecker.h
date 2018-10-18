#pragma once

#include <validator/Utils.h>
#include <validator/State.h>

using namespace parser::pddl;

class ConditionChecker {
public:
    static bool holds( State * s, Domain * d, Condition * c, StringVec& params );

protected:
    static bool holdsRec( State * s, Domain * d, Condition * c, StringVec& params );

    static bool forallHoldsRec( const StringVec& forallParams, unsigned paramIndex, State * s, Domain * d, Condition * c, StringVec& params );

    static bool existsHoldsRec( const StringVec& existsParams, unsigned paramIndex, State * s, Domain * d, Condition * c, StringVec& params );
};
