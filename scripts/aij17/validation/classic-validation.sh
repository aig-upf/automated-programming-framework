

#./planner.sh domains/pointers/domain.pddl domains/pointers/find/find30.pddl 600 > experiments/aij17/classic-validation/fd-find.out # TE
#./planner.sh domains/pointers/domain.pddl domains/pointers/select/select30.pddl 600 > experiments/aij17/classic-validation/fd-select.out # TE
#./planner.sh domains/pointers/domain.pddl domains/pointers/reverse/reverse30.pddl 60 > experiments/aij17/classic-validation/fd-reverse.out # TE
#./planner.sh domains/variables/domain.pddl domains/variables/sumatory/sumatory120.pddl 10 > experiments/aij17/classic-validation/fd-sumatory.out # TE


./planner.sh domains/other/blocks/domain_cl.pddl domains/other/blocks/prob100.pddl 10 > experiments/aij17/classic-validation/fd-blocks.out
#./planner.sh domains/variables/domain.pddl domains/variables/fibonacci/fibonacci6.pddl 600 > experiments/aij17/classic-validation/fd-fibo.out # TE
./planner.sh domains/other/gripper/domain.pddl domains/other/gripper/prob30.pddl 10 > experiments/aij17/classic-validation/fd-gripper.out
#./planner.sh domains/other/sorting/domain_cl.pddl domains/other/sorting/sort50.pddl 600 > experiments/aij17/classic-validation/fd-sorting.out # TE
./planner.sh domains/other/trees/domain_alt.pddl domains/other/trees/prob20_alt.pddl 10 > experiments/aij17/classic-validation/fd-trees.out
./planner.sh domains/variables-output/domain.pddl domains/variables-output/visitall/visitall30x30.pddl 600 > experiments/aij17/classic-validation/fd-visitall.out
./planner.sh domains/other/visualm/domain.pddl domains/other/visualm/p10x10.pddl 10 > experiments/aij17/classic-validation/fd-visualm.out
./planner.sh domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill01_test_variables.pddl 10 > experiments/aij17/classic-validation/fd-e1.out
./planner.sh domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill02b_test_variables.pddl 10 > experiments/aij17/classic-validation/fd-e2.out
./planner.sh domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill03_alt_test_variables.pddl 10 > experiments/aij17/classic-validation/fd-e3.out
./planner.sh domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill04_alt_test_variables.pddl 10 > experiments/aij17/classic-validation/fd-e4.out
./planner.sh domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill05_alt_test_variables.pddl 10 > experiments/aij17/classic-validation/fd-e5.out

./planner.sh domains/variables-output/domain.pddl domains/variables-output/hallA/hallA100x100.pddl 20 > experiments/aij17/classic-validation/fd-hallA.out


#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/pointers/domain.pddl domains/pointers/find/find30.pddl a > experiments/aij17/classic-validation/brfs-find.out # TE
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/pointers/domain.pddl domains/pointers/select/select30.pddl a > experiments/aij17/classic-validation/brfs-select.out # TE
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/pointers/domain.pddl domains/pointers/reverse/reverse30.pddl a > experiments/aij17/classic-validation/brfs-reverse.out # TE
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables/domain.pddl domains/variables/sumatory/sumatory120.pddl a > experiments/aij17/classic-validation/brfs-sumatory.out


#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables-output/domain.pddl domains/variables-output/hallA/hallA100x100.pddl a > experiments/aij17/classic-validation/brfs-dck-hallA.out # TE
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/blocks/domain_cl.pddl domains/other/blocks/prob100.pddl a > experiments/aij17/classic-validation/brfs-blocks.out
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables/domain.pddl domains/variables/fibonacci/fibonacci6.pddl a > experiments/aij17/classic-validation/brfs-fibo.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/gripper/domain.pddl domains/other/gripper/prob30.pddl a > experiments/aij17/classic-validation/brfs-gripper.out # ME
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/sorting/domain_cl.pddl domains/other/sorting/sort50.pddl a > experiments/aij17/classic-validation/brfs-sorting.out # TE
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/trees/domain_alt.pddl domains/other/trees/prob20_alt.pddl a > experiments/aij17/classic-validation/brfs-trees.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables-output/domain.pddl domains/variables-output/visitall/visitall30x30.pddl a > experiments/aij17/classic-validation/brfs-visitall.out # TE
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/visualm/domain.pddl domains/other/visualm/p10x10.pddl a > experiments/aij17/classic-validation/brfs-visualm.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill01_test_variables.pddl a > experiments/aij17/classic-validation/brfs-e1.out # ME
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill02b_test_variables.pddl a > experiments/aij17/classic-validation/brfs-e2.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill03_alt_test_variables.pddl a > experiments/aij17/classic-validation/brfs-e3.out # ME
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill04_alt_test_variables.pddl a > experiments/aij17/classic-validation/brfs-e4.out # ME
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/excel_variables/domain_variables.pddl domains/other/excel_variables/fill05_alt_test_variables.pddl a > experiments/aij17/classic-validation/brfs-e5.out
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables-output/domain.pddl domains/variables-output/hallA/hallA100x100.pddl out > experiments/aij17/classic-validation/brfs-hallA.out
