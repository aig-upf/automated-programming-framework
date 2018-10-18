
./planner.sh domains/variables-output/domain_dck.pddl domains/variables-output/hallA/hallA100x100.pddl 10 > experiments/aij17/classic-validation/fd-dck-hallA.out
./planner.sh domains/variables/domain_dck.pddl domains/variables/fibonacci/fibonacci6.pddl 10 > experiments/aij17/classic-validation/fd-dck-fibo.out
./planner.sh domains/variables-output/domain_dck.pddl domains/variables-output/visitall/visitall30x30.pddl 10 > experiments/aij17/classic-validation/fd-dck-visitall.out
./planner.sh domains/other/blocks/domain_dck.pddl domains/other/blocks/prob100.pddl 10 > experiments/aij17/classic-validation/fd-dck-blocks.out
./planner.sh domains/other/sorting/domain_dck.pddl domains/other/sorting/sort15.pddl 300 > experiments/aij17/classic-validation/fd-dck-sort.out
./planner.sh domains/variables/domain_dck.pddl domains/variables/sumatory/sumatory120.pddl  10 > experiments/aij17/classic-validation/fd-dck-sum.out
./planner.sh domains/other/visualm/domain_dck.pddl domains/other/visualm/p10x10.pddl 10 > experiments/aij17/classic-validation/fd-dck-visualm.out 
./planner.sh domains/dck/blocksworld/domain.pddl domains/dck/blocksworld/p100b.pddl 400 > experiments/aij17/classic-validation/fd-dck-blocksworld.out


#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables-output/domain_dck.pddl domains/variables-output/hallA/hallA100x100.pddl out > experiments/aij17/classic-validation/brfs-dck-hallA.out # TE
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables/domain_dck.pddl domains/variables/fibonacci/fibonacci6.pddl out > experiments/aij17/classic-validation/brfs-dck-fibo.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables-output/domain_dck.pddl domains/variables-output/visitall/visitall30x30.pddl out > experiments/aij17/classic-validation/brfs-dck-visitall.out # ME
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/blocks/domain_dck.pddl domains/other/blocks/prob100.pddl out > experiments/aij17/classic-validation/brfs-dck-blocks.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/sorting/domain_dck.pddl domains/other/sorting/sort15.pddl out > experiments/aij17/classic-validation/brfs-dck-sort.out # TE
time python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/variables/domain_dck.pddl domains/variables/sumatory/sumatory120.pddl  out > experiments/aij17/classic-validation/brfs-dck-sum.out
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/other/visualm/domain_dck.pddl domains/other/visualm/p10x10.pddl out > experiments/aij17/classic-validation/brfs-dck-visualm.out # NSF
#python  ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py domains/dck/blocksworld/domain.pddl domains/dck/blocksworld/p100b.pddl out > experiments/aij17/classic-validation/brfs-dck-blocksworld.out # ME
