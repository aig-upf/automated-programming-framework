#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nblocks = int( sys.argv[ 1 ] )
   lettername = sys.argv[ 2 ] 
except:
   print "Usage:"
   print sys.argv[0] + " <nblocks> <letter>"
   print sys.argv[ 0 ] + " 3 a"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p" + str( nblocks ) + "-" + str( lettername ) + ")\n"
str_problem=str_problem + "  (:domain blocks )\n"
str_problem=str_problem + "  (:objects "

for j in xrange(0,nblocks):
   str_problem=str_problem + "b" + str( j + 1 ) + " "
str_problem=str_problem + "- block )\n"

str_problem=str_problem + "  (:init "
str_problem=str_problem + "(clear b1) "
str_problem=str_problem + "(ontable b"+str(nblocks)+") "
 
for j in range(0,nblocks-1):
   str_problem=str_problem + "      ( on b" + str( j + 1 ) + " b" + str( j + 2 ) + " )\n"
str_problem=str_problem + "(empty) "

random.seed()
bgreen = random.randint( 1 , nblocks )
str_problem=str_problem + "(green b" + str( bgreen ) + ") ) \n"

newbgreen = bgreen
while( newbgreen == bgreen ):
   newbgreen = random.randint( 1, nblocks )

str_problem=str_problem + "  (:goal (and (have b" + str( newbgreen ) + "))))\n"

f_problem=open( "pneg-" + str( nblocks ) + "-" + str( lettername ) + ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
