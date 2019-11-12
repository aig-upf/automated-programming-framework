echo 'Fibo...'
./main config/nfa/fibo.txt > experiments/aaai20/fibo/fibo.out 2> experiments/aaai20/fibo/fibo.err
mv *-*.pddl experiments/aaai20/fibo/
mv *.plan experiments/aaai20/fibo/

echo 'Find...'
./main config/nfa/find.txt > experiments/aaai20/find/find.out 2> experiments/aaai20/find/find.err
mv *-*.pddl experiments/aaai20/find/
mv *.plan experiments/aaai20/find/

echo 'Green Block...'
./main config/nfa/gb.txt > experiments/aaai20/gb/gb.out 2> experiments/aaai20/gb/gb.err
mv *-*.pddl experiments/aaai20/gb/
mv *.plan experiments/aaai20/gb/

echo 'Grid...'
./main config/nfa/grid.txt > experiments/aaai20/grid/grid.out 2> experiments/aaai20/grid/grid.err
mv *-*.pddl experiments/aaai20/grid/
mv *.plan experiments/aaai20/grid/

echo 'Gripper...'
./main config/nfa/gripper.txt > experiments/aaai20/gripper/gripper.out 2> experiments/aaai20/gripper/gripper.err
mv *-*.pddl experiments/aaai20/gripper/
mv *.plan experiments/aaai20/gripper/

echo 'Hall-A...'
./main config/nfa/hallA.txt > experiments/aaai20/hallA/hallA.out 2> experiments/aaai20/hallA/hallA.err
mv *-*.pddl experiments/aaai20/hallA/
mv *.plan experiments/aaai20/hallA/

echo 'List...'
./main config/nfa/list.txt > experiments/aaai20/list/list.out 2> experiments/aaai20/list/list.err
mv *-*.pddl experiments/aaai20/list/
mv *.plan experiments/aaai20/list/

#echo 'Regex...'
#./main config/nfa/regex.txt > regex.out 2> regex.err
#mv *-*.pddl experiments/aaai20/regex/
#mv *.plan experiments/aaai20/regex/
#mv regex.out regex.err experiments/aaai20/regex/
echo 'Reverse...'
./main config/nfa/reverse.txt > experiments/aaai20/reverse/reverse.out 2> experiments/aaai20/reverse/reverse.err
mv *-*.pddl experiments/aaai20/reverse/
mv *.plan experiments/aaai20/reverse/

echo 'Select...'
./main config/nfa/select.txt > experiments/aaai20/select/select.out 2> experiments/aaai20/select/select.err
mv *-*.pddl experiments/aaai20/select/
mv *.plan experiments/aaai20/select/

echo 'Sorting...'
./main config/nfa/sorting.txt > experiments/aaai20/sorting/sorting.out 2> experiments/aaai20/sorting/sorting.err
mv *-*.pddl experiments/aaai20/sorting/
mv *.plan experiments/aaai20/sorting/

echo 'Triangular Sum...'
./main config/nfa/ts.txt > experiments/aaai20/ts/ts.out 2> experiments/aaai20/ts/ts.err
mv *-*.pddl experiments/aaai20/ts/
mv *.plan experiments/aaai20/ts/

echo 'Visit-All...'
./main config/nfa/visitall.txt > experiments/aaai20/visitall/visitall.out 2> experiments/aaai20/visitall/visitall.err
mv *-*.pddl experiments/aaai20/visitall/
mv *.plan experiments/aaai20/visitall/

echo 'Visual Marker...'
./main config/nfa/visualm.txt > experiments/aaai20/visualm/visualm.out 2> experiments/aaai20/visualm/visualm.err
mv *-*.pddl experiments/aaai20/visualm/
mv *.plan experiments/aaai20/visualm/

