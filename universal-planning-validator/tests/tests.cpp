
#include <fstream>
#include <sstream>

#include <minicppunit/MiniCppUnit.h>
#include <parser/Instance.h>
#include <validator/PlanValidator.h>
#include <validator/Plan.h>
#include <validator/ClassicalPlan.h>
#include <validator/planning-programs/PlanningProgram.h>

class ClassicalPlanningTests : public TestFixture<ClassicalPlanningTests>
{
public:
    TEST_FIXTURE( ClassicalPlanningTests )
    {
        TEST_CASE( elevatorTest );
        TEST_CASE( existsTest );
        TEST_CASE( forallTest1 );
        TEST_CASE( forallTest2 );
        TEST_CASE( orTest );
        TEST_CASE( whenTest );
        TEST_CASE( citycarTest );
        TEST_CASE( cellularAutomataTest );
    }

    template < typename T >
    void checkEqual( T & prob, const std::string & file ) {
        std::ifstream f(file.c_str());
        if (!f) throw std::runtime_error(std::string("Failed to open file '") + file + "'");
        std::string s, t;

        while(std::getline(f, s)){
            t += s + "\n";
        }

        std::ostringstream ds;
        ds << prob;
        ASSERT_EQUALS( t, ds.str() );
        std::ofstream of("ins.txt");
        of<<ds.str();
    }

    void callValidator( Domain * d, Instance * ins, Plan * p ) {
        PlanValidator * pv = PlanValidator::getInstance();
        pv->validate( d, ins, p );
    }

    void elevatorTest() {
        parser::pddl::Domain d( "tests/classical/elevator/dom.pddl");
        parser::pddl::Instance ins( d, "tests/classical/elevator/ins.pddl" );
        ClassicalPlan p( "tests/classical/elevator/plan.1" );
        callValidator( &d, &ins, &p );
    }

    void existsTest() {
        parser::pddl::Domain d( "tests/classical/exists/dom.pddl");
        parser::pddl::Instance ins( d, "tests/classical/exists/ins.pddl" );
        ClassicalPlan p( "tests/classical/exists/plan.1" );
        callValidator( &d, &ins, &p );
    }

    void forallTest1() {
        parser::pddl::Domain d( "tests/classical/forall/dom.pddl");
        parser::pddl::Instance ins( d, "tests/classical/forall/ins.pddl" );
        ClassicalPlan p( "tests/classical/forall/plan.1" );
        callValidator( &d, &ins, &p );
    }

    void forallTest2() {
        parser::pddl::Domain d( "tests/classical/forall/dom.pddl");
        parser::pddl::Instance ins( d, "tests/classical/forall/ins.pddl" );
        ClassicalPlan p( "tests/classical/forall/plan.2" );
        callValidator( &d, &ins, &p );
    }

    void orTest() {
        parser::pddl::Domain d( "tests/classical/or/dom.pddl");
        parser::pddl::Instance ins( d, "tests/classical/or/ins.pddl" );
        ClassicalPlan p( "tests/classical/or/plan.1" );
        callValidator( &d, &ins, &p );
    }

    void whenTest() {
        parser::pddl::Domain d( "tests/classical/when/dom.pddl");
        parser::pddl::Instance ins( d, "tests/classical/when/ins.pddl" );
        ClassicalPlan p( "tests/classical/when/plan.1" );
        callValidator( &d, &ins, &p );
    }

    void citycarTest() {
        parser::pddl::Domain d( "tests/classical/citycar/dom.pddl" );
        parser::pddl::Instance ins( d, "tests/classical/citycar/ins.pddl" );
        ClassicalPlan p( "tests/classical/citycar/plan.1" );
        callValidator( &d, &ins, &p );
    }

    void cellularAutomataTest() {
        parser::pddl::Domain d( "tests/classical/cellular-automata/dom.pddl" );
        parser::pddl::Instance ins( d, "tests/classical/cellular-automata/ins.pddl" );
        ClassicalPlan p( "tests/classical/cellular-automata/plan.1" );
        callValidator( &d, &ins, &p );
    }
};

class PlanningProgramsTests : public TestFixture<PlanningProgramsTests>
{
public:
    TEST_FIXTURE( PlanningProgramsTests )
    {
        TEST_CASE( summatoryTest );
        TEST_CASE( gripperTest );
        TEST_CASE( sortTest );
        TEST_CASE( fibonacciTest );
    }

    template < typename T >
    void checkEqual( T & prob, const std::string & file ) {
        std::ifstream f(file.c_str());
        if (!f) throw std::runtime_error(std::string("Failed to open file '") + file + "'");
        std::string s, t;

        while(std::getline(f, s)){
            t += s + "\n";
        }

        std::ostringstream ds;
        ds << prob;
        ASSERT_EQUALS( t, ds.str() );
        std::ofstream of("ins.txt");
        of<<ds.str();
    }

    void callValidator( Domain * d, Instance * ins, Plan * p ) {
        PlanValidator * pv = PlanValidator::getInstance();
        pv->validate( d, ins, p );
    }

    void summatoryTest() {
        parser::pddl::Domain d( "tests/planning-programs/summatory/dom.pddl");
        parser::pddl::Instance ins( d, "tests/planning-programs/summatory/sumatory21.pddl" );
        PlanningProgram p( "tests/planning-programs/summatory/program.txt" );
        callValidator( &d, &ins, &p );
    }

    void gripperTest() {
        parser::pddl::Domain d( "tests/planning-programs/gripper/dom.pddl");
        parser::pddl::Instance ins( d, "tests/planning-programs/gripper/prob4.pddl" );
        PlanningProgram p( "tests/planning-programs/gripper/program.txt" );
        callValidator( &d, &ins, &p );
    }

    void sortTest() {
        parser::pddl::Domain d( "tests/planning-programs/sorting/dom.pddl");
        parser::pddl::Instance ins( d, "tests/planning-programs/sorting/sort4.pddl" );
        PlanningProgram p( "tests/planning-programs/sorting/program.txt" );
        callValidator( &d, &ins, &p );
    }

    void fibonacciTest() {
        parser::pddl::Domain d( "tests/planning-programs/fibonacci/dom.pddl");
        parser::pddl::Instance ins( d, "tests/planning-programs/fibonacci/fibonacci6.pddl" );
        PlanningProgram p( "tests/planning-programs/fibonacci/program.txt" );
        callValidator( &d, &ins, &p );
    }
};

REGISTER_FIXTURE( ClassicalPlanningTests )
REGISTER_FIXTURE( PlanningProgramsTests )
