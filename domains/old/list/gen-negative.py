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
str_problem=str_problem + "(DEFINE (PROBLEM PNEG-"+ str( size ) + ")\n"
str_problem=str_problem + "  (:DOMAIN LIST )\n"
str_problem=str_problem + "  (:OBJECTS "
for idx in xrange( 1, size + 1 ):
   str_problem=str_problem + " N" + str( idx )
str_problem = str_problem + " - NODE \n  )"

perm =  [ i for i in xrange(1,size+1) ] 
random.shuffle( perm )

str_problem = str_problem + "\n  (:INIT"
str_problem = str_problem + "\n\t( AT N" + str( perm[ 0 ] ) + ") ( GOAL N" + str( perm[ size - 1 ] ) + ")"
for idx in xrange( 1, size ):
   str_problem = str_problem + "\n\t( ADJACENT N" + str( perm[ idx - 1 ] ) + " N" + str( perm[ idx ] ) + ")"

str_problem = str_problem + " )"

str_problem = str_problem + "\n  (:GOAL"
str_problem = str_problem + "\n\t( AND"
str_problem = str_problem + "\n\t( AT N" + str( perm[ size - 1 ] ) + ") ( VISITED N" + str( perm[ size - 1 ] ) + ")"
for i in xrange( 1, size ):
   if( random.randint( 0, 5 ) > 0 ):
      str_problem = str_problem + "\n\t( VISITED N" + str( perm[ i - 1 ] ) + " )"
   else:
      str_problem = str_problem + "\n\t( NOT ( VISITED N" + str( perm[ i - 1 ] ) + " ) )"

for i in xrange( 1, size ):
   if( random.randint( 0, 5 ) > 0 ):
      str_problem = str_problem + "\n\t( CHECKED N" + str( perm[ i - 1 ] ) + " )"
   else:
      str_problem = str_problem + "\n\t( NOT ( CHECKED N" + str( perm[ i - 1 ] ) + " ) )"

str_problem = str_problem + "\n\t)\n  )\n)"

str_problem = str_problem.lower()

f_problem=open("pneg-" + str( size ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit( 0 )

