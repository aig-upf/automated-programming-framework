#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nvalue = int( sys.argv[1] )
   let = str( sys.argv[2] )
except:
   print "Usage:"
   print sys.argv[0] + " <nvalue> <letter>"
   print sys.argv[0] + " 5 a"
   sys.exit(-1)

v = [ 0, 1 ]
for i in xrange( 1, nvalue + 1 ):
   v.append( v[ i - 1 ] + v[ i ] )   

res = v[ len( v ) - 1 ]

str_problem=""
str_problem=str_problem + "(define (problem p-neg-" + str( nvalue ) + let + ")\n"
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

a,b,c,d = res,0,v[ nvalue - 2 ], v[ nvalue - 1 ]
while( a == res and b == 0 and c == v[ nvalue - 2 ] and d == v[ nvalue - 1 ] ):
   a = random.randint( 0, res )
   b = random.randint( 0, nvalue )
   c = random.randint( 0, res )
   d = random.randint( 0, res )

str_problem=str_problem + "  (:goal (and  (assignment a v" + str( a ) + ") (assignment b v" + str( b ) + ") (assignment c v" + str( c ) + ") (assignment d v" + str( d ) + "))))\n"

f_problem=open( "p-neg-" + str( nvalue ) + let + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
