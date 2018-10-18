#include <validator/ClassicalPlan.h>
#include <validator/Message.h>
#include <validator/PlanValidator.h>

ClassicalPlan::ClassicalPlan() {}
ClassicalPlan::ClassicalPlan( const std::string & s ) {
    parse( s );
}

void ClassicalPlan::parse( const std::string & s ) {
    actions.clear();

    Filereader f( s );

    while ( !f.f.eof() && !f.s.empty() ) {
        f.c = 0;

        if ( f.getChar() != ';' ) {
            f.next();
            f.assert_token( "(" );
            f.next();

            std::string actionName = f.getToken();
            f.next();

            StringVec actionParams;
            while ( f.getChar() != ')' ) {
                actionParams.push_back( f.getToken() );
                f.next();
            }

            PlanAction pa( actionName, actionParams);
            actions.push_back( pa );
        }

        ++f.r;
        getline( f.f, f.s );
    }

    name = s;
}

bool ClassicalPlan::run( Domain * d, Instance * ins, State * currentState ) {
    bool verbose = PlanValidator::getInstance()->getVerbose();

    bool isValidSeq = true;

    unsigned actionNum = 1;
    auto action = actions.begin();

    for ( ; isValidSeq && action != actions.end(); ++action, ++actionNum ) {
        if ( verbose ) {
            showMsg( "Checking next happening (time " + std::to_string( actionNum ) + ")" );
        }

        if ( action->holds( currentState, d ) ) {
            action->apply( currentState, d, ins );
            if ( verbose ) {
                showMsg( "" );
            }
        }
        else {
            showMsg( "Plan failed because of unsatisfied precondition in:" );
            showMsg( action->getActionName() );
            showErrorMsg( "Error: Plan failed to execute\n" );
            isValidSeq = false;
        }
    }

    return isValidSeq;
}

unsigned ClassicalPlan::getNumActions() const {
    return actions.size();
}
