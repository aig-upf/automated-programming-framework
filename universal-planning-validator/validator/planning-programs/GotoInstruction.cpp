#include <validator/planning-programs/GotoInstruction.h>

GotoInstruction::GotoInstruction( const std::string& instr ) {
    long firstDash = instr.find( '-' );
    long secondDash = -1;
    long thirdDash = instr.rfind( '-' );

    for ( unsigned i = firstDash + 1; i < thirdDash; ++i ) {
        if ( instr[i] == '-' ) {
            secondDash = i;
            break;
        }
    }

    procedureId = std::stoi( instr.substr( firstDash + 1, secondDash - firstDash) );
    line = std::stoi( instr.substr( secondDash + 1, thirdDash - secondDash) );
    jumpLine = std::stoi( instr.substr( thirdDash + 1, instr.length() - thirdDash - 1 ) );
}

GotoInstruction::~GotoInstruction() {
    delete condition;
}

InstructionResult GotoInstruction::run( Domain * d, Instance * ins, State * currentState ) {
    long nextLine = line + 1;

    InstructionResult res = condition->run( d, ins, currentState );
    if ( !res.success ) {
        nextLine = jumpLine;
    }

    return InstructionResult( true, procedureId, nextLine );
}
