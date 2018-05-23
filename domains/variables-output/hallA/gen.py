#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
try:
   lines = int( sys.argv[ 1 ] )
   columns = int( sys.argv[ 2 ] )
   lettername = sys.argv[ 3 ]
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <lines> <columns> <letter>"
   print sys.argv[ 0 ] + " 2 3 a"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( lines ) + "x" + str( columns ) + str( lettername ) + ")\n"
str_problem=str_problem + "  (:DOMAIN VARIABLES-OUTPUT )\n"
str_problem=str_problem + "  (:OBJECTS "
for idx in xrange( 0, max( lines, columns ) ):
   str_problem=str_problem + " V" + str( idx )
str_problem = str_problem + " - VALUE \n  )"

str_problem = str_problem + "\n  (:INIT"
for idx in xrange( 0, max( lines, columns ) - 1 ):
   str_problem = str_problem + "\n\t( NEXT V" + str( idx ) + " V" + str( idx + 1 ) + ")"

for i in xrange( 0, lines ):
   for j in xrange( 0 , columns ):
      str_problem = str_problem + "\n\t( not-output-two v" + str( i ) + " v" + str( j ) + ")"

random.seed()
a = random.randint( 0 , lines - 1 )
b = random.randint( 0 , columns - 1 )

str_problem = str_problem + "\n\t( ASSIGNMENT A V" + str( a ) + ")"
str_problem = str_problem + "\n\t( ASSIGNMENT B V" + str( b ) + ")"
str_problem = str_problem + "\n\t( ASSIGNMENT C V" + str( lines - 1 ) + ")"
str_problem = str_problem + "\n\t( ASSIGNMENT D V" + str( columns - 1 ) + ")"
str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL"
str_problem = str_problem + "\n\t( AND"
for i in xrange( 0, lines ):
   for j in xrange( 0 , columns ):
      if ( i == 0 and ( j == 0 or j == columns - 1) ) or ( i == lines - 1 and ( j == 0 or j == columns - 1 ) ):
         str_problem = str_problem + "\n\t( output-two v" + str( i ) + " v" + str( j ) + " )"
      else :
         str_problem = str_problem + "\n\t( not-output-two v" + str( i ) + " v" + str( j ) + ")"
str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p" + str( lines ) + "x" + str( columns ) + str( lettername ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
