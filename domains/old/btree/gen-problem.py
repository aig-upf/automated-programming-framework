#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   ndepth = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <ndepth>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(ndepth)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain btree)\n"
str_problem=str_problem + "  (:objects "

nsize = int(pow(2,ndepth))
for j in range(1,nsize):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value "
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:init (varnode v1)"
goal = random.randint(int(pow(2,ndepth-1)),int(pow(2,ndepth))-1)
str_problem=str_problem + " (vargoal v" + str(goal) + ")"


nsize = int(pow(2,ndepth-1))
for j in range(1,nsize):
   str_problem=str_problem + "(consec-0 v"+str(j)+" v"+str(2*j)+")"
   str_problem=str_problem + "(consec-1 v"+str(j)+" v"+str(2*j+1)+")"      
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and "
str_problem=str_problem + " (visited v" + str(goal) + ")"

str_problem=str_problem + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
