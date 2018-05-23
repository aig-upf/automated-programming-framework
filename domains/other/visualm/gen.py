#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
try:
   rows = int( sys.argv[ 1 ] )
   columns = int( sys.argv[ 2 ] )
   lettername = sys.argv[ 3 ]
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <rows> <columns> <letter>"
   print sys.argv[ 0 ] + " 3 4 a"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM P"+ str( rows ) + "x" + str( columns ) + str( lettername ) + ")\n"
str_problem=str_problem + "  (:DOMAIN VISUAL-MARKER )\n"
str_problem=str_problem + "  (:OBJECTS "
for idx in xrange( 0, max( rows, columns ) + 1 ):
   str_problem=str_problem + " V" + str( idx )
str_problem = str_problem + " - VALUE \n  )"

str_problem = str_problem + "\n  (:INIT"
for idx in xrange( 0, max( rows, columns ) ):
   str_problem = str_problem + "\n\t( CONSEC V" + str( idx ) + " V" + str( idx + 1 ) + ")"

str_problem = str_problem + "\n\t(xpos v0)(ypos v0)(xmax v" + str( rows ) + ")(ymax v" + str( columns ) + ")"

greenish = False
random.seed()
gR = random.randint( 0, rows )
gC = random.randint( 0, columns )

str_problem = str_problem + "\n\t(green v" + str( gR ) + " v" + str( gC ) + " )"

for r in xrange( 0, rows + 1 ):
   if (gR == r ) :
      blocks = random.randint( gC, columns )
      for c in xrange( 0, blocks + 1 ):
          str_problem = str_problem + "\n\t(block v" + str( r ) + " v" + str( c ) + " )" 
   elif random.randint( 0, 2 ) > 0:
      blocks = random.randint( 1, columns )
      for c in xrange( 0, blocks + 1 ):
          str_problem = str_problem + "\n\t(block v" + str( r ) + " v" + str( c ) + " )" 

str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL\n\t( AND ( MARKED )\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("p"+ str( rows ) + "x" + str( columns ) + str( lettername ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit( 0 )
