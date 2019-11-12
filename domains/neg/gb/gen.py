#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nblocks = int(sys.argv[1])
   isPosStr = str(sys.argv[2])
   letter = str(sys.argv[3])
except:
   print "Usage:"
   print sys.argv[0] + " <#blocks> <isPositive?> <letter>"
   print sys.argv[0] + " 2 False a"
   sys.exit(-1)

isPos = False
if isPosStr == "True" :
   isPos = True   
posneg = ["-neg","-pos"]
str_problem="(define (problem gb"+str(nblocks)+posneg[int(isPos)]+"-"+letter+")\n"
str_problem=str_problem + "  (:domain blocks)\n"
str_problem=str_problem + "  (:objects "


for j in xrange(1,nblocks + 1):
   str_problem=str_problem + "b" + str( j ) + " "
str_problem=str_problem + "- block )\n"

str_problem=str_problem + "  (:init "
str_problem=str_problem + "(clear b1) "
str_problem=str_problem + "(ontable b"+str(nblocks)+") "
 
for j in range(1,nblocks):
   str_problem=str_problem + "      ( on b" + str( j ) + " b" + str( j + 1 ) + " )\n"
str_problem=str_problem + "(empty) "

random.seed()
bgreen = random.randint( 1 , nblocks )
str_problem=str_problem + "(green b" + str( bgreen ) + ") ) \n"


# Run for negative instances
while (not isPos) :
   auxgreen = random.randint( 1 , nblocks )
   if( auxgreen != bgreen ):
      bgreen = auxgreen
      break

str_problem=str_problem + "  (:goal (and (have b" + str( bgreen ) + "))))\n"

f_problem=open("gb-"+ str(nblocks) + posneg[int(isPos)] +"-"+letter+ ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
