#include <validator/planning-programs/ActionInstruction.h>
#include <validator/PlanValidator.h>
#include <validator/Message.h>

ActionInstruction::ActionInstruction( const std::string& instr ) {
    long firstDash = instr.find( '-' );
    long lastDash = instr.rfind( '-' );
    long penultimateDash = instr.substr( 0, lastDash ).rfind( '-' );

    bool existsProcedureId = false;
    std::string procedureIdStr = instr.substr( penultimateDash + 1, lastDash - penultimateDash - 1 );

    try {
        procedureId = std::stoi( procedureIdStr );
        existsProcedureId = true;
    }
    catch ( const std::invalid_argument& ia ) {
        procedureId = -1;  // only one procedure exists!
    }

    if ( existsProcedureId ) {
        name = instr.substr( firstDash + 1, penultimateDash - firstDash - 1 );
    }
    else {
        name = instr.substr( firstDash + 1, lastDash - firstDash - 1 );
    }

    line = std::stoi( instr.substr( lastDash + 1, instr.length() - lastDash ) );
}

InstructionResult ActionInstruction::run( Domain * d, Instance * ins, State * currentState ) {
    bool verbose = PlanValidator::getInstance()->getVerbose();

    if ( verbose ) {
        showMsg( "Checking action " + name + " - Procedure: " + std::to_string( procedureId ) + " - Line: " + std::to_string( line ) );
    }

    PlanAction pa( name, StringVec() );

    bool stateHolds = pa.holds( currentState, d );
    if ( stateHolds ) {
        pa.apply( currentState, d, ins );
    }
	else{
		showErrorMsg( "Error: Inapplicable action " + name + " - Procedure: " + std::to_string( procedureId ) + " - Line: " + std::to_string( line ) ); 
	}

    if ( verbose ) {
        showMsg( "" );
    }

    return InstructionResult( stateHolds, procedureId, line + 1 );
}
