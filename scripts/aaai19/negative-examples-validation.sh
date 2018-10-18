echo 'VALIDATION PHASE'


echo 'Validating Triangular Sum - sumatory2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory2.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory2.out 2> experiments/neg/validation/triangularsum-lite/sumatory2.err
echo 'Validating Triangular Sum - sumatory3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory3.out 2> experiments/neg/validation/triangularsum-lite/sumatory3.err
echo 'Validating Triangular Sum - sumatory10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory10.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory10.out 2> experiments/neg/validation/triangularsum-lite/sumatory10.err
echo 'Validating Triangular Sum - sumatory15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory15.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory15.out 2> experiments/neg/validation/triangularsum-lite/sumatory15.err
echo 'Validating Triangular Sum - sumatory21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory21.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory21.out 2> experiments/neg/validation/triangularsum-lite/sumatory21.err
echo 'Validating Triangular Sum - sumatory28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory28.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory28.out 2> experiments/neg/validation/triangularsum-lite/sumatory28.err
echo 'Validating Triangular Sum - sumatory36...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory36.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory36.out 2> experiments/neg/validation/triangularsum-lite/sumatory36.err
echo 'Validating Triangular Sum - sumatory55...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory55.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory55.out 2> experiments/neg/validation/triangularsum-lite/sumatory55.err
echo 'Validating Triangular Sum - sumatory120...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory120.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory120.out 2> experiments/neg/validation/triangularsum-lite/sumatory120.err
echo 'Validating Triangular Sum - sumatory1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory1-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory1-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory1-neg.err
echo 'Validating Triangular Sum - sumatory2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory2-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory2-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory2-neg.err
echo 'Validating Triangular Sum - infinite2neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/infinite2neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt
echo 'Validating Triangular Sum - sumatory3neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory3neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory3neg.err
echo 'Validating Triangular Sum - sumatory3neg2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3neg2.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory3neg2.out 2> experiments/neg/validation/triangularsum-lite/sumatory3neg2.err
echo 'Validating Triangular Sum - sumatory3neg3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3neg3.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory3neg3.out 2> experiments/neg/validation/triangularsum-lite/sumatory3neg3.err
echo 'Validating Triangular Sum - infinite3neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/infinite3neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/infinite3neg.out 2> experiments/neg/validation/triangularsum-lite/infinite3neg.err
echo 'Validating Triangular Sum - sumatory10-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory10-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory10-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory10-neg.err
echo 'Validating Triangular Sum - sumatory15-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory15-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory15-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory15-neg.err
echo 'Validating Triangular Sum - sumatory21-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory21-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory21-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory21-neg.err
echo 'Validating Triangular Sum - sumatory28-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory28-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory28-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory28-neg.err
echo 'Validating Triangular Sum - sumatory36-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory36-neg.pddl experiments/neg/synthesis/triangularsum-lite/program.txt > experiments/neg/validation/triangularsum-lite/sumatory36-neg.out 2> experiments/neg/validation/triangularsum-lite/sumatory36-neg.err


echo 'Validating List - p1-3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-3.out 2> experiments/neg/validation/list-lite/p1-3.err
echo 'Validating List - p1-3-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3-neg.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-3-neg.out 2> experiments/neg/validation/list-lite/p1-3-neg.err
echo 'Validating List - p1-1a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-1a.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-1a.out 2> experiments/neg/validation/list-lite/p1-1a.err
echo 'Validating List - p1-1b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-1b.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-1b.out 2> experiments/neg/validation/list-lite/p1-1b.err
echo 'Validating List - p1-2a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-2a.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-2a.out 2> experiments/neg/validation/list-lite/p1-2a.err
echo 'Validating List - p1-2b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-2b.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-2b.out 2> experiments/neg/validation/list-lite/p1-2b.err
echo 'Validating List - p1-3a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3a.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-3a.out 2> experiments/neg/validation/list-lite/p1-3a.err
echo 'Validating List - p1-3b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3b.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-3b.out 2> experiments/neg/validation/list-lite/p1-3b.err
echo 'Validating List - p1-4a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-4a.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-4a.out 2> experiments/neg/validation/list-lite/p1-4a.err
echo 'Validating List - p1-4b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-4b.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-4b.out 2> experiments/neg/validation/list-lite/p1-4b.err
echo 'Validating List - p1-5a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-5a.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-5a.out 2> experiments/neg/validation/list-lite/p1-5a.err
echo 'Validating List - p1-5b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-5b.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-5b.out 2> experiments/neg/validation/list-lite/p1-5b.err
echo 'Validating List - p1-6a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-6a.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-6a.out 2> experiments/neg/validation/list-lite/p1-6a.err
echo 'Validating List - p1-6b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-6b.pddl experiments/neg/synthesis/list-lite/program.txt  > experiments/neg/validation/list-lite/p1-6b.out 2> experiments/neg/validation/list-lite/p1-6b.err


