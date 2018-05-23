#! /usr/bin/env python
import sys,time

#**************************************#
# MAIN
#**************************************#
try:
   nvalue = int( sys.argv[1] )
except:
   print "Usage:"
   print sys.argv[0] + " <nvalue>"
   print sys.argv[0] + " 5"
   sys.exit(-1)

v = [ 0, 1 ]
for i in xrange( 1, nvalue + 1 ):
   v.append( v[ i - 1 ] + v[ i ] )   

res = v[ len( v ) - 1 ]

str_problem=""
str_problem=str_problem + "(define (problem p" + str( nvalue ) + ")\n"
str_problem=str_problem + "  (:domain variables)\n"
str_problem=str_problem + "  (:objects "

for j in xrange( 2, res + 2 ):
   str_problem=str_problem + "v" + str( j ) + " "
str_problem=str_problem + "- value)\n"

str_problem=str_problem + "  (:init (assignment a v1) (assignment b v" + str( nvalue ) + ") (assignment c v0) (assignment d v0)"

for i in xrange( 0 , res + 2 ):
   for j in xrange( 0 , res + 2 ):
      if i + j < res + 2 :
         str_problem = str_problem + "\n\t(sum v" + str( i ) + " v" + str( j ) + " v" + str( i + j ) + ")"
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and  (assignment a v" + str( res ) + ") (assignment b v0) (assignment c v" + str( v[ len( v ) - 2 ] ) + ") (assignment d v" + str( v[ len( v ) - 3 ] ) + "))))\n"

f_problem=open( "p" + str( nvalue ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
