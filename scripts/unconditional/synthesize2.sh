echo 'List synthesis without conds...'
./main_nir config/unconditional/list.txt > experiments/unconditional/synthesis2/list/output.txt 2> experiments/unconditional/synthesis2/list/error.txt
mv program.txt experiments/unconditional/synthesis2/list/program.txt
mv 0-* experiments/unconditional/synthesis2/list/

echo 'Fibonacci synthesis without conds...'
./main_nir config/unconditional/fibo.txt > experiments/unconditional/synthesis2/fibo/output.txt 2> experiments/unconditional/synthesis2/fibo/error.txt
mv program.txt experiments/unconditional/synthesis2/fibo/program.txt
mv 0-* experiments/unconditional/synthesis2/fibo/

echo 'Greenblock synthesis without conds...'
./main_nir config/unconditional/greenblock.txt > experiments/unconditional/synthesis2/greenblock/output.txt 2> experiments/unconditional/synthesis2/greenblock/error.txt
mv program.txt experiments/unconditional/synthesis2/greenblock/program.txt
mv 0-* experiments/unconditional/synthesis2/greenblock/

echo 'Gripper synthesis without conds...'
./main_nir config/unconditional/gripper.txt > experiments/unconditional/synthesis2/gripper/output.txt 2> experiments/unconditional/synthesis2/gripper/error.txt
mv program.txt experiments/unconditional/synthesis2/gripper/program.txt
mv 0-* experiments/unconditional/synthesis2/gripper/

echo 'Reverse synthesis without conds...'
./main_nir config/unconditional/reverse.txt > experiments/unconditional/synthesis2/reverse/output.txt 2> experiments/unconditional/synthesis2/reverse/error.txt
mv program.txt experiments/unconditional/synthesis2/reverse/program.txt
mv 0-* experiments/unconditional/synthesis2/reverse/

echo 'Sorting synthesis without conds...'
./main_nir config/unconditional/sorting.txt  > experiments/unconditional/synthesis2/sorting/output.txt 2> experiments/unconditional/synthesis2/sorting/error.txt
mv program.txt experiments/unconditional/synthesis2/sorting/program.txt
mv 0-* experiments/unconditional/synthesis2/sorting/

echo 'Trees synthesis without conds...'
./main_nir config/unconditional/trees.txt > experiments/unconditional/synthesis2/trees/output.txt 2> experiments/unconditional/synthesis2/trees/error.txt
mv program.txt experiments/unconditional/synthesis2/trees/program.txt
mv 0-* experiments/unconditional/synthesis2/trees/

echo 'Visual-Marker synthesis without conds...'
./main_nir config/unconditional/visualm.txt > experiments/unconditional/synthesis2/visualm/output.txt 2> experiments/unconditional/synthesis2/visualm/error.txt
mv program.txt experiments/unconditional/synthesis2/visualm/program.txt
mv 0-* experiments/unconditional/synthesis2/visualm/

echo 'Find synthesis without conds...'
./main_nir config/unconditional/find.txt > experiments/unconditional/synthesis2/find/output.txt 2> experiments/unconditional/synthesis2/find/error.txt
mv program.txt experiments/unconditional/synthesis2/find/program.txt
mv 0-* experiments/unconditional/synthesis2/find/

#echo 'Grid synthesis without conds...' (NOT FOUND BY BFWS)
#./main_nir config/unconditional/grid.txt > experiments/unconditional/synthesis2/grid/output.txt 2> experiments/unconditional/synthesis2/grid/error.txt
#mv program.txt experiments/unconditional/synthesis2/grid/program.txt
#mv 0-* experiments/unconditional/synthesis2/grid/

#echo 'Hall-A synthesis without conds...' (NOT FOUND BY BFWS)
#./main_nir config/unconditional/hallA.txt > experiments/unconditional/synthesis2/hallA/output.txt 2> experiments/unconditional/synthesis2/hallA/error.txt
#mv program.txt experiments/unconditional/synthesis2/hallA/program.txt
#mv 0-* experiments/unconditional/synthesis2/hallA/

echo 'Select synthesis without conds...'
./main_nir config/unconditional/select.txt  > experiments/unconditional/synthesis2/select/output.txt 2> experiments/unconditional/synthesis2/select/error.txt
mv program.txt experiments/unconditional/synthesis2/select/program.txt
mv 0-* experiments/unconditional/synthesis2/select/

echo 'Triangular Sum synthesis without conds...'
./main_nir config/unconditional/sumatory.txt > experiments/unconditional/synthesis2/sumatory/output.txt 2> experiments/unconditional/synthesis2/sumatory/error.txt
mv program.txt experiments/unconditional/synthesis2/sumatory/program.txt
mv 0-* experiments/unconditional/synthesis2/sumatory/

echo 'Visit-All synthesis without conds...' 
./main_nir config/unconditional/visitall.txt > experiments/unconditional/synthesis2/visitall/output.txt 2> experiments/unconditional/synthesis2/visitall/error.txt
mv program.txt experiments/unconditional/synthesis2/visitall/program.txt
mv 0-* experiments/unconditional/synthesis2/visitall/

