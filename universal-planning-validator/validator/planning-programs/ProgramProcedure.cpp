#include <validator/planning-programs/ProgramProcedure.h>

ProgramProcedure::ProgramProcedure( unsigned pid ) :
    procedureId( pid )
{

}

ProgramProcedure::~ProgramProcedure() {
    for ( unsigned i = 0; i < instructions.size(); ++i ) {
        delete instructions[i];
    }
}

void ProgramProcedure::addInstruction( ProgramInstruction * pi ) {
    instructions.push_back( pi );
}

ProgramInstruction * ProgramProcedure::getInstruction( unsigned i ) {
    return instructions[i];
}

unsigned ProgramProcedure::getNumInstructions() const {
    return instructions.size();
}
