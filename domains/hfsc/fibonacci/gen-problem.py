#! /usr/bin/env python
import sys,time

def fibonacci(n):
    first=1
    second=1    
    f=1
    for i in range(0,n):
        f=first+second
        first=second
        second=f
    return f
   

#**************************************#
# MAIN
#**************************************#
try:
   nvalue = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <nvalue>"
   sys.exit(-1)


str_problem=""
str_problem=str_problem + "(define (problem p"+str(nvalue)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain fibonacci)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,fibonacci(nvalue)+1):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value)\n"

str_problem=str_problem + "  (:init (var0 v0) (var1 v"+str(nvalue)+") (first v1) (second v1)"

for i in range(0,fibonacci(nvalue)+1):
    for j in range(0,fibonacci(nvalue)+1):
        if (i+j) <= fibonacci(nvalue):
            str_problem=str_problem + "(sum v"+str(i)+" v"+str(j)+" v"+str(i+j)+")"
#        else:
#            str_problem=str_problem + "(sum v"+str(i)+" v"+str(j)+" v"+str((i+j-1)%fibonacci(nvalue))+")"
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and  (var0 v"+str(fibonacci(nvalue))+") (var1 v0))))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
