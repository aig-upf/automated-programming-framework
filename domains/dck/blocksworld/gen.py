#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#


try:
   blocks = int( sys.argv[ 1 ] )
   lettername = sys.argv[ 2 ]
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <blocks> <letter>"
   print sys.argv[ 0 ] + " 6 a"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( blocks ) + str( lettername ) + ")\n"
str_problem=str_problem + "  (:DOMAIN blocksworld)\n"
str_problem=str_problem + "  (:OBJECTS \n\t"

v = []
for i in xrange( 1, blocks + 1 ):
   v.append( ( "B" + str( i ) ) )
random.shuffle( v )

colsInit = random.randint( 1, len( v ) )

colsGoal = random.randint( 1, len( v ) )

for i in xrange( 1, blocks + 1 ):
   str_problem = str_problem + " C" + str( i )
str_problem = str_problem + " - COLUMNS "

for i in xrange( 1, blocks + 1 ):
   str_problem = str_problem + " B" + str( i )
str_problem = str_problem + " - BLOCK )\n\t"

str_problem = str_problem + "\n  (:INIT"

for i in xrange( 1, blocks ):
   str_problem = str_problem +"\n\t( ADJACENT-COLUMNS C" + str( i ) +" C" + str( i+1 ) + " )"

str_problem = str_problem + "\n\t( HANDEMPTY )"
str_problem = str_problem + "\n\t( CURRENT-COLUMNS C" + str( colsInit ) + " )"
str_problem = str_problem + "\n\t( GOAL-COLUMNS C" + str( colsGoal ) + " )"

counter = 0
for c in xrange( 1, colsInit + 1 ):
   blocksInC = 0
   if c == colsInit :
      blocksInC = len( v ) - counter - ( colsInit - c )
   else :
      blocksInC = random.randint( 1,  len( v ) - counter - ( colsInit - c ) )
   str_problem = str_problem + "\n\t( ONTABLE " + str( v[ counter ] ) + " )"
   for bc in xrange( 1, blocksInC ):
      str_problem = str_problem + "\n\t( ON " + str( v[ counter + bc ] ) + " " + str( v[ counter + bc - 1 ] ) + " )"   
   str_problem = str_problem + "\n\t( CLEAR " + str( v[ counter + blocksInC - 1 ] ) + " )"
   counter = counter + blocksInC

str_problem = str_problem + " )"



str_problem = str_problem + "\n  (:GOAL\n\t( AND " 

random.shuffle( v )
counter = 0
for c in xrange( 1, colsGoal + 1 ):
   blocksInC = 0
   if c == colsGoal :
      blocksInC = len( v ) - counter - ( colsGoal - c )
   else :
      blocksInC = random.randint( 1,  len( v ) - counter - ( colsGoal - c ) )
   str_problem = str_problem + "\n\t( ONTABLE " + str( v[ counter ] ) + " )"
   for bc in xrange( 1, blocksInC ):
      str_problem = str_problem + "\n\t( ON " + str( v[ counter + bc ] ) + " " + str( v[ counter + bc - 1 ] ) + " )"   
   str_problem = str_problem + "\n\t( CLEAR " + str( v[ counter + blocksInC - 1 ] ) + " )"
   counter = counter + blocksInC

str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p"+ str( blocks ) + str( lettername ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit( 0 )