echo 'Validating Gripper - prob1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob1.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob1.out 2> experiments/neg/validation/gripper-lite/prob1.err
echo 'Validating Gripper - prob2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob2.out 2> experiments/neg/validation/gripper-lite/prob2.err
echo 'Validating Gripper - prob1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob1-neg.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob1-neg.out 2> experiments/neg/validation/gripper-lite/prob1-neg.err
echo 'Validating Gripper - prob2-1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-1-neg.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob2-1-neg.out 2> experiments/neg/validation/gripper-lite/prob2-1-neg.err
echo 'Validating Gripper - prob2-2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-2-neg.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob2-2-neg.out 2> experiments/neg/validation/gripper-lite/prob2-2-neg.err
echo 'Validating Gripper - prob2-3-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-3-neg.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob2-3-neg.out 2> experiments/neg/validation/gripper-lite/prob2-3-neg.err
echo 'Validating Gripper - prob2-4-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-4-neg.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob2-4-neg.out 2> experiments/neg/validation/gripper-lite/prob2-4-neg.err
echo 'Validating Gripper - prob4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob4.out 2> experiments/neg/validation/gripper-lite/prob4.err
echo 'Validating Gripper - prob4-pos2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-pos2.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob4-pos2.out 2> experiments/neg/validation/gripper-lite/prob4-pos2.err
echo 'Validating Gripper - prob4-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-neg.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob4-neg.out 2> experiments/neg/validation/gripper-lite/prob4-neg.err
echo 'Validating Gripper - prob4-neg2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-neg2.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob4-neg2.out 2> experiments/neg/validation/gripper-lite/prob4-neg2.err
echo 'Validating Gripper - prob4-neg3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-neg3.pddl experiments/neg/synthesis/gripper-lite/program.txt > experiments/neg/validation/gripper-lite/prob4-neg3.out 2> experiments/neg/validation/gripper-lite/prob4-neg3.err

echo 'Validating Reverse - reverse2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse2.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse2.out 2> experiments/neg/validation/reverse-lite/reverse2.err
echo 'Validating Reverse - reverse2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse2-neg.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse2-neg.out 2> experiments/neg/validation/reverse-lite/reverse2-neg.err
echo 'Validating Reverse - reverse4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse4.out 2> experiments/neg/validation/reverse-lite/reverse4.err
echo 'Validating Reverse - reverse4-neg1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg1.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse4-neg1.out 2> experiments/neg/validation/reverse-lite/reverse4-neg1.err
echo 'Validating Reverse - reverse4-neg2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg2.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse4-neg2.out 2> experiments/neg/validation/reverse-lite/reverse4-neg2.err
echo 'Validating Reverse - reverse4-neg3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg3.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse4-neg3.out 2> experiments/neg/validation/reverse-lite/reverse4-neg3.err
echo 'Validating Reverse - reverse4-neg4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg4.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse4-neg4.out 2> experiments/neg/validation/reverse-lite/reverse4-neg4.err
echo 'Validating Reverse - reverse4-neg5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg5.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse4-neg5.out 2> experiments/neg/validation/reverse-lite/reverse4-neg5.err
echo 'Validating Reverse - reverse6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse6.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse6.out 2> experiments/neg/validation/reverse-lite/reverse6.err
echo 'Validating Reverse - reverse8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse8.pddl experiments/neg/synthesis/reverse-lite/program.txt > experiments/neg/validation/reverse-lite/reverse8.out 2> experiments/neg/validation/reverse-lite/reverse8.err

echo 'Validating Fibonacci - fibonacci1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci1.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci1.out 2> experiments/neg/validation/fibo-lite/fibonacci1.err
echo 'Validating Fibonacci - fibonacci2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci2.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci2.out 2> experiments/neg/validation/fibo-lite/fibonacci2.err
echo 'Validating Fibonacci - fibonacci3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci3.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci3.out 2> experiments/neg/validation/fibo-lite/fibonacci3.err
echo 'Validating Fibonacci - fibonacci4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci4.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci4.out 2> experiments/neg/validation/fibo-lite/fibonacci4.err
echo 'Validating Fibonacci - fibonacci5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci5.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci5.out 2> experiments/neg/validation/fibo-lite/fibonacci5.err
echo 'Validating Fibonacci - fibonacci6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci6.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci6.out 2> experiments/neg/validation/fibo-lite/fibonacci6.err
echo 'Validating Fibonacci - fibonacci1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci1-neg.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci1-neg.out 2> experiments/neg/validation/fibo-lite/fibonacci1-neg.err
echo 'Validating Fibonacci - fibonacci2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci2-neg.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci2-neg.out 2> experiments/neg/validation/fibo-lite/fibonacci2-neg.err
echo 'Validating Fibonacci - fibonacci3-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci3-neg.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci3-neg.out 2> experiments/neg/validation/fibo-lite/fibonacci3-neg.err
echo 'Validating Fibonacci - fibonacci4-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci4-neg.pddl experiments/neg/synthesis/fibo-lite/program.txt > experiments/neg/validation/fibo-lite/fibonacci4-neg.out 2> experiments/neg/validation/fibo-lite/fibonacci4-neg.err


