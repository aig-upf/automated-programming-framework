#! /usr/bin/env python
import sys,time,random

def summatory(n):
   return (n*(n+1))/2
   

#**************************************#
# MAIN
#**************************************#
try:
   nballs = int(sys.argv[1])
   isPosStr = str(sys.argv[2])
   letter = str(sys.argv[3])
except:
   print "Usage:"
   print sys.argv[0] + " <nballs> <isPositive?> <letter>"
   print sys.argv[0] + " 2 False a"
   sys.exit(-1)

isPos = False
if isPosStr == "True" :
   isPos = True   
posneg = ["-neg","-pos"]
str_problem="(define (problem gripper"+str(nballs)+posneg[int(isPos)]+"-"+letter+")\n"
str_problem=str_problem + "  (:domain gripper)\n"
str_problem=str_problem + "  (:objects "

for j in xrange( 1 , nballs + 1 ):
        str_problem = str_problem + "b" + str( j ) + " "
str_problem=str_problem + "- ball )\n"

str_problem=str_problem + "  (:init (at-robby roomA) (free left) (free right) ( next-ball b1 ) ( at b" + str( nballs ) + " roomB ) \n"

for j in xrange( 1 , nballs ):
   str_problem = str_problem + "     (succ-balls b" + str( j ) + " b" + str( j + 1 ) + ")\n" 

ib = [0]*nballs
gb = [1]*nballs

# Run for negative instances
while (not isPos) :
   auxib = [0]*nballs
   auxgb = [1]*nballs
   ok = False
   for i in range(0, nballs ):
      auxib[ i ] = random.randint(0, 1 )
      auxgb[ i ] = random.randint(0, 1 )
      if( auxib[ i ] == 0 and auxgb[ i ] == 0 ):
         ok = True
   if ok == True:
      ib = auxib
      gb = auxgb
      break

room = ["roomA","roomB"]

for j in xrange( 1, nballs ):
   str_problem = str_problem + "     (at b" + str( j ) + " " + room[ ib[ j - 1 ] ] + ")\n"

str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and \n"
for j in xrange( 1, nballs ):
   str_problem = str_problem + "      (at b" + str( j ) + " " + room[ gb[ j - 1 ] ] + " )\n"
str_problem=str_problem + ")))\n"

f_problem=open("gripper-"+ str(nballs) + posneg[int(isPos)] +"-"+letter+ ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
