#! /usr/bin/env python
import sys,time

#**************************************#
# MAIN
#**************************************#
try:
   nrows = int(sys.argv[1])
   ncols = int(sys.argv[2])
   mode = sys.argv[3]
except:
   print "Usage:"
   print sys.argv[0] + " <nrows> <ncols> <mode(a|b)>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(nrows)+"x"+str(ncols)+str(mode)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain visitall)\n"
str_problem=str_problem + "  (:objects "

nsize = max(nrows,ncols)
for j in range(0,nsize):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value "

str_problem=str_problem + ")\n"

if mode =="a":
    str_problem=str_problem + "  (:init (varx v0)(vary v0)(varmin v0)(varmax v" + str(nsize-1) + ") "
if mode =="b":
    str_problem=str_problem + "  (:init (varx v"+str(ncols-1)+")(vary v"+str(nrows-1)+")(varmin v0)(varmax v" + str(nsize-1) + ") "    

for j in range(0,nsize-1):
   str_problem=str_problem + "(consec v"+str(j)+" v"+str(j+1)+")"   
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and "
for i in range(0,ncols):
    for j in range(0,nrows):
        str_problem=str_problem + "(visited v"+str(i)+" v"+str(j)+")"
str_problem=str_problem + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