echo 'Validating AB-regex-Q p0...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p0.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p0.out 2> experiments/neg/validation/ab-regex-q-lite/p0.err
echo 'Validating AB-regex-Q p1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p1.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p1.out 2> experiments/neg/validation/ab-regex-q-lite/p1.err
echo 'Validating AB-regex-Q p2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p2.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p2.out 2> experiments/neg/validation/ab-regex-q-lite/p2.err
echo 'Validating AB-regex-Q p3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p3.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p3.out 2> experiments/neg/validation/ab-regex-q-lite/p3.err
echo 'Validating AB-regex-Q p4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p4.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p4.out 2> experiments/neg/validation/ab-regex-q-lite/p4.err
echo 'Validating AB-regex-Q p5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p5.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p5.out 2> experiments/neg/validation/ab-regex-q-lite/p5.err
echo 'Validating AB-regex-Q p6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p6.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p6.out 2> experiments/neg/validation/ab-regex-q-lite/p6.err
echo 'Validating AB-regex-Q p7...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p7.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p7.out 2> experiments/neg/validation/ab-regex-q-lite/p7.err
echo 'Validating AB-regex-Q p8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p8.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p8.out 2> experiments/neg/validation/ab-regex-q-lite/p8.err
echo 'Validating AB-regex-Q p9...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p9.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p9.out 2> experiments/neg/validation/ab-regex-q-lite/p9.err
echo 'Validating AB-regex-Q p10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p10.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p10.out 2> experiments/neg/validation/ab-regex-q-lite/p10.err
echo 'Validating AB-regex-Q p11...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p11.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p11.out 2> experiments/neg/validation/ab-regex-q-lite/p11.err
echo 'Validating AB-regex-Q p12...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p12.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p12.out 2> experiments/neg/validation/ab-regex-q-lite/p12.err
echo 'Validating AB-regex-Q p13...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p13.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p13.out 2> experiments/neg/validation/ab-regex-q-lite/p13.err
echo 'Validating AB-regex-Q p14...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p14.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p14.out 2> experiments/neg/validation/ab-regex-q-lite/p14.err
echo 'Validating AB-regex-Q p15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p15.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p15.out 2> experiments/neg/validation/ab-regex-q-lite/p15.err
echo 'Validating AB-regex-Q p16...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p16.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p16.out 2> experiments/neg/validation/ab-regex-q-lite/p16.err
echo 'Validating AB-regex-Q p17...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p17.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p17.out 2> experiments/neg/validation/ab-regex-q-lite/p17.err
echo 'Validating AB-regex-Q p18...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p18.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p18.out 2> experiments/neg/validation/ab-regex-q-lite/p18.err
echo 'Validating AB-regex-Q p19...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p19.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p19.out 2> experiments/neg/validation/ab-regex-q-lite/p19.err
echo 'Validating AB-regex-Q p20...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p20.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p20.out 2> experiments/neg/validation/ab-regex-q-lite/p20.err
echo 'Validating AB-regex-Q p21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p21.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p21.out 2> experiments/neg/validation/ab-regex-q-lite/p21.err
echo 'Validating AB-regex-Q p22...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p22.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p22.out 2> experiments/neg/validation/ab-regex-q-lite/p22.err
echo 'Validating AB-regex-Q p23...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p23.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p23.out 2> experiments/neg/validation/ab-regex-q-lite/p23.err
echo 'Validating AB-regex-Q p24...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p24.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p24.out 2> experiments/neg/validation/ab-regex-q-lite/p24.err
echo 'Validating AB-regex-Q p25...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p25.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p25.out 2> experiments/neg/validation/ab-regex-q-lite/p25.err
echo 'Validating AB-regex-Q p26...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p26.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p26.out 2> experiments/neg/validation/ab-regex-q-lite/p26.err
echo 'Validating AB-regex-Q p27...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p27.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p27.out 2> experiments/neg/validation/ab-regex-q-lite/p27.err
echo 'Validating AB-regex-Q p28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p28.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p28.out 2> experiments/neg/validation/ab-regex-q-lite/p28.err
echo 'Validating AB-regex-Q p29...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p29.pddl experiments/neg/synthesis/ab-regex-q-lite/program.txt > experiments/neg/validation/ab-regex-q-lite/p29.out 2> experiments/neg/validation/ab-regex-q-lite/p29.err


