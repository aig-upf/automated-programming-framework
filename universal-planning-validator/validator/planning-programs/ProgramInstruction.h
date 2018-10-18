#pragma once

#include <stdexcept>
#include <validator/PlanAction.h>

class InstructionResult {
public:
    bool success;
    long targetProcedureId;
    long targetLine;

    InstructionResult( bool psuccess, long ptargetProcedureId, long ptargetLine):
        success( psuccess ), targetProcedureId( ptargetProcedureId ), targetLine( ptargetLine )
    {

    }
};

class ProgramInstruction {
public:
    long line;
    long procedureId;

    virtual ~ProgramInstruction() {}

    virtual InstructionResult run( Domain * d, Instance * ins, State * currentState ) = 0;
};

typedef std::vector< ProgramInstruction * > InstructionVec;

struct ProgramInstructionCmp {
    inline bool operator() ( const ProgramInstruction * lhs, const ProgramInstruction * rhs ) {
        if ( lhs->procedureId == rhs->procedureId ) {
            return lhs->line < rhs->line;
        }

        return lhs->procedureId > rhs->procedureId;
    }
};
