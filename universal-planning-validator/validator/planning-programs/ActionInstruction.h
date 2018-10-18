#pragma once

#include <validator/planning-programs/ProgramInstruction.h>

class ActionInstruction : public ProgramInstruction {
public:
    std::string name;

    ActionInstruction( const std::string& instr );
    
    InstructionResult run( Domain * d, Instance * ins, State * currentState );
};