echo 'Validating AB-regex-P p0...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p0.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p0.out 2> experiments/neg/validation/ab-regex-p-lite/p0.err
echo 'Validating AB-regex-P p1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p1.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p1.out 2> experiments/neg/validation/ab-regex-p-lite/p1.err
echo 'Validating AB-regex-P p2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p2.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p2.out 2> experiments/neg/validation/ab-regex-p-lite/p2.err
echo 'Validating AB-regex-P p3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p3.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p3.out 2> experiments/neg/validation/ab-regex-p-lite/p3.err
echo 'Validating AB-regex-P p4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p4.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p4.out 2> experiments/neg/validation/ab-regex-p-lite/p4.err
echo 'Validating AB-regex-P p5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p5.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p5.out 2> experiments/neg/validation/ab-regex-p-lite/p5.err
echo 'Validating AB-regex-P p6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p6.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p6.out 2> experiments/neg/validation/ab-regex-p-lite/p6.err
echo 'Validating AB-regex-P p7...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p7.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p7.out 2> experiments/neg/validation/ab-regex-p-lite/p7.err
echo 'Validating AB-regex-P p8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p8.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p8.out 2> experiments/neg/validation/ab-regex-p-lite/p8.err
echo 'Validating AB-regex-P p9...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p9.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p9.out 2> experiments/neg/validation/ab-regex-p-lite/p9.err
echo 'Validating AB-regex-P p10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p10.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p10.out 2> experiments/neg/validation/ab-regex-p-lite/p10.err
echo 'Validating AB-regex-P p11...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p11.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p11.out 2> experiments/neg/validation/ab-regex-p-lite/p11.err
echo 'Validating AB-regex-P p12...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p12.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p12.out 2> experiments/neg/validation/ab-regex-p-lite/p12.err
echo 'Validating AB-regex-P p13...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p13.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p13.out 2> experiments/neg/validation/ab-regex-p-lite/p13.err
echo 'Validating AB-regex-P p14...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p14.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p14.out 2> experiments/neg/validation/ab-regex-p-lite/p14.err
echo 'Validating AB-regex-P p15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p15.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p15.out 2> experiments/neg/validation/ab-regex-p-lite/p15.err
echo 'Validating AB-regex-P p16...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p16.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p16.out 2> experiments/neg/validation/ab-regex-p-lite/p16.err
echo 'Validating AB-regex-P p17...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p17.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p17.out 2> experiments/neg/validation/ab-regex-p-lite/p17.err
echo 'Validating AB-regex-P p18...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p18.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p18.out 2> experiments/neg/validation/ab-regex-p-lite/p18.err
echo 'Validating AB-regex-P p19...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p19.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p19.out 2> experiments/neg/validation/ab-regex-p-lite/p19.err
echo 'Validating AB-regex-P p20...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p20.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p20.out 2> experiments/neg/validation/ab-regex-p-lite/p20.err
echo 'Validating AB-regex-P p21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p21.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p21.out 2> experiments/neg/validation/ab-regex-p-lite/p21.err
echo 'Validating AB-regex-P p22...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p22.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p22.out 2> experiments/neg/validation/ab-regex-p-lite/p22.err
echo 'Validating AB-regex-P p23...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p23.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p23.out 2> experiments/neg/validation/ab-regex-p-lite/p23.err
echo 'Validating AB-regex-P p24...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p24.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p24.out 2> experiments/neg/validation/ab-regex-p-lite/p24.err
echo 'Validating AB-regex-P p25...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p25.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p25.out 2> experiments/neg/validation/ab-regex-p-lite/p25.err
echo 'Validating AB-regex-P p26...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p26.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p26.out 2> experiments/neg/validation/ab-regex-p-lite/p26.err
echo 'Validating AB-regex-P p27...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p27.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p27.out 2> experiments/neg/validation/ab-regex-p-lite/p27.err
echo 'Validating AB-regex-P p28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p28.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p28.out 2> experiments/neg/validation/ab-regex-p-lite/p28.err
echo 'Validating AB-regex-P p29...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p29.pddl experiments/neg/synthesis/ab-regex-p-lite/program.txt > experiments/neg/validation/ab-regex-p-lite/p29.out 2> experiments/neg/validation/ab-regex-p-lite/p29.err


echo 'Validating AB-regex-A p0...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p0.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p0.out 2> experiments/neg/validation/ab-regex-a-lite/p0.err
echo 'Validating AB-regex-A p1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p1.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p1.out 2> experiments/neg/validation/ab-regex-a-lite/p1.err
echo 'Validating AB-regex-A p2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p2.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p2.out 2> experiments/neg/validation/ab-regex-a-lite/p2.err
echo 'Validating AB-regex-A p3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p3.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p3.out 2> experiments/neg/validation/ab-regex-a-lite/p3.err
echo 'Validating AB-regex-A p4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p4.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p4.out 2> experiments/neg/validation/ab-regex-a-lite/p4.err
echo 'Validating AB-regex-A p5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p5.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p5.out 2> experiments/neg/validation/ab-regex-a-lite/p5.err
echo 'Validating AB-regex-A p6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p6.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p6.out 2> experiments/neg/validation/ab-regex-a-lite/p6.err
echo 'Validating AB-regex-A p7...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p7.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p7.out 2> experiments/neg/validation/ab-regex-a-lite/p7.err
echo 'Validating AB-regex-A p8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p8.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p8.out 2> experiments/neg/validation/ab-regex-a-lite/p8.err
echo 'Validating AB-regex-A p9...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p9.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p9.out 2> experiments/neg/validation/ab-regex-a-lite/p9.err
echo 'Validating AB-regex-A p10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p10.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p10.out 2> experiments/neg/validation/ab-regex-a-lite/p10.err
echo 'Validating AB-regex-A p11...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p11.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p11.out 2> experiments/neg/validation/ab-regex-a-lite/p11.err
echo 'Validating AB-regex-A p12...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p12.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p12.out 2> experiments/neg/validation/ab-regex-a-lite/p12.err
echo 'Validating AB-regex-A p13...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p13.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p13.out 2> experiments/neg/validation/ab-regex-a-lite/p13.err
echo 'Validating AB-regex-A p14...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p14.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p14.out 2> experiments/neg/validation/ab-regex-a-lite/p14.err
echo 'Validating AB-regex-A p15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p15.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p15.out 2> experiments/neg/validation/ab-regex-a-lite/p15.err
echo 'Validating AB-regex-A p16...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p16.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p16.out 2> experiments/neg/validation/ab-regex-a-lite/p16.err
echo 'Validating AB-regex-A p17...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p17.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p17.out 2> experiments/neg/validation/ab-regex-a-lite/p17.err
echo 'Validating AB-regex-A p18...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p18.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p18.out 2> experiments/neg/validation/ab-regex-a-lite/p18.err
echo 'Validating AB-regex-A p19...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p19.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p19.out 2> experiments/neg/validation/ab-regex-a-lite/p19.err
echo 'Validating AB-regex-A p20...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p20.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p20.out 2> experiments/neg/validation/ab-regex-a-lite/p20.err
echo 'Validating AB-regex-A p21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p21.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p21.out 2> experiments/neg/validation/ab-regex-a-lite/p21.err
echo 'Validating AB-regex-A p22...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p22.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p22.out 2> experiments/neg/validation/ab-regex-a-lite/p22.err
echo 'Validating AB-regex-A p23...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p23.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p23.out 2> experiments/neg/validation/ab-regex-a-lite/p23.err
echo 'Validating AB-regex-A p24...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p24.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p24.out 2> experiments/neg/validation/ab-regex-a-lite/p24.err
echo 'Validating AB-regex-A p25...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p25.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p25.out 2> experiments/neg/validation/ab-regex-a-lite/p25.err
echo 'Validating AB-regex-A p26...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p26.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p26.out 2> experiments/neg/validation/ab-regex-a-lite/p26.err
echo 'Validating AB-regex-A p27...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p27.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p27.out 2> experiments/neg/validation/ab-regex-a-lite/p27.err
echo 'Validating AB-regex-A p28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p28.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p28.out 2> experiments/neg/validation/ab-regex-a-lite/p28.err
echo 'Validating AB-regex-A p29...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p29.pddl experiments/neg/synthesis/ab-regex-a-lite/program.txt > experiments/neg/validation/ab-regex-a-lite/p29.out 2> experiments/neg/validation/ab-regex-a-lite/p29.err




