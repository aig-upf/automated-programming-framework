#! /usr/bin/env python
import sys,time

def summatory(n):
   return (n*(n+1))/2
   

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
str_problem=str_problem + "  (:domain summatory)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,summatory(nvalue)+1):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value)\n"

str_problem=str_problem + "  (:init (var0 v0) (var1 v"+str(nvalue)+") "

for i in range(0,summatory(nvalue)+1):
   for j in range(0,summatory(nvalue)+1):
      if i + j <= summatory(nvalue):
         str_problem=str_problem + "(sum v"+str(i)+" v"+str(j)+" v"+str(i+j)+")"            
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and  (var0 v"+str(summatory(nvalue))+") (var1 v0))))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
