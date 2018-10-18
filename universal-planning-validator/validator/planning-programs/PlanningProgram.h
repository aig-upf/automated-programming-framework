#pragma once

#include <stack>

#include <parser/Instance.h>
#include <parser/Filereader.h>

#include <validator/Plan.h>
#include <validator/planning-programs/ProgramInstruction.h>
#include <validator/planning-programs/ProgramProcedure.h>

using namespace parser::pddl;

class PlanningProgram : public Plan {
public:
    // prefixes of the different kinds of instructions in a planning program
    const std::string INSTR_PREFIX = "INS-";
    const std::string GOTO_PREFIX = "GOTO-";
    const std::string GOTO_COND_PREFIX = "COND-";
    const std::string END_PREFIX = "INS-END-";
    const std::string CALL_PREFIX = "CALL-";

    std::map< unsigned, ProgramProcedure * > procedures;
    long mainProcedureId;

    // number of run actions after executing the plan
    unsigned numRunActions;

    PlanningProgram();
    PlanningProgram( const std::string & s );

    virtual ~PlanningProgram();

    void parse( const std::string & s );
    bool run( Domain * d, Instance * ins, State * currentState );

    unsigned getNumActions() const;

    virtual std::ostream& print( std::ostream& stream ) const {
        return stream;
    }

protected:
    void addInstructionsToProcedures( InstructionVec& instructions );
    void addInstructionToProcedure( ProgramInstruction * pi );
};

bool startsWith( const std::string& testStr, const std::string& prefix );