echo 'VALIDATION POSITIVE PHASE'


echo 'Validating Positive Triangular Sum - sumatory2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory2.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory2-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory2-pos.err
echo 'Validating Positive Triangular Sum - sumatory3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory3-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory3-pos.err
echo 'Validating Positive Triangular Sum - sumatory10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory10.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory10-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory10-pos.err
echo 'Validating Positive Triangular Sum - sumatory15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory15.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory15-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory15-pos.err
echo 'Validating Positive Triangular Sum - sumatory21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory21.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory21-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory21-pos.err
echo 'Validating Positive Triangular Sum - sumatory28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory28.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory28-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory28-pos.err
echo 'Validating Positive Triangular Sum - sumatory36...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory36.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory36-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory36-pos.err
echo 'Validating Positive Triangular Sum - sumatory55...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory55.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory55-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory55-pos.err
echo 'Validating Positive Triangular Sum - sumatory120...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory120.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory120-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory120-pos.err
echo 'Validating Positive Triangular Sum - sumatory1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory1-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory1-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory1-neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory2-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory2-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory2-neg-pos.err
echo 'Validating Positive Triangular Sum - infinite2neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/infinite2neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt
echo 'Validating Positive Triangular Sum - sumatory3neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory3neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory3neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory3neg2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3neg2.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory3neg2-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory3neg2-pos.err
echo 'Validating Positive Triangular Sum - sumatory3neg3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory3neg3.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory3neg3-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory3neg3-pos.err
echo 'Validating Positive Triangular Sum - infinite3neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/infinite3neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/infinite3neg-pos.out 2> experiments/neg/validation/triangularsum-lite/infinite3neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory10-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory10-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory10-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory10-neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory15-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory15-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory15-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory15-neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory21-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory21-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory21-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory21-neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory28-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory28-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory28-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory28-neg-pos.err
echo 'Validating Positive Triangular Sum - sumatory36-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/sumatory/sumatory36-neg.pddl experiments/neg/synthesis/triangularsum-lite/program-positive.txt > experiments/neg/validation/triangularsum-lite/sumatory36-neg-pos.out 2> experiments/neg/validation/triangularsum-lite/sumatory36-neg-pos.err


