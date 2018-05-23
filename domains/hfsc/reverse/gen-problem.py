#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nsize = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <nsize>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(nsize)+")\n"
str_problem=str_problem + "  (:domain reverse)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,nsize):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value "

for j in range(0,nsize):
   str_problem=str_problem + "i"+str(j)+" "
str_problem=str_problem + "- index "

str_problem=str_problem + ")\n"


str_problem=str_problem + "  (:init "

for j in range(0,nsize-1):
   str_problem=str_problem + "(consec i"+str(j)+" i"+str(j+1)+")"

set_less=set()
for i in range(0,nsize):
    for j in range(0,nsize):   
        if i>=j:
            set_less.add("(greatereq-than i"+str(i)+" i"+str(j)+")")
for c in set_less:
    str_problem=str_problem + c

random.seed()
values=range(0,nsize)
random.shuffle(values)
for j in range(0,nsize):
   str_problem=str_problem + " (assignment i"+str(j)+" v"+str(values[j])+")"

str_problem=str_problem + "(iterator1 i0) "
str_problem=str_problem + "(iterator2 i"+str(nsize-1)+") "
str_problem=str_problem + "(i1val v"+str(values[0])+")"
str_problem=str_problem + "(i2val v"+str(values[nsize-1])+") "    
       
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and "

for j in range(0,nsize):
   str_problem=str_problem + " (assignment i"+str(j)+" v"+str(values[nsize-j-1])+")"

str_problem=str_problem + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
