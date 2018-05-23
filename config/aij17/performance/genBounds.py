#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#

problems = [ "find", "reverse", "select", "sumatory" ]
domains = [ "pointers", "pointers", "pointers", "variables" ]
instances = [ [ "find3.pddl", "find4a.pddl", "find4b.pddl" ], [ "reverse2.pddl", "reverse4.pddl" ], [ "select2.pddl", "select3.pddl", "select4.pddl", "select5.pddl" ], [ "sumatory2.pddl", "sumatory3.pddl" ] ]

test = []
letters = [ "", "a", "b", "c", "d" ]
for d in xrange( 0, 3 ):
   v = []
   for p in xrange( 3, 11 ):
      for l in letters :
         v.append( "p" + str( p ) + l + ".pddl" )
   test.append( v )

#ts = [ "sumatory2.pddl", "sumatory6.pddl", "sumatory10.pddl", "sumatory15.pddl", "sumatory21.pddl", "sumatory28.pddl", "sumatory36.pddl", "sumatory55.pddl", "sumatory120.pddl", "sumatory210.pddl" ]
ts = [ "sumatory2.pddl", "sumatory6.pddl", "sumatory10.pddl", "sumatory15.pddl", "sumatory21.pddl", "sumatory28.pddl" ]

test.append( ts )

try:
   problem = int( sys.argv[ 1 ] )
   lines = int( sys.argv[ 2 ] )
   stacksize = int( sys.argv[ 3 ] )
   timebound = int( sys.argv[ 4 ] )
except:
   print "Select one problem (0, 3) among these ones " + str( problems )
   print "Usage:"
   print sys.argv[ 0 ] + " <problem> <lines> <stacksize> <timebound>"
   print sys.argv[ 0 ] + " 2 4 1 400"
   sys.exit(-1)

str_problem = "PLPR\n"
str_problem = str_problem + "bin/compile\n"
str_problem = str_problem + "domains/" + domains[ problem ] + "/domain.pddl\n"
str_problem = str_problem + "domain.pddl ins.pddl\n"
str_problem = str_problem + "0\n"

# train
#4 600 3 domains/pointers/find/find3.pddl domains/pointers/find/find4a.pddl domains/pointers/find/find4b.pddl
#randomInstances = list(instances[ problem ])
#random.shuffle( randomInstances )
#randomInstances = randomInstances[ 0 : instQ ]
str_problem = str_problem + str( lines ) + " " + str( timebound ) + " " + str( len( instances[ problem ] ) )
for i in instances[ problem ] :
   str_problem = str_problem + " domains/" + domains[ problem ] + "/" + problems[ problem ] + "/" + i
str_problem = str_problem + "\n"

# test
#1 600 domains/pointers/find/find30.pddl
str_problem = str_problem + str( len( test[ problem ] ) ) + " " + str( timebound )
for i in test[ problem ] :
   str_problem = str_problem + " domains/" + domains[ problem ] + "/" + problems[ problem ] + "/" + i
str_problem = str_problem + "\n"

str_problem = str_problem + "0\n0\n"+ str( stacksize ) + " " + str( stacksize ) + "\n0 0 0"

f_problem=open( problems[ problem ] + "_" + str( lines ) + "_" + str( stacksize ) + ".txt","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
