./planner.sh experiments/aij17/validation/hallA/domain.pddl experiments/aij17/validation/hallA/ins.pddl 60 > experiments/aij17/validation/hallA/fd-hallA.out
./planner.sh experiments/aij17/validation/blocks/domain.pddl experiments/aij17/validation/blocks/ins.pddl 60 > experiments/aij17/validation/blocks/fd-blocks.out
./planner.sh experiments/aij17/validation/fibo/domain.pddl experiments/aij17/validation/fibo/ins.pddl 60 > experiments/aij17/validation/fibo/fd-fibo.out
./planner.sh experiments/aij17/validation/find/domain.pddl experiments/aij17/validation/find/ins.pddl 60 > experiments/aij17/validation/find/fd-find.out
./planner.sh experiments/aij17/validation/gripper/domain.pddl experiments/aij17/validation/gripper/ins.pddl 60 > experiments/aij17/validation/gripper/fd-gripper.out
./planner.sh experiments/aij17/validation/reverse/domain.pddl experiments/aij17/validation/reverse/ins.pddl 60 > experiments/aij17/validation/reverse/fd-reverse.out
./planner.sh experiments/aij17/validation/select/domain.pddl experiments/aij17/validation/select/ins.pddl 60 > experiments/aij17/validation/select/fd-select.out
./planner.sh experiments/aij17/validation/sorting/domain.pddl experiments/aij17/validation/sorting/ins.pddl 60 > experiments/aij17/validation/sorting/fd-sorting.out
./planner.sh experiments/aij17/validation/sumatory/domain.pddl experiments/aij17/validation/sumatory/ins.pddl 60 > experiments/aij17/validation/sumatory/fd-sumatory.out
./planner.sh experiments/aij17/validation/trees/domain.pddl experiments/aij17/validation/trees/ins.pddl 60 > experiments/aij17/validation/trees/fd-trees.out
./planner.sh experiments/aij17/validation/visitall/domain.pddl experiments/aij17/validation/visitall/ins.pddl 60 > experiments/aij17/validation/visitall/fd-visitall.out
./planner.sh experiments/aij17/validation/visualm/domain.pddl experiments/aij17/validation/visualm/ins.pddl 60 > experiments/aij17/validation/visualm/fd-visualm.out
./planner.sh experiments/aij17/validation/excel_variables/fill01/domain.pddl experiments/aij17/validation/excel_variables/fill01/ins.pddl 60 > experiments/aij17/validation/excel_variables/fd-e1.out
./planner.sh experiments/aij17/validation/excel_variables/fill02/domain.pddl experiments/aij17/validation/excel_variables/fill02/ins.pddl 60 > experiments/aij17/validation/excel_variables/fd-e2.out
./planner.sh experiments/aij17/validation/excel_variables/fill03/domain.pddl experiments/aij17/validation/excel_variables/fill03/ins.pddl 60 > experiments/aij17/validation/excel_variables/fd-e3.out
./planner.sh experiments/aij17/validation/excel_variables/fill04/domain.pddl experiments/aij17/validation/excel_variables/fill04/ins.pddl 60 > experiments/aij17/validation/excel_variables/fd-e4.out
./planner.sh experiments/aij17/validation/excel_variables/fill05/domain.pddl experiments/aij17/validation/excel_variables/fill05/ins.pddl 60 > experiments/aij17/validation/excel_variables/fd-e5.out



./planner.sh experiments/aij17/validation/blocksworld/domain_dck.pddl experiments/aij17/validation/blocksworld/ins_dck.pddl 60 > experiments/aij17/validation/blocksworld/fd-blocksworld-dck.out
./planner.sh experiments/aij17/validation/blocks/domain_dck.pddl experiments/aij17/validation/blocks/ins_dck.pddl 60 > experiments/aij17/validation/blocks/fd-blocks-dck.out
./planner.sh experiments/aij17/validation/fibo/domain_dck.pddl experiments/aij17/validation/fibo/ins_dck.pddl 60 > experiments/aij17/validation/fibo/fd-fibo-dck.out
./planner.sh experiments/aij17/validation/sorting/domain_dck.pddl experiments/aij17/validation/sorting/ins_dck.pddl 60 > experiments/aij17/validation/sorting/fd-sorting-dck.out
./planner.sh experiments/aij17/validation/sumatory/domain_dck.pddl experiments/aij17/validation/sumatory/ins_dck.pddl 60 > experiments/aij17/validation/sumatory/fd-sumatory-dck.out
./planner.sh experiments/aij17/validation/visitall/domain_dck.pddl experiments/aij17/validation/visitall/ins_dck.pddl 60 > experiments/aij17/validation/visitall/fd-visitall-dck.out
./planner.sh experiments/aij17/validation/visualm/domain_dck.pddl experiments/aij17/validation/visualm/ins_dck.pddl 60 > experiments/aij17/validation/visualm/fd-visualm-dck.out

