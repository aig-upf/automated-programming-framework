#pragma once

#include <parser/Instance.h>
#include <parser/Filereader.h>

#include <validator/Plan.h>
#include <validator/PlanAction.h>

using namespace parser::pddl;

class ClassicalPlan : public Plan {
public:
    std::vector< PlanAction > actions;

    ClassicalPlan();
    ClassicalPlan( const std::string & s );

    void parse( const std::string & s );
    bool run( Domain * d, Instance * ins, State * currentState );

    unsigned getNumActions() const;

    virtual std::ostream& print( std::ostream& stream ) const {
        for ( unsigned i = 0; i < actions.size(); ++i ) {
            stream << actions[i];
        }
        return stream;
    }
};
