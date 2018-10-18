#include <validator/PlanAction.h>
#include <validator/Message.h>
#include <validator/PlanValidator.h>
#include <validator/ConditionChecker.h>
#include <validator/Utils.h>

PlanAction::PlanAction( const std::string& name, const StringVec& params )
    : name( name ), params( params ) {}

bool PlanAction::holds( State * s, Domain * d ) {
    if ( d->actions.index( name ) >= 0 ) {
        Action * a = d->actions.get( name );
        return ConditionChecker::holds( s, d, a->pre, params );
    }

    showErrorMsg( "Unknown action " + getActionName() );
    return false;
}

void PlanAction::apply( State * s, Domain * d, Instance * ins ) {
    Action * a = d->actions.get( name );
    if ( a ) {
        GroundedObjVec addList, deleteList;
        FunctionModifierObjVec funcList; // list of changed functions

        applyRec( s, d, ins, a->eff, addList, deleteList, funcList );

        applyDeleteList( s, deleteList );
        applyAddList( s, addList );
        applyFuncList( s, funcList );
    }
}

std::string PlanAction::getActionName() const {
    std::stringstream ss;
    ss << "(" << name;
    for ( unsigned i = 0; i < params.size(); ++i ) {
        ss << " " << params[i];
    }
    ss << ")";
    return ss.str();
}

void PlanAction::applyRec( State * s, Domain * d, Instance * ins, Condition * c, GroundedObjVec& addList, GroundedObjVec& deleteList, FunctionModifierObjVec& funcList ) {
    And * a = dynamic_cast< And * >( c );
    if ( a ) {
        for ( unsigned i = 0; i < a->conds.size(); ++i ) {
            applyRec( s, d, ins, a->conds[i], addList, deleteList, funcList );
        }
    }

    Ground * g = dynamic_cast< Ground * >( c );
    if ( g ) {
        addList.push_back( std::make_pair( g->name, getObjectParameters( d, g, params ) ) );
    }

    Not * n = dynamic_cast< Not * >( c );
    if ( n ) {
        Ground * ng = n->cond;
        deleteList.push_back( std::make_pair( ng->name, getObjectParameters( d, ng, params ) ) );
    }

    Forall * f = dynamic_cast< Forall * >( c );
    if ( f ) {
        StringVec forallParams = d->typeList( f );
        forallApplyRec( forallParams, 0, s, d, ins, f->cond, addList, deleteList, funcList );
    }

    When * w = dynamic_cast< When * >( c );
    if ( w ) {
        bool conditionHolds = ConditionChecker::holds( s, d, w->pars, params );
        if ( conditionHolds ) {
            applyRec( s, d, ins, w->cond, addList, deleteList, funcList );
        }
    }

    FunctionModifier * fm = dynamic_cast< FunctionModifier * >( c );
    if ( fm ) {
        std::string functionName = fm->modifiedGround ? fm->modifiedGround->name : "TOTAL-COST";
        StringVec functionParameters = getObjectParameters( d, fm->modifiedGround, params );
        double changedValue = fm->modifierExpr->evaluate( *ins, params );

        if ( dynamic_cast< Decrease * >( fm ) ) {
            changedValue *= -1.0;
        }

        funcList.push_back( FunctionModifierObj( functionName, functionParameters, changedValue ) );
    }
}

void PlanAction::forallApplyRec( const StringVec& forallParams, unsigned paramIndex, State * s, Domain * d, Instance * ins, Condition * c, GroundedObjVec& addList, GroundedObjVec& deleteList, FunctionModifierObjVec& funcList ) {
    if ( paramIndex < forallParams.size() ) {
        Type * type = d->getType( forallParams[paramIndex] );

        long numConstants = type->noConstants();
        long numObjects = type->noObjects() - numConstants;

        for ( long i = -numConstants; i < numObjects; ++i ) {
            std::pair< std::string, int > typeObj = type->object( i );

            if ( !typeObj.first.empty() ) {
                params.push_back( typeObj.first );  // expand action params
                forallApplyRec( forallParams, paramIndex + 1, s, d, ins, c, addList, deleteList, funcList );
                params.pop_back();  // remove previously added params
            }
        }
    }
    else {
        // all forall parameters instantiated and added to action params,
        // continue checking satisfiability
        applyRec( s, d, ins, c, addList, deleteList, funcList );
    }
}

void PlanAction::applyDeleteList( State * s, const GroundedObjVec& deleteList ) const {
    for ( auto it = deleteList.begin(); it != deleteList.end(); ++it ) {
        if ( showVerbose() ) {
            showMsg( "Deleting " + getGroundedObjectStr( *it ) );
        }
        s->removeFluent( it->first, it->second );
    }
}

void PlanAction::applyAddList( State * s, const GroundedObjVec& addList ) const {
    for ( auto it = addList.begin(); it != addList.end(); ++it ) {
        if ( showVerbose() ) {
            showMsg( "Adding " + getGroundedObjectStr( *it ) );
        }
        s->addFluent( it->first, it->second );
    }
}

void PlanAction::applyFuncList( State * s, const FunctionModifierObjVec& funcList ) const {
    for ( auto it = funcList.begin(); it != funcList.end(); ++it ) {
        if ( showVerbose() ) {
            showFunctionValueUpdateMsg( s, *it );
        }
        s->modifyFunctionValue( it->fname, it->fparams, it->changedValue );
    }
}

void PlanAction::showFunctionValueUpdateMsg( State * s, const FunctionModifierObj& fmo ) const {
    std::stringstream ss;
    ss << "Updating " << getFunctionModifierObjectStr( fmo );
    ss << " (" << s->getValueForFunction( fmo.fname, fmo.fparams ) << ") ";
    ss << "by " << fmo.changedValue << " increase";
    showMsg( ss.str() );
}

std::string getGroundedObjectStr( const GroundedObj& go ) {
    std::stringstream ss;
    ss << "(" << go.first;
    for ( unsigned i = 0; i < go.second.size(); ++i ) {
        ss << " " << go.second[i];
    }
    ss << ")";
    return ss.str();
}

std::string getFunctionModifierObjectStr( const FunctionModifierObj& fmo ) {
    std::stringstream ss;
    ss << "(" << fmo.fname;
    for ( unsigned i = 0; i < fmo.fparams.size(); ++i ) {
        ss << " " << fmo.fparams[i];
    }
    ss << ")";
    return ss.str();
}
