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
str_problem=str_problem + "  (:domain htower)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,nsize):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + " vNULL - value "

str_problem=str_problem + ")\n"


str_problem=str_problem + "  (:init "

if (nsize%2)!=0:
    str_problem=str_problem + "  (odd)"

str_problem=str_problem + "(consecA vNULL v0)"
for j in range(0,nsize-1):
   str_problem=str_problem + "(consecA v"+str(j)+" v"+str(j+1)+")"

str_problem=str_problem + "(clearA v"+str(nsize-1)+")"
str_problem=str_problem + "(clearB vNULL)"
str_problem=str_problem + "(clearC vNULL)"

set_less=set()
for i in range(0,nsize):
    set_less.add("(greater-than vNULL v"+str(i)+")")
    for j in range(0,nsize):   
        if i>j:
            set_less.add("(greater-than v"+str(j)+" v"+str(i)+")")
for c in set_less:
    str_problem=str_problem + c

str_problem=str_problem + "(handempty)"       
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and "
str_problem=str_problem + "(consecC vNULL v0)"
for j in range(0,nsize-1):
   str_problem=str_problem + "(consecC v"+str(j)+" v"+str(j+1)+")"
str_problem=str_problem + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
