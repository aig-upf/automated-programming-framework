#! /usr/bin/env python
import sys,time

#**************************************#
# MAIN
#**************************************#
try:
   nballs = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <nballs>"
   sys.exit(-1)


str_problem=""
str_problem=str_problem + "(define (problem p"+str(nballs)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain gripper)\n"
str_problem=str_problem + "  (:objects roomA roomB - room "

for j in range(0,nballs+1):
        str_problem=str_problem + "b"+str(j)+" "
str_problem=str_problem + "- balls "
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:init (at-robby roomA) (ballsR b0) (ballsA b"+str(nballs)+") (ballsB b0) (goalB b"+str(nballs)+")"

for j in range(0,nballs):
   str_problem=str_problem + " (succAB b"+str(j)+" b"+str(j+1)+")"   
for j in range(0,2):
   str_problem=str_problem + " (succR b"+str(j)+" b"+str(j+1)+")"   
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and (ballsB b"+str(nballs)+"))"
str_problem=str_problem + "))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