echo 'Validating Positive List - p1-3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-3-pos.out 2> experiments/neg/validation/list-lite/p1-3-pos.err
echo 'Validating Positive List - p1-3-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3-neg.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-3-neg-pos.out 2> experiments/neg/validation/list-lite/p1-3-neg-pos.err
echo 'Validating Positive List - p1-1a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-1a.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-1a-pos.out 2> experiments/neg/validation/list-lite/p1-1a-pos.err
echo 'Validating Positive List - p1-1b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-1b.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-1b-pos.out 2> experiments/neg/validation/list-lite/p1-1b-pos.err
echo 'Validating Positive List - p1-2a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-2a.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-2a-pos.out 2> experiments/neg/validation/list-lite/p1-2a-pos.err
echo 'Validating Positive List - p1-2b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-2b.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-2b-pos.out 2> experiments/neg/validation/list-lite/p1-2b-pos.err
echo 'Validating Positive List - p1-3a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3a.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-3a-pos.out 2> experiments/neg/validation/list-lite/p1-3a-pos.err
echo 'Validating Positive List - p1-3b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-3b.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-3b-pos.out 2> experiments/neg/validation/list-lite/p1-3b-pos.err
echo 'Validating Positive List - p1-4a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-4a.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-4a-pos.out 2> experiments/neg/validation/list-lite/p1-4a-pos.err
echo 'Validating Positive List - p1-4b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-4b.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-4b-pos.out 2> experiments/neg/validation/list-lite/p1-4b-pos.err
echo 'Validating Positive List - p1-5a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-5a.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-5a-pos.out 2> experiments/neg/validation/list-lite/p1-5a-pos.err
echo 'Validating Positive List - p1-5b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-5b.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-5b-pos.out 2> experiments/neg/validation/list-lite/p1-5b-pos.err
echo 'Validating Positive List - p1-6a...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-6a.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-6a-pos.out 2> experiments/neg/validation/list-lite/p1-6a-pos.err
echo 'Validating Positive List - p1-6b...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/unsupervised/list/domain.pddl domains/unsupervised/list/p1-6b.pddl experiments/neg/synthesis/list-lite/program-positive.txt  > experiments/neg/validation/list-lite/p1-6b-pos.out 2> experiments/neg/validation/list-lite/p1-6b-pos.err


echo 'Validating Positive Gripper - prob1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob1.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob1-pos.out 2> experiments/neg/validation/gripper-lite/prob1-pos.err
echo 'Validating Positive Gripper - prob2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob2-pos.out 2> experiments/neg/validation/gripper-lite/prob2-pos.err
echo 'Validating Positive Gripper - prob1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob1-neg.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob1-neg-pos.out 2> experiments/neg/validation/gripper-lite/prob1-neg-pos.err
echo 'Validating Positive Gripper - prob2-1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-1-neg.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob2-1-neg-pos.out 2> experiments/neg/validation/gripper-lite/prob2-1-neg-pos.err
echo 'Validating Positive Gripper - prob2-2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-2-neg.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob2-2-neg-pos.out 2> experiments/neg/validation/gripper-lite/prob2-2-neg-pos.err
echo 'Validating Positive Gripper - prob2-3-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-3-neg.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob2-3-neg-pos.out 2> experiments/neg/validation/gripper-lite/prob2-3-neg-pos.err
echo 'Validating Positive Gripper - prob2-4-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob2-4-neg.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob2-4-neg-pos.out 2> experiments/neg/validation/gripper-lite/prob2-4-neg-pos.err
echo 'Validating Positive Gripper - prob4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob4-pos.out 2> experiments/neg/validation/gripper-lite/prob4-pos.err
echo 'Validating Positive Gripper - prob4-pos2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-pos2.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob4-pos2-pos.out 2> experiments/neg/validation/gripper-lite/prob4-pos2-pos.err
echo 'Validating Positive Gripper - prob4-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-neg.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob4-neg-pos.out 2> experiments/neg/validation/gripper-lite/prob4-neg-pos.err
echo 'Validating Positive Gripper - prob4-neg2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-neg2.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob4-neg2-pos.out 2> experiments/neg/validation/gripper-lite/prob4-neg2-pos.err
echo 'Validating Positive Gripper - prob4-neg3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/other/gripper/domain.pddl domains/other/gripper/prob4-neg3.pddl experiments/neg/synthesis/gripper-lite/program-positive.txt > experiments/neg/validation/gripper-lite/prob4-neg3-pos.out 2> experiments/neg/validation/gripper-lite/prob4-neg3-pos.err

echo 'Validating Positive Reverse - reverse2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse2.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse2-pos.out 2> experiments/neg/validation/reverse-lite/reverse2-pos.err
echo 'Validating Positive Reverse - reverse2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse2-neg.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse2-neg-pos.out 2> experiments/neg/validation/reverse-lite/reverse2-neg-pos.err
echo 'Validating Positive Reverse - reverse4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse4-pos.out 2> experiments/neg/validation/reverse-lite/reverse4-pos.err
echo 'Validating Positive Reverse - reverse4-neg1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg1.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse4-neg1-pos.out 2> experiments/neg/validation/reverse-lite/reverse4-neg1-pos.err
echo 'Validating Positive Reverse - reverse4-neg2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg2.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse4-neg2-pos.out 2> experiments/neg/validation/reverse-lite/reverse4-neg2-pos.err
echo 'Validating Positive Reverse - reverse4-neg3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg3.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse4-neg3-pos.out 2> experiments/neg/validation/reverse-lite/reverse4-neg3-pos.err
echo 'Validating Positive Reverse - reverse4-neg4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg4.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse4-neg4-pos.out 2> experiments/neg/validation/reverse-lite/reverse4-neg4-pos.err
echo 'Validating Positive Reverse - reverse4-neg5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse4-neg5.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse4-neg5-pos.out 2> experiments/neg/validation/reverse-lite/reverse4-neg5-pos.err
echo 'Validating Positive Reverse - reverse6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse6.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse6-pos.out 2> experiments/neg/validation/reverse-lite/reverse6-pos.err
echo 'Validating Positive Reverse - reverse8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/pointers/domain-neg.pddl domains/pointers/reverse/reverse8.pddl experiments/neg/synthesis/reverse-lite/program-positive.txt > experiments/neg/validation/reverse-lite/reverse8-pos.out 2> experiments/neg/validation/reverse-lite/reverse8-pos.err

