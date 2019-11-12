echo 'List synthesis without conds...'
./main_nir config/unconditional/list-ctrl.txt > experiments/unconditional/controllers2/list/output.txt 2> experiments/unconditional/controllers2/list/error.txt
mv program.txt experiments/unconditional/controllers2/list/program.txt
mv 0-* experiments/unconditional/controllers2/list/

echo 'Fibonacci synthesis without conds...'
./main_nir config/unconditional/fibo-ctrl.txt > experiments/unconditional/controllers2/fibo/output.txt 2> experiments/unconditional/controllers2/fibo/error.txt
mv program.txt experiments/unconditional/controllers2/fibo/program.txt
mv 0-* experiments/unconditional/controllers2/fibo/

echo 'Greenblock synthesis without conds...'
./main_nir config/unconditional/greenblock-ctrl.txt > experiments/unconditional/controllers2/greenblock/output.txt 2> experiments/unconditional/controllers2/greenblock/error.txt
mv program.txt experiments/unconditional/controllers2/greenblock/program.txt
mv 0-* experiments/unconditional/controllers2/greenblock/

echo 'Gripper synthesis without conds...'
./main_nir config/unconditional/gripper-ctrl.txt > experiments/unconditional/controllers2/gripper/output.txt 2> experiments/unconditional/controllers2/gripper/error.txt
mv program.txt experiments/unconditional/controllers2/gripper/program.txt
mv 0-* experiments/unconditional/controllers2/gripper/

echo 'Reverse synthesis without conds...'
./main_nir config/unconditional/reverse-ctrl.txt > experiments/unconditional/controllers2/reverse/output.txt 2> experiments/unconditional/controllers2/reverse/error.txt
mv program.txt experiments/unconditional/controllers2/reverse/program.txt
mv 0-* experiments/unconditional/controllers2/reverse/

echo 'Sorting synthesis without conds...'
./main_nir config/unconditional/sorting-ctrl.txt > experiments/unconditional/controllers2/sorting/output.txt 2> experiments/unconditional/controllers2/sorting/error.txt
mv program.txt experiments/unconditional/controllers2/sorting/program.txt
mv 0-* experiments/unconditional/controllers2/sorting/

echo 'Trees synthesis without conds...'
./main_nir config/unconditional/trees-ctrl.txt > experiments/unconditional/controllers2/trees/output.txt 2> experiments/unconditional/controllers2/trees/error.txt
mv program.txt experiments/unconditional/controllers2/trees/program.txt
mv 0-* experiments/unconditional/controllers2/trees/

echo 'Visual-Marker synthesis without conds...'
./main_nir config/unconditional/visualm-ctrl.txt > experiments/unconditional/controllers2/visualm/output.txt 2> experiments/unconditional/controllers2/visualm/error.txt
mv program.txt experiments/unconditional/controllers2/visualm/program.txt
mv 0-* experiments/unconditional/controllers2/visualm/

echo 'Find synthesis without conds...'
./main_nir config/unconditional/find-ctrl.txt > experiments/unconditional/controllers2/find/output.txt 2> experiments/unconditional/controllers2/find/error.txt
mv program.txt experiments/unconditional/controllers2/find/program.txt
mv 0-* experiments/unconditional/controllers2/find/

#echo 'Grid synthesis without conds...' (NOT FOUND BY BFWS)
#./main_nir config/unconditional/grid-ctrl.txt > experiments/unconditional/controllers2/grid/output.txt 2> experiments/unconditional/controllers2/grid/error.txt
#mv program.txt experiments/unconditional/controllers2/grid/program.txt
#mv 0-* experiments/unconditional/controllers2/grid/

#echo 'Hall-A synthesis without conds...' (NOT FOUND BY BFWS)
#./main_nir config/unconditional/hallA-ctrl.txt > experiments/unconditional/controllers2/hallA/output.txt 2> experiments/unconditional/controllers2/hallA/error.txt
#mv program.txt experiments/unconditional/controllers2/hallA/program.txt
#mv 0-* experiments/unconditional/controllers2/hallA/

echo 'Select synthesis without conds...'
./main_nir config/unconditional/select-ctrl.txt > experiments/unconditional/controllers2/select/output.txt 2> experiments/unconditional/controllers2/select/error.txt
mv program.txt experiments/unconditional/controllers2/select/program.txt
mv 0-* experiments/unconditional/controllers2/select/

echo 'Triangular Sum synthesis without conds...'
./main_nir config/unconditional/sumatory-ctrl.txt > experiments/unconditional/controllers2/sumatory/output.txt 2> experiments/unconditional/controllers2/sumatory/error.txt
mv program.txt experiments/unconditional/controllers2/sumatory/program.txt
mv 0-* experiments/unconditional/controllers2/sumatory/

echo 'Visit-All synthesis without conds...' 
./main_nir config/unconditional/visitall-ctrl.txt > experiments/unconditional/controllers2/visitall/output.txt 2> experiments/unconditional/controllers2/visitall/error.txt
mv program.txt experiments/unconditional/controllers2/visitall/program.txt
mv 0-* experiments/unconditional/controllers2/visitall/

