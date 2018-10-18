#include <validator/planning-programs/GotoConditionInstruction.h>
#include <validator/ConditionChecker.h>

GotoConditionInstruction::GotoConditionInstruction( const std::string& instr, const StringVec& instrParams )
    : predicateParams( instrParams )
{
    long firstDash = instr.find( '-' );
    long lastDash = instr.rfind( '-' );
    long penultimateDash = instr.substr( 0, lastDash ).rfind( '-' );

    predicateName = instr.substr( firstDash + 1, penultimateDash - firstDash - 1 );
    procedureId = std::stoi( instr.substr( penultimateDash + 1, lastDash - penultimateDash ) );
    line = std::stoi( instr.substr( lastDash + 1, instr.length() - lastDash - 1 ) );
}

InstructionResult GotoConditionInstruction::run( Domain * d, Instance * ins, State * currentState ) {
    // we don't know whether the predicate is grounded or it is a derived
    // predicate, so we have to check!
    if ( d->derived.index( predicateName ) >= 0 ) {
        Derived * dv = d->derived.get( predicateName );
        StringVec sv;
        bool result = ConditionChecker::holds( currentState, d, dv->cond, sv );
        return InstructionResult( result, procedureId, line );
    }

    bool result = currentState->holds( false, predicateName, predicateParams );
    return InstructionResult( result, procedureId, line );
}
