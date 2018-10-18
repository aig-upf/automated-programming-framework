#include <validator/planning-programs/CallInstruction.h>

CallInstruction::CallInstruction( const std::string& instr ) {
    long firstDash = instr.find( '-' );
    std::string callParams = instr.substr( firstDash + 1, instr.length() - firstDash - 1 );

    long subFirstDash = callParams.find( '-' );
    long subLastDash = callParams.rfind( '-' );

    targetProcedureId = std::stoi( callParams.substr( 0, subFirstDash ) );
    procedureId = std::stoi( callParams.substr( subFirstDash + 1, subLastDash - subFirstDash - 1 ) );
    line = std::stoi( callParams.substr( subLastDash + 1, callParams.length() - subLastDash - 1 ) );
}

InstructionResult CallInstruction::run( Domain * d, Instance * ins, State * currentState ) {
    return InstructionResult( true, targetProcedureId, 0 );
}
