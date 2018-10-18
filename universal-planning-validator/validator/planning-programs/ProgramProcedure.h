#pragma once

#include <validator/planning-programs/ProgramInstruction.h>

using namespace parser::pddl;

class ProgramProcedure {
public:
    unsigned procedureId;
    InstructionVec instructions;

    ProgramProcedure( unsigned pid );

    ~ProgramProcedure();

    void addInstruction( ProgramInstruction * pi );

    ProgramInstruction * getInstruction( unsigned i );

    unsigned getNumInstructions() const;
};
