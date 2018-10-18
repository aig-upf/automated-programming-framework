#include <validator/PlanValidator.h>
#include <validator/Message.h>

PlanValidator * PlanValidator::instance = nullptr;

PlanValidator::PlanValidator() : verbose( false ) {}

PlanValidator * PlanValidator::getInstance() {
    if ( instance == nullptr ) {
        instance = new PlanValidator();
    }
    return instance;
}

void PlanValidator::validate( Domain * d, Instance * ins, Plan * p ) const {
    showMsg( "Checking plan: " + p->name );

    if ( verbose ) {
        showMsg( "Plan Validation details\n-----------------------\n" );
    }

    State * currentState = new State( d, ins );

    bool isValidSeq = p->run( d, ins, currentState );
    if ( isValidSeq ) {
        showMsg( "Plan executed successfully - checking goal" );
        checkGoal( d, ins, p, currentState );
    }

    delete currentState;
}

void PlanValidator::setVerbose( bool v ) {
    verbose = v;
}

bool PlanValidator::getVerbose() const {
    return verbose;
}

void PlanValidator::checkGoal( Domain * d, Instance * ins, Plan * p, State * finalState ) const {
    if ( finalState->satisfiesGoal( d, ins ) ) {
        showSuccessMsg( "Success: Plan valid" );
        showSuccessMsg( "Value: " + std::to_string( getPlanCost( d, p, finalState ) )  + '\n' );
    }
    else {
        showErrorMsg( "Error: Goal not satisifed - Plan invalid\n" );
    }
}

double PlanValidator::getPlanCost( Domain * d, Plan * p, State * finalState ) const {
    if ( d->costs ) {
        return finalState->getTotalCostValue();
    }

    return p->getNumActions();
}

bool showVerbose() {
   return PlanValidator::getInstance()->getVerbose();
}
