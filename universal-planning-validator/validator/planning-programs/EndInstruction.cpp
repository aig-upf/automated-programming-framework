#include <validator/planning-programs/EndInstruction.h>

EndInstruction::EndInstruction( const std::string& instr ) {
    long firstDash = instr.find( '-' );
    long lastDash = instr.rfind( '-' );
    long penultimateDash = instr.substr( 0, lastDash ).rfind( '-' );

    if ( firstDash == penultimateDash ) {
        procedureId = -1; // the end for the global program, not necessarily 0!!!
    }
    else {
        procedureId = std::stoi( instr.substr( penultimateDash + 1, lastDash - penultimateDash - 1 ) );
    }

    line = std::stoi( instr.substr( lastDash + 1, instr.length() - lastDash - 1 ) );
}

InstructionResult EndInstruction::run( Domain * d, Instance * ins, State * currentState ) {
    return InstructionResult( true, procedureId, -1 );
}