echo 'Validating Positive Fibonacci - fibonacci1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci1.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci1-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci1-pos.err
echo 'Validating Positive Fibonacci - fibonacci2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci2.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci2-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci2-pos.err
echo 'Validating Positive Fibonacci - fibonacci3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci3.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci3-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci3-pos.err
echo 'Validating Positive Fibonacci - fibonacci4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci4.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci4-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci4-pos.err
echo 'Validating Positive Fibonacci - fibonacci5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci5.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci5-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci5-pos.err
echo 'Validating Positive Fibonacci - fibonacci6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci6.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci6-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci6-pos.err
echo 'Validating Positive Fibonacci - fibonacci1-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci1-neg.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci1-neg-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci1-neg-pos.err
echo 'Validating Positive Fibonacci - fibonacci2-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci2-neg.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci2-neg-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci2-neg-pos.err
echo 'Validating Positive Fibonacci - fibonacci3-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci3-neg.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci3-neg-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci3-neg-pos.err
echo 'Validating Positive Fibonacci - fibonacci4-neg...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/variables/domain.pddl domains/variables/fibonacci/fibonacci4-neg.pddl experiments/neg/synthesis/fibo-lite/program-positive.txt > experiments/neg/validation/fibo-lite/fibonacci4-neg-pos.out 2> experiments/neg/validation/fibo-lite/fibonacci4-neg-pos.err


echo 'Validating Positive AB-regex-Q p0...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p0.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p0-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p0-pos.err
echo 'Validating Positive AB-regex-Q p1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p1.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p1-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p1-pos.err
echo 'Validating Positive AB-regex-Q p2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p2.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p2-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p2-pos.err
echo 'Validating Positive AB-regex-Q p3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p3.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p3-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p3-pos.err
echo 'Validating Positive AB-regex-Q p4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p4.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p4-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p4-pos.err
echo 'Validating Positive AB-regex-Q p5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p5.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p5-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p5-pos.err
echo 'Validating Positive AB-regex-Q p6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p6.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p6-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p6-pos.err
echo 'Validating Positive AB-regex-Q p7...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p7.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p7-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p7-pos.err
echo 'Validating Positive AB-regex-Q p8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p8.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p8-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p8-pos.err
echo 'Validating Positive AB-regex-Q p9...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p9.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p9-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p9-pos.err
echo 'Validating Positive AB-regex-Q p10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p10.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p10-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p10-pos.err
echo 'Validating Positive AB-regex-Q p11...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p11.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p11-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p11-pos.err
echo 'Validating Positive AB-regex-Q p12...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p12.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p12-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p12-pos.err
echo 'Validating Positive AB-regex-Q p13...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p13.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p13-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p13-pos.err
echo 'Validating Positive AB-regex-Q p14...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p14.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p14-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p14-pos.err
echo 'Validating Positive AB-regex-Q p15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p15.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p15-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p15-pos.err
echo 'Validating Positive AB-regex-Q p16...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p16.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p16-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p16-pos.err
echo 'Validating Positive AB-regex-Q p17...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p17.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p17-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p17-pos.err
echo 'Validating Positive AB-regex-Q p18...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p18.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p18-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p18-pos.err
echo 'Validating Positive AB-regex-Q p19...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p19.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p19-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p19-pos.err
echo 'Validating Positive AB-regex-Q p20...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p20.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p20-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p20-pos.err
echo 'Validating Positive AB-regex-Q p21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p21.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p21-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p21-pos.err
echo 'Validating Positive AB-regex-Q p22...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p22.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p22-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p22-pos.err
echo 'Validating Positive AB-regex-Q p23...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p23.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p23-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p23-pos.err
echo 'Validating Positive AB-regex-Q p24...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p24.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p24-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p24-pos.err
echo 'Validating Positive AB-regex-Q p25...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p25.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p25-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p25-pos.err
echo 'Validating Positive AB-regex-Q p26...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p26.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p26-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p26-pos.err
echo 'Validating Positive AB-regex-Q p27...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p27.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p27-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p27-pos.err
echo 'Validating Positive AB-regex-Q p28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p28.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p28-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p28-pos.err
echo 'Validating Positive AB-regex-Q p29...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p29.pddl experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt > experiments/neg/validation/ab-regex-q-lite/p29-pos.out 2> experiments/neg/validation/ab-regex-q-lite/p29-pos.err


