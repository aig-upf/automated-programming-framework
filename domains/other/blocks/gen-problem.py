#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nblocks = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <nblocks>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(nblocks)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain blocks)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,nblocks):
   str_problem=str_problem + "b"+str(j+1)+" "
str_problem=str_problem + "- block "

str_problem=str_problem + ")\n"


str_problem=str_problem + "  (:init "
str_problem=str_problem + "(clear b1) "
str_problem=str_problem + "(ontable b"+str(nblocks)+") "
 
for j in range(0,nblocks-1):
   str_problem=str_problem + "(on b"+str(j+1)+" b"+str(j+2)+")"
str_problem=str_problem + "(empty) "

random.seed()
bgreen = random.randint(0,nblocks)
str_problem=str_problem + "(green b"+str(bgreen)+")"
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and (have b"+str(bgreen)+"))))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
