#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
try:
   size = int( sys.argv[ 1 ] )
   values = int( sys.argv[ 2 ] )
   lettername = sys.argv[ 3 ]
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <size> <values> <letter>"
   print sys.argv[ 0 ] + " 6 3 a"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( size ) + "x" + str( values ) + str( lettername ) + ")\n"
str_problem=str_problem + "  (:DOMAIN SORTING )\n"
str_problem=str_problem + "  (:OBJECTS \n\t"

for i in xrange( 0, size ):
   str_problem = str_problem + " i" + str( i )
str_problem = str_problem + " - index\n\t"

for i in xrange( 0 , values ):
   str_problem = str_problem + " v" + str( i )
str_problem = str_problem + " - value \n  )"

str_problem = str_problem + "\n  (:INIT"

v = []

for i in xrange( 0, size ):
   v.append( random.randint( 0, values - 1 ) )
   str_problem = str_problem + "\n\t( assignment i" + str( i ) + " v" + str( v[ i ] ) + " )"


for i in xrange( 0, size - 1 ):
   str_problem = str_problem + "\n\t( consec i" + str( i ) + " i" + str( i + 1 ) + " )"

for i in xrange( 0, values ):
   for j in xrange( i + 1, values ):
      str_problem = str_problem + "\n\t( lessthan v" + str( i ) + " v" + str( j ) + " )"

str_problem = str_problem + "\n\t( outeriter i0)"
str_problem = str_problem + "\n\t( outerval v" + str( v[ 0 ] ) + ")"
str_problem = str_problem + "\n\t( iterator i0)"
str_problem = str_problem + "\n\t( currentval v" + str( v[ 0 ] ) + ")"
str_problem = str_problem + "\n\t( itermax i" + str( size - 1 ) + ")"
str_problem = str_problem + "\n\t( itermark i0)"
str_problem = str_problem + "\n\t( valuemark v" + str( v[ 0 ] ) + ")"

str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL\n\t( AND " 

v.sort()
for i in xrange( 0, size ):
   str_problem = str_problem + "\n\t( assignment i" + str( i ) + " v" + str( v[ i ] ) + " )"

str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p"+ str( size ) + "-" + str( values ) + str( lettername ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit( 0 )
