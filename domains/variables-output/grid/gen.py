#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
try:
   lines = int( sys.argv[ 1 ] )
   columns = int( sys.argv[ 2 ] )
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <lines> <columns>"
   print sys.argv[ 0 ] + " 2 3"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( lines ) + "x" + str( columns ) + ")\n"
str_problem=str_problem + "  (:DOMAIN VARIABLES-OUTPUT )\n"
str_problem=str_problem + "  (:OBJECTS "
for idx in xrange( 0, max( lines, columns ) ):
   str_problem=str_problem + " V" + str( idx )
str_problem = str_problem + " - VALUE \n  )"

str_problem = str_problem + "\n  (:INIT"
for idx in xrange( 0, max( lines, columns ) - 1 ):
   str_problem = str_problem + "\n\t( NEXT V" + str( idx ) + " V" + str( idx + 1 ) + ")"
#str_problem = str_problem + "\n\t( MODIFIABLE A )"
#str_problem = str_problem + "\n\t( MODIFIABLE B )"

random.seed()
a = random.randint( 0 , lines - 1 )
b = random.randint( 0 , columns - 1 )
c = random.randint( 0 , lines - 1 )
d = random.randint( 0 , columns - 1 )
while c == a and d == b :
   c = random.randint( 0 , lines - 1 )
   d = random.randint( 0 , columns - 1 )

str_problem = str_problem + "\n\t( ASSIGNMENT A V" + str( a ) + ")"
str_problem = str_problem + "\n\t( ASSIGNMENT B V" + str( b ) + ")"
str_problem = str_problem + "\n\t( ASSIGNMENT C V" + str( c ) + ")"
str_problem = str_problem + "\n\t( ASSIGNMENT D V" + str( d ) + ")"
str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL"
str_problem = str_problem + "\n\t( AND"
str_problem = str_problem + "\n\t( ASSIGNMENT A V" + str( c ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT B V" + str( d ) + " )"
str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p" + str( lines ) + "x" + str( columns ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
