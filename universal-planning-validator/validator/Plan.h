#pragma once

#include <parser/Instance.h>
#include <parser/Filereader.h>

#include <validator/State.h>

using namespace parser::pddl;

class Plan {
public:
    std::string name;

    virtual ~Plan() {}

    virtual void parse( const std::string & s ) = 0;

    // runs plan and returns if it could be completed
    virtual bool run( Domain * d, Instance * ins, State * currentState ) = 0;

    virtual unsigned getNumActions() const = 0;

    friend std::ostream& operator<<( std::ostream& os, const Plan& p ) {
        return p.print( os );
    }

    virtual std::ostream& print( std::ostream& stream ) const = 0;
};
