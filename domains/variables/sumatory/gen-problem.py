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

suma = nvalue * (nvalue + 1)/2
str_problem=""
str_problem=str_problem + "(define (problem sumatory"+str(suma)+")\n"
str_problem=str_problem + "  (:domain variables)\n"
str_problem=str_problem + "  (:objects "

for j in range(2,suma+1):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value)\n"

str_problem=str_problem + "  (:init (assignment a v0) (assignment b v"+str(nvalue)+") "

for i in range(0,suma+1):
   for j in range(0,suma+1):
      if i + j <= suma :
         str_problem=str_problem + "(sum v"+str(i)+" v"+str(j)+" v"+str(i+j)+")"            
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and  (assignment a v"+str(suma)+") (assignment b v0))))\n"

f_problem=open("sumatory"+ str(suma) +".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
