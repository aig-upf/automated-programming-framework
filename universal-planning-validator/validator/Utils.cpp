#include <validator/Utils.h>

StringVec getObjectParameters( Domain * d, Ground * g, StringVec& params ) {
    if ( !g ) {
        // can happen when incrementing or decrementing TOTAL-COST
        return StringVec();
    }

    IntVec& groundParams = g->params;
    StringVec objParams;
    for ( unsigned i = 0; i < groundParams.size(); ++i ) {
        if ( groundParams[i] >= 0 ) {
            objParams.push_back( params[groundParams[i]] );
        }
        else { // constant
            Type * constantType = d->types[g->lifted->params[i]];
            objParams.push_back( constantType->object( groundParams[i] ).first );
        }
    }
    return objParams;
}
