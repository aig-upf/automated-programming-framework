echo 'List synthesis without conds...'
./main_nir config/unconditional/list-val.txt > experiments/unconditional/validation2/list/output.txt 2> experiments/unconditional/validation2/list/error.txt
mv execution.txt experiments/unconditional/validation2/list/

echo 'Fibonacci synthesis without conds...'
./main_nir config/unconditional/fibo-val.txt > experiments/unconditional/validation2/fibo/output.txt 2> experiments/unconditional/validation2/fibo/error.txt
mv execution.txt  experiments/unconditional/validation2/fibo/

echo 'Greenblock synthesis without conds...'
./main_nir config/unconditional/greenblock-val.txt > experiments/unconditional/validation2/greenblock/output.txt 2> experiments/unconditional/validation2/greenblock/error.txt
mv execution.txt  experiments/unconditional/validation2/greenblock/

echo 'Gripper synthesis without conds...'
./main_nir config/unconditional/gripper-val.txt > experiments/unconditional/validation2/gripper/output.txt 2> experiments/unconditional/validation2/gripper/error.txt
mv execution.txt  experiments/unconditional/validation2/gripper/

echo 'Reverse synthesis without conds...'
./main_nir config/unconditional/reverse-val.txt > experiments/unconditional/validation2/reverse/output.txt 2> experiments/unconditional/validation2/reverse/error.txt
mv execution.txt  experiments/unconditional/validation2/reverse/

echo 'Sorting synthesis without conds...'
./main_nir config/unconditional/sorting-val.txt  > experiments/unconditional/validation2/sorting/output.txt 2> experiments/unconditional/validation2/sorting/error.txt
mv execution.txt  experiments/unconditional/validation2/sorting/

echo 'Trees synthesis without conds...'
./main_nir config/unconditional/trees-val.txt > experiments/unconditional/validation2/trees/output.txt 2> experiments/unconditional/validation2/trees/error.txt
mv execution.txt  experiments/unconditional/validation2/trees/

echo 'Visual-Marker synthesis without conds...'
./main_nir config/unconditional/visualm-val.txt > experiments/unconditional/validation2/visualm/output.txt 2> experiments/unconditional/validation2/visualm/error.txt
mv execution.txt  experiments/unconditional/validation2/visualm/

echo 'Find synthesis without conds...'
./main_nir config/unconditional/find-val.txt > experiments/unconditional/validation2/find/output.txt 2> experiments/unconditional/validation2/find/error.txt
mv execution.txt  experiments/unconditional/validation2/find/

# PROGRAM NOT FOUND
#echo 'Grid synthesis without conds...'
#./main_nir config/unconditional/grid-val.txt > experiments/unconditional/validation2/grid/output.txt 2> experiments/unconditional/validation2/grid/error.txt
#mv execution.txt  experiments/unconditional/validation2/grid/

# PROGRAM NOT FOUND
#echo 'Hall-A synthesis without conds...'
#./main_nir config/unconditional/hallA-val.txt > experiments/unconditional/validation2/hallA/output.txt 2> experiments/unconditional/validation2/hallA/error.txt
#mv execution.txt  experiments/unconditional/validation2/hallA/

echo 'Select synthesis without conds...'
./main_nir config/unconditional/select-val.txt  > experiments/unconditional/validation2/select/output.txt 2> experiments/unconditional/validation2/select/error.txt
mv execution.txt  experiments/unconditional/validation2/select/

echo 'Triangular Sum synthesis without conds...'
./main_nir config/unconditional/sumatory-val.txt > experiments/unconditional/validation2/sumatory/output.txt 2> experiments/unconditional/validation2/sumatory/error.txt
mv execution.txt  experiments/unconditional/validation2/sumatory/

# Validating visit-all with BFWS kills the memory
#echo 'Visit-All synthesis without conds...'
#./main_nir config/unconditional/visitall-val.txt > experiments/unconditional/validation2/visitall/output.txt 2> experiments/unconditional/validation2/visitall/error.txt
#mv execution.txt  experiments/unconditional/validation2/visitall/



