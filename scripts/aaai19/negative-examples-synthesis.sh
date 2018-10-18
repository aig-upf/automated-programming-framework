echo 'SYNTHESIS PHASE'

echo 'Synthesizing AB-regex-Q Lite...'
./main config/neg/abQ-neg-lite.txt  > experiments/neg/synthesis/ab-regex-q-lite/ab.out 2> experiments/neg/synthesis/ab-regex-q-lite/ab.err
mv 0-* program.txt experiments/neg/synthesis/ab-regex-q-lite/

echo 'Synthesizing AB-regex-Q...'
./main config/neg/abQ-neg.txt  > experiments/neg/synthesis/ab-regex-q/ab.out 2> experiments/neg/synthesis/ab-regex-q/ab.err
mv 0-* program.txt experiments/neg/synthesis/ab-regex-q/

echo 'Synthesizing AB-regex-P Lite...'
./main config/neg/abP-neg-lite.txt  > experiments/neg/synthesis/ab-regex-p-lite/ab.out 2> experiments/neg/synthesis/ab-regex-p-lite/ab.err
mv 0-* program.txt experiments/neg/synthesis/ab-regex-p-lite/

echo 'Synthesizing AB-regex-P...'
./main config/neg/abP-neg.txt  > experiments/neg/synthesis/ab-regex-p/ab.out 2> experiments/neg/synthesis/ab-regex-p/ab.err
mv 0-* program.txt experiments/neg/synthesis/ab-regex-p/

echo 'Synthesizing AB-regex-A Lite...'
./main config/neg/abQ-neg-lite.txt  > experiments/neg/synthesis/ab-regex-a-lite/ab.out 2> experiments/neg/synthesis/ab-regex-a-lite/ab.err
mv 0-* program.txt experiments/neg/synthesis/ab-regex-a-lite/

echo 'Synthesizing AB-regex-A...'
./main config/neg/abQ-neg.txt  > experiments/neg/synthesis/ab-regex-a/ab.out 2> experiments/neg/synthesis/ab-regex-a/ab.err
mv 0-* program.txt experiments/neg/synthesis/ab-regex-a/

echo 'Synthesizing Triangular Sum Lite...'
./main config/neg/sumatory-neg-lite.txt > experiments/neg/synthesis/triangularsum-lite/ts.out 2> experiments/neg/synthesis/triangularsum-lite/ts.err
mv 0-* program.txt experiments/neg/synthesis/triangularsum-lite/

echo 'Synthesizing Triangular Sum...'
./main config/neg/sumatory-neg.txt > experiments/neg/synthesis/triangularsum/ts.out 2> experiments/neg/synthesis/triangularsum/ts.err
mv 0-* program.txt experiments/neg/synthesis/triangularsum/

echo 'Synthesizing List Lite...'
./main config/neg/list-neg-lite.txt > experiments/neg/synthesis/list-lite/list.out 2> experiments/neg/synthesis/list-lite/list.err
mv 0-* program.txt experiments/neg/synthesis/list-lite/

echo 'Synthesizing List...'
./main config/neg/list-neg.txt > experiments/neg/synthesis/list/list.out 2> experiments/neg/synthesis/list/list.err
mv 0-* program.txt experiments/neg/synthesis/list/

echo 'Synthesizing Gripper Lite...'
./main config/neg/gripper-neg-lite.txt > experiments/neg/synthesis/gripper-lite/gripper.out 2> experiments/neg/synthesis/gripper/gripper.err
mv 0-* program.txt experiments/neg/synthesis/gripper-lite/

echo 'Synthesizing Gripper...'
./main config/neg/gripper-neg.txt > experiments/neg/synthesis/gripper/gripper.out 2> experiments/neg/synthesis/gripper/gripper.err
mv 0-* program.txt experiments/neg/synthesis/gripper/

echo 'Synthesizing Reverse Lite...'
./main config/neg/reverse-neg-lite.txt > experiments/neg/synthesis/reverse-lite/reverse.out 2> experiments/neg/synthesis/reverse-lite/reverse.err
mv 0-* program.txt experiments/neg/synthesis/reverse-lite/

echo 'Synthesizing Reverse...'
./main config/neg/reverse-neg.txt > experiments/neg/synthesis/reverse/reverse.out 2> experiments/neg/synthesis/reverse/reverse.err
mv 0-* program.txt experiments/neg/synthesis/reverse/


echo 'Synthesizing Fibonacci Lite...'
./main config/neg/fibonacci-neg-lite.txt > experiments/neg/synthesis/fibo-lite/fibo.out 2> experiments/neg/synthesis/fibo-lite/fibo.err
mv 0-* program.txt experiments/neg/synthesis/fibo-lite/

echo 'Synthesizing Fibonacci...'
./main config/neg/fibonacci-neg.txt > experiments/neg/synthesis/fibo/fibo.out 2> experiments/neg/synthesis/fibo/fibo.err
mv 0-* program.txt experiments/neg/synthesis/fibo/


echo 'Synthesizing AB-regex-Q Lite positives...'
./main config/neg/abQ-pos-lite.txt
mv program.txt experiments/neg/synthesis/ab-regex-q-lite/program-positive.txt

echo 'Synthesizing AB-regex-P Lite positives...'
./main config/neg/abP-pos-lite.txt
mv program.txt experiments/neg/synthesis/ab-regex-p-lite/program-positive.txt

echo 'Synthesizing AB-regex-A Lite positives...'
./main config/neg/abQ-pos-lite.txt
mv program.txt experiments/neg/synthesis/ab-regex-a-lite/program-positive.txt

echo 'Synthesizing Triangular Sum Lite positives...'
./main config/neg/sumatory-pos-lite.txt
mv program.txt experiments/neg/synthesis/triangularsum-lite/program-positive.txt

echo 'Synthesizing List Lite positives...'
./main config/neg/list-pos-lite.txt 
mv program.txt experiments/neg/synthesis/list-lite/program-positive.txt

echo 'Synthesizing Gripper Lite positives...'
./main config/neg/gripper-pos-lite.txt
mv program.txt experiments/neg/synthesis/gripper-lite/program-positive.txt

echo 'Synthesizing Reverse Lite positives...'
./main config/neg/reverse-pos-lite.txt
mv program.txt experiments/neg/synthesis/reverse-lite/program-positive.txt

echo 'Synthesizing Fibonacci Lite positives...'
./main config/neg/fibonacci-pos-lite.txt
mv program.txt experiments/neg/synthesis/fibo-lite/program-positive.txt

