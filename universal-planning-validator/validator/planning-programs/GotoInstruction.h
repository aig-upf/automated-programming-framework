#pragma once

#include <validator/planning-programs/ProgramInstruction.h>
#include <validator/planning-programs/GotoConditionInstruction.h>

class GotoInstruction : public ProgramInstruction {
public:
    long jumpLine;
    GotoConditionInstruction * condition;

    GotoInstruction( const std::string& instr );

    virtual ~GotoInstruction();

    InstructionResult run( Domain * d, Instance * ins, State * currentState );
};
