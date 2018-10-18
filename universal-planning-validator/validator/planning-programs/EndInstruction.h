#pragma once

#include <validator/planning-programs/ProgramInstruction.h>

class EndInstruction : public ProgramInstruction {
public:
    EndInstruction( const std::string& instr );

    InstructionResult run( Domain * d, Instance * ins, State * currentState );
};
