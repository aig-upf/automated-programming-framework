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
str_problem=str_problem + "(define (problem p"+str(nsize)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain count)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,nsize):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value "

for j in range(0,nsize):
   str_problem=str_problem + "ix"+str(j)+" "
str_problem=str_problem + "- index "

str_problem=str_problem + ")\n"


str_problem=str_problem + "  (:init "
my_list=[]
random.seed()
for i in range(0,nsize):
    my_list.append(random.randint(0, (nsize-1)/2))

str_problem=str_problem + " (counter v0)"
goal = my_list[random.randint(0, nsize-1)]
str_problem=str_problem + " (goal v" + str(goal) + ")"
str_problem=str_problem + " (iterator ix0)"
str_problem=str_problem + " (currentval v" + str(my_list[0]) + ")"
for j in range(0,nsize):
    str_problem=str_problem + " (assignment ix"+str(j)+ " v"+str(my_list[j])+ ")"

for j in range(0,nsize-1):
   str_problem=str_problem + "(consec-v v"+str(j)+" v"+str(j+1)+")"
for j in range(0,nsize-1):
   str_problem=str_problem + "(consec-i ix"+str(j)+" ix"+str(j+1)+")"   
   
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and "
str_problem=str_problem + " (counter v"+str(my_list.count(goal))+")"

str_problem=str_problem + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
