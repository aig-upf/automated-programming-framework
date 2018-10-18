#pragma once

#include <validator/planning-programs/ProgramInstruction.h>

class GotoConditionInstruction : public ProgramInstruction {
public:
    std::string predicateName;
    StringVec predicateParams;

    GotoConditionInstruction( const std::string& instr, const StringVec& instrParams );

    InstructionResult run( Domain * d, Instance * ins, State * currentState );
};
