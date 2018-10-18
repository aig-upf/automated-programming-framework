#include <validator/ConditionChecker.h>

bool ConditionChecker::holds( State * s, Domain * d, Condition * c, StringVec& params ) {
    StringVec copyParams = params;
    return holdsRec( s, d, c, copyParams );
}

bool ConditionChecker::holdsRec( State * s, Domain * d, Condition * c, StringVec& params ) {
    And * a = dynamic_cast< And * >( c );
    if ( a ) {
        for ( unsigned i = 0; i < a->conds.size(); ++i ) {
            if ( !holdsRec( s, d, a->conds[i], params ) ) {
                return false;
            }
        }
    }

    Equals * eq = dynamic_cast< Equals * >( c );
    if ( eq ) {
        StringVec objParams = getObjectParameters( d, eq, params );
        return objParams[0] == objParams[1];
    }

    Derived * dv = dynamic_cast< Derived * >( c );
    if ( dv ) {
        return holdsRec( s, d, dv->cond, params );
    }

    Ground * g = dynamic_cast< Ground * >( c );
    if ( g ) {
        // check if the ground is actually a derived predicate
        if ( d->derived.index( g->name ) >= 0 ) {
            Derived * dv = d->derived.get( g->name );
            return holdsRec( s, d, dv->cond, params );
        }

        // if it is an actual ground...
        if ( !s->holds( false, g->name, getObjectParameters( d, g, params ) ) ) {
            return false;
        }
    }

    Not * n = dynamic_cast< Not * >( c );
    if ( n ) {
        return !holdsRec( s, d, n->cond, params );
    }

    Forall * f = dynamic_cast< Forall * >( c );
    if ( f ) {
        StringVec forallParams = d->typeList( f );
        return forallHoldsRec( forallParams, 0, s, d, f->cond, params );
    }

    Exists * e = dynamic_cast< Exists * >( c );
    if ( e ) {
        StringVec existsParams = d->typeList( e );
        return existsHoldsRec( existsParams, 0, s, d, e->cond, params );
    }

    Or * o = dynamic_cast< Or * >( c );
    if ( o ) {
        return holdsRec( s, d, o->first, params ) || holdsRec( s, d, o->second, params );
    }

    return true;
}

bool ConditionChecker::forallHoldsRec( const StringVec& forallParams, unsigned paramIndex, State * s, Domain * d, Condition * c, StringVec& params ) {
    if ( paramIndex < forallParams.size() ) {
        Type * type = d->getType( forallParams[paramIndex] );

        long numConstants = type->noConstants();
        long numObjects = type->noObjects() - numConstants;

        for ( long i = -numConstants; i < numObjects; ++i ) {
            std::pair< std::string, int > typeObj = type->object( i );

            if ( !typeObj.first.empty() ) {
                params.push_back( typeObj.first );  // expand action params
                bool result = forallHoldsRec( forallParams, paramIndex + 1, s, d, c, params );
                params.pop_back();  // remove previously added params

                if ( !result ) {
                    return false;
                }
            }
        }
    }
    else {
        // all forall parameters instantiated and added to action params,
        // continue checking satisfiability
        return holdsRec( s, d, c, params );
    }

    return true;
}

bool ConditionChecker::existsHoldsRec( const StringVec& existsParams, unsigned paramIndex, State * s, Domain * d, Condition * c, StringVec& params ) {
    if ( paramIndex < existsParams.size() ) {
        Type * type = d->getType( existsParams[paramIndex] );

        long numConstants = type->noConstants();
        long numObjects = type->noObjects() - numConstants;

        for ( long i = -numConstants; i < numObjects; ++i ) {
            std::pair< std::string, int > typeObj = type->object( i );

            if ( !typeObj.first.empty() ) {
                params.push_back( typeObj.first );  // expand action params
                bool result = existsHoldsRec( existsParams, paramIndex + 1, s, d, c, params );
                params.pop_back();  // remove previously added params

                if ( result ) {
                    return true;
                }
            }
        }
    }
    else {
        return holdsRec( s, d, c, params );
    }

    return false;
}
