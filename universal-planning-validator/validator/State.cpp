#include <validator/State.h>

State::State( Domain * d, Instance * ins ) {
    set( d, ins );
}

void State::set( Domain * d, Instance * ins ) {
    for ( unsigned i = 0; i < d->preds.size(); ++i ) {
        const std::string& pname = d->preds[i]->name;
        fluents[pname] = std::set< StringVec >();
    }

    for ( unsigned i = 0; i < d->funcs.size(); ++i ) {
        const std::string& fname = d->funcs[i]->name;
        functions[fname] = std::map< StringVec, double >();
    }

    const GroundVec& initialState = ins->init;
    for ( unsigned i = 0; i < initialState.size(); ++i ) {
        const std::string& groundName = initialState[i]->name;
        if ( fluents.find( groundName ) != fluents.end() ) {
            fluents[groundName].insert( d->objectList( initialState[i] ) );
        }
        else if ( functions.find( groundName ) != functions.end() ) {
            GroundFunc<int> * gfi = dynamic_cast< GroundFunc<int> * >( initialState[i] );
            if ( gfi ) {
                functions[groundName][d->objectList( initialState[i] )] = gfi->value;
            }

            GroundFunc<double> * gfd = dynamic_cast< GroundFunc<double> * >( initialState[i] );
            if ( gfd ) {
                functions[groundName][d->objectList( initialState[i] )] = gfd->value;
            }
        }
    }

    if ( d->costs ) {
        addTotalCostFunction(); // add TOTAL-COST function if does not exist
    }
}

bool State::holds( bool neg, const std::string& name, const StringVec& params ) {
    std::set< StringVec >& activeFluents = getActiveFluents( name );
    bool fluentExists = activeFluents.find( params ) != activeFluents.end();
    return ( neg && !fluentExists ) || ( !neg && fluentExists );
}

void State::addFluent( const std::string& name, const StringVec& params ) {
    std::set< StringVec >& activeFluents = getActiveFluents( name );
    if ( activeFluents.find( params ) == activeFluents.end() ) {
        activeFluents.insert( params );
    }
}

void State::removeFluent( const std::string& name, const StringVec& params ) {
    std::set< StringVec >& activeFluents = getActiveFluents( name );
    std::set< StringVec >::iterator af = activeFluents.find( params );
    if ( af != activeFluents.end() ) {
        activeFluents.erase( af );
    }
}

void State::modifyFunctionValue( const std::string& name, const StringVec& params, double changeValue ) {
    if ( functions[name].find( params ) == functions[name].end() ) {
        std::stringstream ss;
        ss << name << params;
        throw UndefinedFunctionValue( ss.str() );
    }

    functions[name][params] += changeValue;
}

bool State::satisfiesGoal( Domain * d, Instance * ins ) {
    const GroundVec& goalConditions = ins->goal;
    for ( unsigned i = 0; i < goalConditions.size(); ++i ) {
        if ( !holds( false, goalConditions[i]->name, d->objectList( goalConditions[i] ) ) ) {
            return false;
        }
    }

    return true;
}

double State::getTotalCostValue() const {
    return getValueForFunction( "TOTAL-COST", StringVec() );
}

double State::getValueForFunction( const std::string& name, const StringVec& params ) const {
    auto functionIt = functions.find( name );
    if ( functionIt != functions.end() ) {
        auto functionParamsIt = functionIt->second.find( params );
        if ( functionParamsIt != functionIt->second.end() ) {
            return functionParamsIt->second;
        }
    }

    std::stringstream ss;
    ss << name << params;
    throw UndefinedFunctionValue( ss.str() );
}

std::map< std::string, std::set< StringVec > >& State::getFluents( ) {
	return fluents;
}

std::set< StringVec >& State::getActiveFluents( const std::string& name ) {
    auto fluentSet = fluents.find( name );

    if ( fluentSet != fluents.end() ) {
        return fluentSet->second;
    }
    else {
        throw UndefinedFluent( name );
    }
}

void State::addTotalCostFunction() {
    auto totalCostFunction = functions.find( "TOTAL-COST" );
    if ( totalCostFunction == functions.end() ) {
        functions["TOTAL-COST"] = std::map< StringVec, double >();
    }

    StringVec totalCostParams;
    auto totalCostParamsIt = functions["TOTAL-COST"].find( totalCostParams );
    if ( totalCostParamsIt == functions["TOTAL-COST"].end() ) {
        functions["TOTAL-COST"][totalCostParams] = 0.0;
    }
}
