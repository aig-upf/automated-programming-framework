#include <iostream>
#include <cstring>
#include <parser/Instance.h>
#include <validator/Plan.h>
#include <validator/PlanValidator.h>
#include <validator/ClassicalPlan.h>
#include <validator/planning-programs/PlanningProgram.h>

using namespace parser::pddl;

void showHelp() {
    std::cout << "Universal Planning Validator\n";
    std::cout << "Usage: ./validate [options] <domain.pddl> <task.pddl> <plan>\n";
    std::cout << "Options:\n";
    std::cout << "\t-h\t-- Print this message.\n";
    std::cout << "\t-c\t-- Validate classical plan (default).\n";
    std::cout << "\t-p\t-- Validate planning program.\n";
    std::cout << "\t-v\t-- Verbose reporting of plan check progress.\n";
    exit( 1 );
}

typedef struct ProgramParams {
    bool verbose; // whether show extra validation information
    bool help; // whether show help
    bool classical, program; // type of problem being validated
    std::string domain, ins, plan;

    ProgramParams( int argc, char * argv[] )
        : verbose( false ), help( false ), classical( true ), program( false )
    {
        parseInputParameters( argc, argv );
    }

    void parseInputParameters( int argc, char * argv[] ) {
        if ( argc < 4 ) {
            showHelp();
        }

        int domainParam = 0;
        for ( int i = 1; i < argc; ++i ) {
            if ( argv[i][0] == '-') {
                if ( !strcmp( argv[i], "-h" ) ) {
                    help = true;
                }
                else if ( !strcmp( argv[i], "-v" ) ) {
                    verbose = true;
                }
                else if ( !strcmp( argv[i], "-c" ) ) {
                    classical = true;
                    program = false;
                }
                else if ( !strcmp( argv[i], "-p" ) ) {
                    program = true;
                    classical = false;
                }
            }
            else {
                domainParam = i;
                break;
            }
        }

        if ( argc > domainParam + 2 ) {
            domain = argv[domainParam];
            ins = argv[domainParam + 1];
            plan = argv[domainParam + 2];
        }
        else {
            showHelp();
        }
    }

} ProgramParams;

int main( int argc, char * argv[] ) {
    ProgramParams pp( argc, argv );

    if ( pp.help ) {
        showHelp();
    }

    Domain d( pp.domain );
    Instance ins( d, pp.ins );
    Plan * p = nullptr;

    if ( pp.classical ) {
        p = new ClassicalPlan( pp.plan );
    }
    else if ( pp.program ) {
        p = new PlanningProgram( pp.plan );
    }

    PlanValidator * pv = PlanValidator::getInstance();
    pv->setVerbose( pp.verbose );
    pv->validate( &d, &ins, p );

    delete p;

    return 0;
}
