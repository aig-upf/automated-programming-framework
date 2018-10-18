#pragma once

#include <validator/planning-programs/ProgramInstruction.h>

class CallInstruction : public ProgramInstruction {
public:
    long targetProcedureId;

    CallInstruction( const std::string& instr );

    InstructionResult run( Domain * d, Instance * ins, State * currentState );
};