time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/blocks/domain.pddl experiments/aij17/validation/blocks/ins.pddl out > experiments/aij17/validation/blocks/brfs-blocks.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/fibo/domain.pddl experiments/aij17/validation/fibo/ins.pddl out > experiments/aij17/validation/fibo/brfs-fibo.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/find/domain.pddl experiments/aij17/validation/find/ins.pddl out > experiments/aij17/validation/find/brfs-find.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/gripper/domain.pddl experiments/aij17/validation/gripper/ins.pddl out > experiments/aij17/validation/gripper/brfs-gripper.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/reverse/domain.pddl experiments/aij17/validation/reverse/ins.pddl out > experiments/aij17/validation/reverse/brfs-reverse.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/select/domain.pddl experiments/aij17/validation/select/ins.pddl out > experiments/aij17/validation/select/brfs-select.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/sorting/domain.pddl experiments/aij17/validation/sorting/ins.pddl out > experiments/aij17/validation/sorting/brfs-sorting.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/sumatory/domain.pddl experiments/aij17/validation/sumatory/ins.pddl out > experiments/aij17/validation/sumatory/brfs-sumatory.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/trees/domain.pddl experiments/aij17/validation/trees/ins.pddl out > experiments/aij17/validation/trees/brfs-trees.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/visitall/domain.pddl experiments/aij17/validation/visitall/ins.pddl out > experiments/aij17/validation/visitall/brfs-visitall.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/visualm/domain.pddl experiments/aij17/validation/visualm/ins.pddl out > experiments/aij17/validation/visualm/brfs-visualm.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/excel_variables/fill01/domain.pddl experiments/aij17/validation/excel_variables/fill01/ins.pddl out > experiments/aij17/validation/excel_variables/brfs-e1.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/excel_variables/fill02/domain.pddl experiments/aij17/validation/excel_variables/fill02/ins.pddl out > experiments/aij17/validation/excel_variables/brfs-e2.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/excel_variables/fill03/domain.pddl experiments/aij17/validation/excel_variables/fill03/ins.pddl out > experiments/aij17/validation/excel_variables/brfs-e3.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/excel_variables/fill04/domain.pddl experiments/aij17/validation/excel_variables/fill04/ins.pddl out > experiments/aij17/validation/excel_variables/brfs-e4.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/excel_variables/fill05/domain.pddl experiments/aij17/validation/excel_variables/fill05/ins.pddl out > experiments/aij17/validation/excel_variables/brfs-e5.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/hallA/domain.pddl experiments/aij17/validation/hallA/ins.pddl 60 > experiments/aij17/validation/hallA/brfs-hallA.out


time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/blocksworld/domain_dck.pddl experiments/aij17/validation/blocksworld/ins_dck.pddl out > experiments/aij17/validation/blocksworld/brfs-blocksworld-dck.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/blocks/domain_dck.pddl experiments/aij17/validation/blocks/ins_dck.pddl out > experiments/aij17/validation/blocks/brfs-blocks-dck.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/fibo/domain_dck.pddl experiments/aij17/validation/fibo/ins_dck.pddl out > experiments/aij17/validation/fibo/brfs-fibo-dck.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/sorting/domain_dck.pddl experiments/aij17/validation/sorting/ins_dck.pddl out > experiments/aij17/validation/sorting/brfs-sorting-dck.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/sumatory/domain_dck.pddl experiments/aij17/validation/sumatory/ins_dck.pddl out > experiments/aij17/validation/sumatory/brfs-sumatory-dck.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/visitall/domain_dck.pddl experiments/aij17/validation/visitall/ins_dck.pddl out > experiments/aij17/validation/visitall/brfs-visitall-dck.out
time python ../PhD/PLANNERS/lapkt/planners/brfs/brfs.py experiments/aij17/validation/visualm/domain_dck.pddl experiments/aij17/validation/visualm/ins_dck.pddl out > experiments/aij17/validation/visualm/brfs-visualm-dck.out

