#! /usr/bin/env python
import sys,time,random
  

#**************************************#
# MAIN
#**************************************#
try:
   nodes = int(sys.argv[1])
   isPosStr = str(sys.argv[2])
   letter = str(sys.argv[3])
except:
   print "Usage:"
   print sys.argv[0] + " <#nodes> <isPositive?> <letter>"
   print sys.argv[0] + " 2 False a"
   sys.exit(-1)

isPos = False
if isPosStr == "True" :
   isPos = True   
posneg = ["-neg","-pos"]
str_problem="(define (problem list"+str(nodes)+posneg[int(isPos)]+"-"+letter+")\n"
str_problem=str_problem + "  (:domain list)\n"
str_problem=str_problem + "  (:objects "

for idx in xrange( 1, nodes + 1 ):
   str_problem=str_problem + " n" + str( idx )
str_problem = str_problem + " - node )"

perm =  [ i for i in xrange(1,nodes+1) ] 
random.shuffle( perm )

str_problem = str_problem + "\n  (:init"
str_problem = str_problem + " ( at n" + str( perm[ 0 ] ) + ") ( not-visited n" + str( perm[ nodes - 1 ] ) + " ) ( tail n" + str( perm[ nodes - 1 ] ) + ")"
for idx in xrange( 1, nodes ):
   str_problem = str_problem + "( adjacent n" + str( perm[ idx - 1 ] ) + " n" + str( perm[ idx ] ) + ")( not-visited n" + str( perm[ idx - 1 ] ) + " )"
str_problem = str_problem + " )"

visited = [True]*nodes

# Run for negative instances
while (not isPos) :
   ok = False
   for i in range( 0, nodes ):
      visited[ i ] = random.choice( [False,True] )
      if ( visited[ i ] == False ):
         ok = True
   if( ok == True ):
      break

str_problem=str_problem + "\n  (:goal (and "
for idx in xrange( 0, nodes ):
   if( visited[ perm[ idx ] - 1 ] == True ):
      str_problem = str_problem + "( visited n" + str( perm[ idx ] ) + " )"
   else :
      str_problem = str_problem + "( not-visited n" + str( perm[ idx ] ) + " )"
str_problem=str_problem + ")))\n"


f_problem=open("list-"+ str(nodes) + posneg[int(isPos)] +"-"+letter+ ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
