#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#

problems = [ "find", "reverse", "select", "sumatory" ]
domains = [ "pointers", "pointers", "pointers", "variables" ]
instances = [ ]

letters = [ "", "a", "b", "c", "d" ]
for d in xrange( 0, 3 ):
   v = []
   for p in xrange( 3, 11 ):
      for l in letters :
         v.append( "p" + str( p ) + l + ".pddl" )
   instances.append( v )

#ts = [ "sumatory2.pddl", "sumatory6.pddl", "sumatory10.pddl", "sumatory15.pddl", "sumatory21.pddl", "sumatory28.pddl", "sumatory36.pddl", "sumatory55.pddl", "sumatory120.pddl", "sumatory210.pddl" ]
ts = [ "sumatory2.pddl", "sumatory6.pddl", "sumatory10.pddl", "sumatory15.pddl", "sumatory21.pddl", "sumatory28.pddl" ]

instances.append( ts )

try:
   problem = int( sys.argv[ 1 ] )
   letter = sys.argv[ 2 ]
   lines = int( sys.argv[ 3 ] )
   timebound = int( sys.argv[ 4 ] )
   instQ = int( sys.argv[ 5 ] )
except:
   print "Select one problem (0, 3) among these ones " + str( problems )
   print "Usage:"
   print sys.argv[ 0 ] + " <problem> <letter> <lines> <timebound> <numOfInstances>"
   print sys.argv[ 0 ] + " 2 a 4 600 3"
   sys.exit(-1)

str_problem = "PLPR\n"
str_problem = str_problem + "bin/compile\n"
str_problem = str_problem + "domains/" + domains[ problem ] + "/domain.pddl\n"
str_problem = str_problem + "domain.pddl ins.pddl\n"
str_problem = str_problem + "0\n"

# train
#4 600 3 domains/pointers/find/find3.pddl domains/pointers/find/find4a.pddl domains/pointers/find/find4b.pddl
randomInstances = list(instances[ problem ])
# Half is for generation and half for validation
numGenInstances = len( randomInstances ) // 2
genInstances = randomInstances[ 0 : numGenInstances ]
random.shuffle( genInstances ) 
#randomInstances = randomInstances[ 0 : instQ ]
genInstances = genInstances[ 0 : instQ ]
str_problem = str_problem + str( lines ) + " " + str( timebound ) + " " + str( instQ )
#for i in randomInstances :
for i in genInstances :
   str_problem = str_problem + " domains/" + domains[ problem ] + "/" + problems[ problem ] + "/" + i
str_problem = str_problem + "\n"

# test
#1 600 domains/pointers/find/find30.pddl
str_problem = str_problem + str( len( instances[ problem ] ) ) + " " + str( timebound )
for i in instances[ problem ] :
   str_problem = str_problem + " domains/" + domains[ problem ] + "/" + problems[ problem ] + "/" + i
str_problem = str_problem + "\n"

str_problem = str_problem + "0\n0\n1 1\n0 0 0"

f_problem=open( problems[ problem ] + "_" + str( instQ ) + letter + ".txt","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
