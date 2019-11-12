#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nballs = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <nballs>"
   print sys.argv[ 0 ] + " 8 "
   sys.exit(-1)


str_problem = ""
str_problem = str_problem + "(define (problem pneg-" + str( nballs ) + ")\n"
str_problem = str_problem + "  (:domain gripper )\n"
str_problem = str_problem + "  (:objects "

for j in xrange( 1 , nballs + 1 ):
   str_problem = str_problem + "b" + str( j ) + " "
str_problem=str_problem + "- ball )\n"

str_problem=str_problem + "  (:init (at-robby roomA) (free left) (free right) ( next-ball b1 ) ( at b" + str( nballs ) + " roomB ) \n"

for j in xrange( 1 , nballs ):
   str_problem = str_problem + "     (succ-balls b" + str( j ) + " b" + str( j + 1 ) + ")\n"   
for j in xrange( 1, nballs ):
   if( random.randint(0,5) > 0 ):
      str_problem = str_problem + "     (at b" + str( j ) + " roomA )\n"
   else:
      str_problem = str_problem + "     (at b" + str( j ) + " roomB )\n"

str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and \n"
for j in xrange( 1, nballs ):
   if( random.randint(0,5) > 0 ):
      str_problem = str_problem + "     (at b" + str( j ) + " roomB )\n"
   else:
      str_problem = str_problem + "     (at b" + str( j ) + " roomA )\n"
str_problem=str_problem + ")))\n"

f_problem=open("pneg-" + str( nballs ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
