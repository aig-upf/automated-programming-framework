#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
try:
   size = int( sys.argv[ 1 ] )
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <size>"
   print sys.argv[ 0 ] + " 3"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( size ) + ")\n"
str_problem=str_problem + "  (:DOMAIN VARIABLES-OUTPUT )\n"
str_problem=str_problem + "  (:OBJECTS "
for idx in xrange( 0, size + 1 ):
   str_problem=str_problem + " V" + str( idx )
str_problem = str_problem + " - VALUE \n  )"

str_problem = str_problem + "\n  (:INIT"
for idx in xrange( 0, size ):
   str_problem = str_problem + "\n\t( NEXT V" + str( idx ) + " V" + str( idx + 1 ) + ")"

str_problem = str_problem + "\n\t( ASSIGNMENT A V0 )"
str_problem = str_problem + "\n\t( ASSIGNMENT B V0 )"
str_problem = str_problem + "\n\t( ASSIGNMENT C V" + str( size ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT D V" + str( size ) + " )"
str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL"
str_problem = str_problem + "\n\t( AND"
for i in xrange( 0, size ):
   for j in xrange( 0 , size ):
      str_problem = str_problem + "\n\t( output-two v" + str( i ) + " v" + str( j ) + " )"

str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p" + str( size ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit( 0 )
