
#include <fstream>
#include <sstream>

//#include <minicppunit/MiniCppUnit.h>
//#include <parser/Instance.h>
#include "../universal-pddl-parser/parser/Instance.h"
#include "../universal-pddl-parser/minicppunit/MiniCppUnit.h"

//#include <validator/PlanValidator.h>
//#include <validator/Plan.h>
//#include <validator/ClassicalPlan.h>
//#include <validator/planning-programs/PlanningProgram.h>

class PlanningProgramsTests : public TestFixture<PlanningProgramsTests>
{
public:
    TEST_FIXTURE( PlanningProgramsTests )
    {
       TEST_CASE( triangular_sum );
       TEST_CASE( find );
       TEST_CASE( select );
       TEST_CASE( reverse );
       TEST_CASE( trees );
    }
	
	const std::string read_file( const std::string &fname ){
		std::string line;
		std::string fs = "";
		std::ifstream ifs( fname.c_str() );
		while( getline( ifs, line ) ){
			fs += line;
		}
		return fs;
	}

	void triangular_sum(){
		system( "bin/compile PLPR domains/variables/domain.pddl 2 domains/variables/sumatory/sumatory2.pddl domains/variables/sumatory/sumatory3.pddl 3 3 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_ts.pddl 2> tests/tmp/ins_ts.pddl" );
		std::string original_dom = read_file( "tests/planning-programs/ts/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_ts.pddl" );
		std::string original_ins = read_file( "tests/planning-programs/ts/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_ts.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void find(){
		system( "bin/compile PLPR domains/pointers/domain.pddl 3 domains/pointers/find/find3.pddl domains/pointers/find/find4a.pddl domains/pointers/find/find4b.pddl 4 4 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_find.pddl 2> tests/tmp/ins_find.pddl" );
		std::string original_dom = read_file( "tests/planning-programs/find/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_find.pddl" );
		std::string original_ins = read_file( "tests/planning-programs/find/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_find.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void select(){
		system( "bin/compile PLPR domains/pointers/domain.pddl 4 domains/pointers/select/select2.pddl domains/pointers/select/select3.pddl domains/pointers/select/select4.pddl domains/pointers/select/select5.pddl 4 4 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_select.pddl 2> tests/tmp/ins_select.pddl" );
		std::string original_dom = read_file( "tests/planning-programs/select/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_select.pddl" );
		std::string original_ins = read_file( "tests/planning-programs/select/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_select.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void reverse(){
		system( "bin/compile PLPR domains/pointers/domain.pddl 2 domains/pointers/reverse/reverse2.pddl domains/pointers/reverse/reverse4.pddl 4 4 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_reverse.pddl 2> tests/tmp/ins_reverse.pddl" );
		std::string original_dom = read_file( "tests/planning-programs/reverse/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_reverse.pddl" );
		std::string original_ins = read_file( "tests/planning-programs/reverse/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_reverse.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void trees(){
		system( "bin/compile PLPR domains/other/trees/domain_alt.pddl 1 domains/other/trees/prob7_alt.pddl 6 6 0 1 ASSIGNMENT 1 VARIABLE 4 1 0 0 0 0 > tests/tmp/domain_trees.pddl 2> tests/tmp/ins_trees.pddl" );
		std::string original_dom = read_file( "tests/planning-programs/trees/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_trees.pddl" );
		std::string original_ins = read_file( "tests/planning-programs/trees/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_trees.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
};

class HighLevelStateFeaturesTests : public TestFixture<HighLevelStateFeaturesTests>
{
public:
    TEST_FIXTURE( HighLevelStateFeaturesTests )
    {
        TEST_CASE( andTest );
        TEST_CASE( orTest );
        TEST_CASE( xorTest );
        TEST_CASE( listTest );
        TEST_CASE( triangularSumTest );
        TEST_CASE( michalskiTrainsTest );
    }

	const std::string read_file( const std::string &fname ){
		std::string line;
		std::string fs = "";
		std::ifstream ifs( fname.c_str() );
		while( getline( ifs, line ) ){
			fs += line;
		}
		return fs;
	}

	void andTest(){
		system( "bin/compile PLPR domains/generics/generic-andor/domain.pddl 4 domains/generics/generic-andor/and1.pddl domains/generics/generic-andor/and2.pddl domains/generics/generic-andor/and3.pddl domains/generics/generic-andor/and4.pddl 4 4 0 0 0 1 1 1 2 0 0  > tests/tmp/domain_hlsf_and.pddl 2> tests/tmp/ins_hlsf_and.pddl" );
		std::string original_dom = read_file( "tests/hlsf/and/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hlsf_and.pddl" );
		std::string original_ins = read_file( "tests/hlsf/and/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hlsf_and.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void orTest(){
		system( "bin/compile PLPR domains/generics/generic-andor/domain.pddl 4 domains/generics/generic-andor/or1.pddl domains/generics/generic-andor/or2.pddl domains/generics/generic-andor/or3.pddl domains/generics/generic-andor/or4.pddl 4 4 0 0 0 1 1 1 2 0 0  > tests/tmp/domain_hlsf_or.pddl 2> tests/tmp/ins_hlsf_or.pddl" );
		std::string original_dom = read_file( "tests/hlsf/or/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hlsf_or.pddl" );
		std::string original_ins = read_file( "tests/hlsf/or/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hlsf_or.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void xorTest(){
		system( "bin/compile PLPR domains/generics/generic-andor/domain.pddl 4 domains/generics/generic-andor/xor1.pddl domains/generics/generic-andor/xor2.pddl domains/generics/generic-andor/xor3.pddl domains/generics/generic-andor/xor4.pddl 4 4 0 0 0 1 1 2 2 0 0 > tests/tmp/domain_hlsf_xor.pddl 2> tests/tmp/ins_hlsf_xor.pddl" );
		std::string original_dom = read_file( "tests/hlsf/xor/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hlsf_xor.pddl" );
		std::string original_ins = read_file( "tests/hlsf/xor/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hlsf_xor.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void listTest(){
		system( "bin/compile PLPR domains/generics/generic-list/domain.pddl 6 domains/generics/generic-list/list123.pddl domains/generics/generic-list/list132.pddl domains/generics/generic-list/list213.pddl domains/generics/generic-list/list231.pddl domains/generics/generic-list/list312.pddl domains/generics/generic-list/list321.pddl 4 4 0 0 0 1 1 1 2 0 0  > tests/tmp/domain_hlsf_list.pddl 2> tests/tmp/ins_hlsf_list.pddl" );
		std::string original_dom = read_file( "tests/hlsf/list/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hlsf_list.pddl" );
		std::string original_ins = read_file( "tests/hlsf/list/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hlsf_list.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void triangularSumTest(){
		system( "bin/compile PLPR domains/generics/generic-summatory/domain.pddl 2 domains/generics/generic-summatory/summatory2.pddl domains/generics/generic-summatory/summatory3.pddl 3 3 0 0 0 1 1 1 2 0 0 > tests/tmp/domain_hlsf_ts.pddl 2> tests/tmp/ins_hlsf_ts.pddl" );
		std::string original_dom = read_file( "tests/hlsf/ts/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hlsf_ts.pddl" );
		std::string original_ins = read_file( "tests/hlsf/ts/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hlsf_ts.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void michalskiTrainsTest(){
		system( "bin/compile PLPR domains/generics/generic-michalski-trains/domain.pddl 10 domains/generics/generic-michalski-trains/michalski7_alt.pddl domains/generics/generic-michalski-trains/michalski8_alt.pddl domains/generics/generic-michalski-trains/michalski9_alt.pddl domains/generics/generic-michalski-trains/michalski1_alt.pddl domains/generics/generic-michalski-trains/michalski2_alt.pddl domains/generics/generic-michalski-trains/michalski3_alt.pddl domains/generics/generic-michalski-trains/michalski6_alt.pddl domains/generics/generic-michalski-trains/michalski10_alt.pddl domains/generics/generic-michalski-trains/michalski4_alt.pddl domains/generics/generic-michalski-trains/michalski5_alt.pddl 4 4 0 0 0 1 1 1 1 0 0  > tests/tmp/domain_hlsf_trains.pddl 2> tests/tmp/ins_hlsf_trains.pddl" );
		std::string original_dom = read_file( "tests/hlsf/michalski/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hlsf_trains.pddl" );
		std::string original_ins = read_file( "tests/hlsf/michalski/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hlsf_trains.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}

};

class HierarchicalFiniteStateControllersTests : public TestFixture<HierarchicalFiniteStateControllersTests>
{
public:
    TEST_FIXTURE( HierarchicalFiniteStateControllersTests )
    {
        TEST_CASE( anbnTest );
        TEST_CASE( blocksTest );
        TEST_CASE( dfsTest );
        TEST_CASE( fiboTest );
        TEST_CASE( gripperTest );
        TEST_CASE( listTest );
        TEST_CASE( tsTest );
    }

	const std::string read_file( const std::string &fname ){
		std::string line;
		std::string fs = "";
		std::ifstream ifs( fname.c_str() );
		while( getline( ifs, line ) ){
			fs += line;
		}
		return fs;
	}

	void anbnTest(){
		system( "bin/compile HFSC domains/hfsc/anbn/domain.pddl 1 domains/hfsc/anbn/pN4.pddl 2 2 0 0 0 5 1 0 0 0 0 > tests/tmp/domain_hfsc_anbn.pddl 2> tests/tmp/ins_hfsc_anbn.pddl" );
		std::string original_dom = read_file( "tests/hfsc/anbn/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_anbn.pddl" );
		std::string original_ins = read_file( "tests/hfsc/anbn/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_anbn.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void blocksTest(){
		system( "bin/compile HFSC domains/hfsc/blocks/domain_cl.pddl 5 domains/hfsc/blocks/prob2.pddl domains/hfsc/blocks/prob2b.pddl domains/hfsc/blocks/prob2c.pddl domains/hfsc/blocks/prob3.pddl domains/hfsc/blocks/prob3b.pddl 3 3 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_hfsc_blocks.pddl 2> tests/tmp/ins_hfsc_blocks.pddl" );
		std::string original_dom = read_file( "tests/hfsc/blocks/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_blocks.pddl" );
		std::string original_ins = read_file( "tests/hfsc/blocks/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_blocks.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void dfsTest(){
		system( "bin/compile HFSC domains/generics/generic-dfs/domain.pddl 4 domains/generics/generic-dfs/trees5.pddl domains/generics/generic-dfs/trees5b.pddl domains/generics/generic-dfs/trees5c.pddl domains/generics/generic-dfs/trees5d.pddl 3 3 0 1 ASSIGNMENT 1 VARIABLE 4 1 0 0 0 0 > tests/tmp/domain_hfsc_dfs.pddl 2> tests/tmp/ins_hfsc_dfs.pddl" );
		std::string original_dom = read_file( "tests/hfsc/dfs/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_dfs.pddl" );
		std::string original_ins = read_file( "tests/hfsc/dfs/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_dfs.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void fiboTest(){
		system( "bin/compile HFSC domains/hfsc/fibonacci/domain.pddl 2 domains/hfsc/fibonacci/prob3b.pddl domains/hfsc/fibonacci/prob4b.pddl 3 3 0 0 0 2 1 0 0 0 0 > tests/tmp/domain_hfsc_fibo.pddl 2> tests/tmp/ins_hfsc_fibo.pddl" );
		std::string original_dom = read_file( "tests/hfsc/fibo/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_fibo.pddl" );
		std::string original_ins = read_file( "tests/hfsc/fibo/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_fibo.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void gripperTest(){
		system( "bin/compile HFSC domains/hfsc/gripper/domain.pddl 2 domains/hfsc/gripper/prob4.pddl domains/hfsc/gripper/prob2.pddl 3 3 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_hfsc_gripper.pddl 2> tests/tmp/ins_hfsc_gripper.pddl" );
		std::string original_dom = read_file( "tests/hfsc/gripper/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_gripper.pddl" );
		std::string original_ins = read_file( "tests/hfsc/gripper/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_gripper.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void listTest(){
		system( "bin/compile HFSC domains/generics/generic-list/domain.pddl 6 domains/generics/generic-list/list123.pddl domains/generics/generic-list/list132.pddl domains/generics/generic-list/list213.pddl domains/generics/generic-list/list231.pddl domains/generics/generic-list/list312.pddl domains/generics/generic-list/list321.pddl 2 2 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_hfsc_list.pddl 2> tests/tmp/ins_hfsc_list.pddl" );
		std::string original_dom = read_file( "tests/hfsc/list/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_list.pddl" );
		std::string original_ins = read_file( "tests/hfsc/list/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_list.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void tsTest(){
		system( "bin/compile HFSC domains/hfsc/summatory/domain.pddl 4 domains/hfsc/summatory/prob3.pddl domains/hfsc/summatory/prob2.pddl domains/hfsc/summatory/prob1.pddl domains/hfsc/summatory/prob0.pddl 2 2 0 0 0 1 1 0 0 0 0 > tests/tmp/domain_hfsc_ts.pddl 2> tests/tmp/ins_hfsc_ts.pddl" );
		std::string original_dom = read_file( "tests/hfsc/ts/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_hfsc_ts.pddl" );
		std::string original_ins = read_file( "tests/hfsc/ts/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_hfsc_ts.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	
};


class ContextFreeGrammarsTests : public TestFixture<ContextFreeGrammarsTests>
{
public:
    TEST_FIXTURE( ContextFreeGrammarsTests )
    {
        TEST_CASE( anbnTest );
        TEST_CASE( arithmeticsTest );
        TEST_CASE( binarithmeticsTest );
        TEST_CASE( easygrammarTest );
        TEST_CASE( parenthesisTest );
        TEST_CASE( parmultipleTest );
    }

	const std::string read_file( const std::string &fname ){
		std::string line;
		std::string fs = "";
		std::ifstream ifs( fname.c_str() );
		while( getline( ifs, line ) ){
			fs += line;
		}
		return fs;
	}

	void anbnTest(){
		system( "bin/compile CFG domains/cfg/anbn/domain.pddl 1 domains/cfg/anbn/pN4.pddl 5 5 0 0 0 5 1 0 0 0 0 > tests/tmp/domain_cfg_anbn.pddl 2> tests/tmp/ins_cfg_anbn.pddl" );
		std::string original_dom = read_file( "tests/cfg/anbn/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_cfg_anbn.pddl" );
		std::string original_ins = read_file( "tests/cfg/anbn/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_cfg_anbn.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}

	void arithmeticsTest(){
		system( "bin/compile CFG domains/cfg/arithmetics/domain.pddl 10 domains/cfg/arithmetics/v0.pddl domains/cfg/arithmetics/v1.pddl domains/cfg/arithmetics/v2.pddl domains/cfg/arithmetics/v3.pddl domains/cfg/arithmetics/v4.pddl domains/cfg/arithmetics/v5.pddl domains/cfg/arithmetics/v6.pddl domains/cfg/arithmetics/v7.pddl domains/cfg/arithmetics/v8.pddl domains/cfg/arithmetics/v9.pddl 20 20 0 0 0 8 1 0 0 0 0 > tests/tmp/domain_cfg_arithmetics.pddl 2> tests/tmp/ins_cfg_arithmetics.pddl" );
		std::string original_dom = read_file( "tests/cfg/arithmetics/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_cfg_arithmetics.pddl" );
		std::string original_ins = read_file( "tests/cfg/arithmetics/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_cfg_arithmetics.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}

	void binarithmeticsTest(){
		system( "bin/compile CFG domains/cfg/arithmetics/domain_binary.pddl 4 domains/cfg/arithmetics/binary_number_v0.pddl domains/cfg/arithmetics/binary_number_v1.pddl domains/cfg/arithmetics/binary_number_v0s.pddl domains/cfg/arithmetics/binary_number_v1s.pddl 8 6 0 0 0 4 1 0 0 0 0 > tests/tmp/domain_cfg_binarithmetics.pddl 2> tests/tmp/ins_cfg_binarithmetics.pddl" );
		std::string original_dom = read_file( "tests/cfg/binarithmetics/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_cfg_binarithmetics.pddl" );
		std::string original_ins = read_file( "tests/cfg/binarithmetics/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_cfg_binarithmetics.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}

	void easygrammarTest(){
		system( "bin/compile CFG domains/cfg/grammar/domain.pddl 2 domains/cfg/grammar/noun_phrase_2.pddl domains/cfg/grammar/noun_phrase.pddl 6 6 0 0 0 10 1 0 0 0 0 > tests/tmp/domain_cfg_easygrammar.pddl 2> tests/tmp/ins_cfg_easygrammar.pddl" );
		std::string original_dom = read_file( "tests/cfg/easygrammar/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_cfg_easygrammar.pddl" );
		std::string original_ins = read_file( "tests/cfg/easygrammar/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_cfg_easygrammar.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}

	void parenthesisTest(){
		system( "bin/compile CFG domains/cfg/parenthesis/domain.pddl 2 domains/cfg/parenthesis/p4a.pddl domains/cfg/parenthesis/p4b.pddl 5 5 0 0 0 5 1 0 0 0 0 > tests/tmp/domain_cfg_parenthesis.pddl 2> tests/tmp/ins_cfg_parenthesis.pddl" );
		std::string original_dom = read_file( "tests/cfg/parenthesis/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_cfg_parenthesis.pddl" );
		std::string original_ins = read_file( "tests/cfg/parenthesis/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_cfg_parenthesis.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}

	void parmultipleTest(){
		system( "bin/compile CFG domains/cfg/parenthesis/domain_complex.pddl 3 domains/cfg/parenthesis/p8-par.pddl domains/cfg/parenthesis/p8-square-brackets.pddl domains/cfg/parenthesis/p8-curly-brackets.pddl 12 12 0 0 0 5 1 0 0 0 0 > tests/tmp/domain_cfg_parmultiple.pddl 2> tests/tmp/ins_cfg_parmultiple.pddl" );
		std::string original_dom = read_file( "tests/cfg/parmultiple/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_cfg_parmultiple.pddl" );
		std::string original_ins = read_file( "tests/cfg/parmultiple/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_cfg_parmultiple.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	
};

class UnsupervisedTests : public TestFixture<UnsupervisedTests>
{
public:
    TEST_FIXTURE( UnsupervisedTests )
    {
        TEST_CASE( andorTest );
        TEST_CASE( assignTest );
        TEST_CASE( gridHVTest );
        TEST_CASE( listTest );
        TEST_CASE( nornandTest );
    }

	const std::string read_file( const std::string &fname ){
		std::string line;
		std::string fs = "";
		std::ifstream ifs( fname.c_str() );
		while( getline( ifs, line ) ){
			fs += line;
		}
		return fs;
	}

	void andorTest(){
		system( "bin/compile PLPR domains/unsupervised/generic-andor/domain.pddl 8 domains/unsupervised/generic-andor/x1x2-00.pddl domains/unsupervised/generic-andor/x1x2-01.pddl domains/unsupervised/generic-andor/x1x2-10.pddl domains/unsupervised/generic-andor/x1x2-11.pddl domains/unsupervised/generic-andor/x2x1-00.pddl domains/unsupervised/generic-andor/x2x1-01.pddl domains/unsupervised/generic-andor/x2x1-10.pddl domains/unsupervised/generic-andor/x2x1-11.pddl 6 6 0 0 0 1 1 0 0 2 10 > tests/tmp/domain_unsupervised_andor.pddl 2> tests/tmp/ins_unsupervised_andor.pddl" );
		std::string original_dom = read_file( "tests/unsupervised/andor/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_unsupervised_andor.pddl" );
		std::string original_ins = read_file( "tests/unsupervised/andor/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_unsupervised_andor.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void assignTest(){
		system( "bin/compile PLPR domains/unsupervised/generic-andor/domain.pddl 8 domains/unsupervised/generic-andor/x1x2-00.pddl domains/unsupervised/generic-andor/x1x2-01.pddl domains/unsupervised/generic-andor/x1x2-10.pddl domains/unsupervised/generic-andor/x1x2-11.pddl domains/unsupervised/generic-andor/x2x1-00.pddl domains/unsupervised/generic-andor/x2x1-01.pddl domains/unsupervised/generic-andor/x2x1-10.pddl domains/unsupervised/generic-andor/x2x1-11.pddl 6 6 0 0 0 1 1 0 0 2 0 > tests/tmp/domain_unsupervised_assign.pddl 2> tests/tmp/ins_unsupervised_assign.pddl" );
		std::string original_dom = read_file( "tests/unsupervised/assign/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_unsupervised_assign.pddl" );
		std::string original_ins = read_file( "tests/unsupervised/assign/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_unsupervised_assign.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void gridHVTest(){
		system( "bin/compile PLPR domains/unsupervised/grid/domain.pddl 4 domains/unsupervised/grid/prob1x5a.pddl domains/unsupervised/grid/prob1x5b.pddl domains/unsupervised/grid/prob5x1a.pddl domains/unsupervised/grid/prob5x1b.pddl 12 12 0 0 0 1 1 0 0 4 0 > tests/tmp/domain_unsupervised_gridHV.pddl 2> tests/tmp/ins_unsupervised_gridHV.pddl" );
		std::string original_dom = read_file( "tests/unsupervised/gridHV/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_unsupervised_gridHV.pddl" );
		std::string original_ins = read_file( "tests/unsupervised/gridHV/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_unsupervised_gridHV.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void listTest(){
		system( "bin/compile PLPR domains/unsupervised/list/domain.pddl 4 domains/unsupervised/list/p1-4a.pddl domains/unsupervised/list/p1-4b.pddl domains/unsupervised/list/p1-6a.pddl domains/unsupervised/list/p1-6b.pddl 10 10 0 0 0 1 1 0 0 2 0 > tests/tmp/domain_unsupervised_list.pddl 2> tests/tmp/ins_unsupervised_list.pddl" );
		std::string original_dom = read_file( "tests/unsupervised/list/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_unsupervised_list.pddl" );
		std::string original_ins = read_file( "tests/unsupervised/list/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_unsupervised_list.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
	void nornandTest(){
		system( "bin/compile PLPR domains/unsupervised/generic-andor/domain.pddl 8 domains/unsupervised/generic-andor/nor-00.pddl domains/unsupervised/generic-andor/nor-01.pddl domains/unsupervised/generic-andor/nor-10.pddl domains/unsupervised/generic-andor/nor-11.pddl domains/unsupervised/generic-andor/nand-00.pddl domains/unsupervised/generic-andor/nand-01.pddl domains/unsupervised/generic-andor/nand-10.pddl domains/unsupervised/generic-andor/nand-11.pddl 6 6 0 0 0 1 1 0 0 2 0 > tests/tmp/domain_unsupervised_nornand.pddl 2> tests/tmp/ins_unsupervised_nornand.pddl" );
		std::string original_dom = read_file( "tests/unsupervised/nornand/domain.pddl" );
		std::string current_dom = read_file( "tests/tmp/domain_unsupervised_nornand.pddl" );
		std::string original_ins = read_file( "tests/unsupervised/nornand/ins.pddl" );
		std::string current_ins = read_file( "tests/tmp/ins_unsupervised_nornand.pddl" );
		ASSERT_EQUALS( original_dom, current_dom );
		ASSERT_EQUALS( original_ins, current_ins );
	}
};


REGISTER_FIXTURE( PlanningProgramsTests )
REGISTER_FIXTURE( HighLevelStateFeaturesTests )
REGISTER_FIXTURE( HierarchicalFiniteStateControllersTests )
REGISTER_FIXTURE( ContextFreeGrammarsTests )
REGISTER_FIXTURE( UnsupervisedTests )