echo 'Validating Positive AB-regex-P p0...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p0.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p0-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p0-pos.err
echo 'Validating Positive AB-regex-P p1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p1.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p1-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p1-pos.err
echo 'Validating Positive AB-regex-P p2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p2.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p2-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p2-pos.err
echo 'Validating Positive AB-regex-P p3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p3.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p3-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p3-pos.err
echo 'Validating Positive AB-regex-P p4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p4.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p4-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p4-pos.err
echo 'Validating Positive AB-regex-P p5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p5.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p5-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p5-pos.err
echo 'Validating Positive AB-regex-P p6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p6.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p6-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p6-pos.err
echo 'Validating Positive AB-regex-P p7...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p7.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p7-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p7-pos.err
echo 'Validating Positive AB-regex-P p8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p8.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p8-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p8-pos.err
echo 'Validating Positive AB-regex-P p9...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p9.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p9-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p9-pos.err
echo 'Validating Positive AB-regex-P p10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p10.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p10-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p10-pos.err
echo 'Validating Positive AB-regex-P p11...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p11.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p11-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p11-pos.err
echo 'Validating Positive AB-regex-P p12...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p12.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p12-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p12-pos.err
echo 'Validating Positive AB-regex-P p13...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p13.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p13-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p13-pos.err
echo 'Validating Positive AB-regex-P p14...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p14.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p14-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p14-pos.err
echo 'Validating Positive AB-regex-P p15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p15.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p15-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p15-pos.err
echo 'Validating Positive AB-regex-P p16...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p16.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p16-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p16-pos.err
echo 'Validating Positive AB-regex-P p17...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p17.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p17-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p17-pos.err
echo 'Validating Positive AB-regex-P p18...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p18.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p18-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p18-pos.err
echo 'Validating Positive AB-regex-P p19...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p19.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p19-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p19-pos.err
echo 'Validating Positive AB-regex-P p20...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p20.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p20-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p20-pos.err
echo 'Validating Positive AB-regex-P p21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p21.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p21-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p21-pos.err
echo 'Validating Positive AB-regex-P p22...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p22.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p22-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p22-pos.err
echo 'Validating Positive AB-regex-P p23...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p23.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p23-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p23-pos.err
echo 'Validating Positive AB-regex-P p24...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p24.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p24-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p24-pos.err
echo 'Validating Positive AB-regex-P p25...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p25.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p25-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p25-pos.err
echo 'Validating Positive AB-regex-P p26...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p26.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p26-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p26-pos.err
echo 'Validating Positive AB-regex-P p27...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p27.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p27-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p27-pos.err
echo 'Validating Positive AB-regex-P p28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p28.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p28-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p28-pos.err
echo 'Validating Positive AB-regex-P p29...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p29.pddl experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt > experiments/neg/validation/ab-regex-p-lite/p29-pos.out 2> experiments/neg/validation/ab-regex-p-lite/p29-pos.err


echo 'Validating Positive AB-regex-A p0...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p0.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p0-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p0-pos.err
echo 'Validating Positive AB-regex-A p1...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p1.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p1-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p1-pos.err
echo 'Validating Positive AB-regex-A p2...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p2.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p2-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p2-pos.err
echo 'Validating Positive AB-regex-A p3...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p3.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p3-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p3-pos.err
echo 'Validating Positive AB-regex-A p4...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p4.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p4-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p4-pos.err
echo 'Validating Positive AB-regex-A p5...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p5.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p5-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p5-pos.err
echo 'Validating Positive AB-regex-A p6...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p6.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p6-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p6-pos.err
echo 'Validating Positive AB-regex-A p7...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p7.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p7-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p7-pos.err
echo 'Validating Positive AB-regex-A p8...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p8.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p8-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p8-pos.err
echo 'Validating Positive AB-regex-A p9...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p9.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p9-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p9-pos.err
echo 'Validating Positive AB-regex-A p10...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p10.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p10-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p10-pos.err
echo 'Validating Positive AB-regex-A p11...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p11.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p11-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p11-pos.err
echo 'Validating Positive AB-regex-A p12...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p12.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p12-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p12-pos.err
echo 'Validating Positive AB-regex-A p13...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p13.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p13-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p13-pos.err
echo 'Validating Positive AB-regex-A p14...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p14.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p14-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p14-pos.err
echo 'Validating Positive AB-regex-A p15...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p15.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p15-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p15-pos.err
echo 'Validating Positive AB-regex-A p16...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p16.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p16-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p16-pos.err
echo 'Validating Positive AB-regex-A p17...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p17.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p17-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p17-pos.err
echo 'Validating Positive AB-regex-A p18...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p18.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p18-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p18-pos.err
echo 'Validating Positive AB-regex-A p19...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p19.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p19-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p19-pos.err
echo 'Validating Positive AB-regex-A p20...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p20.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p20-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p20-pos.err
echo 'Validating Positive AB-regex-A p21...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p21.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p21-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p21-pos.err
echo 'Validating Positive AB-regex-A p22...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p22.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p22-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p22-pos.err
echo 'Validating Positive AB-regex-A p23...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p23.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p23-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p23-pos.err
echo 'Validating Positive AB-regex-A p24...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p24.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p24-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p24-pos.err
echo 'Validating Positive AB-regex-A p25...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p25.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p25-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p25-pos.err
echo 'Validating Positive AB-regex-A p26...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p26.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p26-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p26-pos.err
echo 'Validating Positive AB-regex-A p27...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p27.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p27-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p27-pos.err
echo 'Validating Positive AB-regex-A p28...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p28.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p28-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p28-pos.err
echo 'Validating Positive AB-regex-A p29...'
time ./universal-planning-validator/validator/validate.bin -p -v domains/neg/ab-regex/domain.pddl domains/neg/ab-regex/validation/p29.pddl experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt > experiments/neg/validation/ab-regex-a-lite/p29-pos.out 2> experiments/neg/validation/ab-regex-a-lite/p29-pos.err





