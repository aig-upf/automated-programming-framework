#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   compilation = str(sys.argv[1])
   tp = int(sys.argv[2])
   tn = int(sys.argv[3])
   letter = str(sys.argv[4])
except:
   print "Usage:"
   print sys.argv[0] + " <NEGLITE|NEG> <#positives> <#negatives> <letter>"
   print sys.argv[0] + " NEGLITE 2 1 a"
   sys.exit(-1)

prefix = "domains/neg/gripper/"
positives = ["gripper-1-pos-a","gripper-2-pos-a","gripper-3-pos-a","gripper-4-pos-a"]#,"gripper-5-pos-a"]#,"gripper-6-pos-a","gripper-7-pos-a"]
negatives = ["gripper-1-neg-a","gripper-1-neg-b","gripper-1-neg-c","gripper-1-neg-d","gripper-2-neg-a","gripper-2-neg-b","gripper-2-neg-c","gripper-2-neg-d","gripper-3-neg-a","gripper-3-neg-b","gripper-3-neg-c","gripper-3-neg-d","gripper-4-neg-a","gripper-4-neg-b","gripper-4-neg-c","gripper-4-neg-d"]#,"gripper-5-neg-a","gripper-5-neg-b","gripper-5-neg-c","gripper-5-neg-d"]#,"gripper-6-neg-a","gripper-6-neg-b","gripper-6-neg-c","gripper-6-neg-d","gripper-7-neg-a","gripper-7-neg-b","gripper-7-neg-c","gripper-7-neg-d"]
tests = []
for i in range(5, 22):
   tests.append( "gripper-"+str(i)+"-neg-a" )
   tests.append( "gripper-"+str(i)+"-neg-b" )
   tests.append( "gripper-"+str(i)+"-neg-c" )
   tests.append( "gripper-"+str(i)+"-neg-d" )
   tests.append( "gripper-"+str(i)+"-pos-a" )

str_conf=compilation+"\nbin/compile\n" + prefix + "domain.pddl\ndomain.pddl ins.pddl\n0\n4 600 "
str_conf=str_conf+str(tp)+" "+str(tn) + "\n"

random.shuffle( positives )
random.shuffle( negatives )


for i in xrange( 0, len(positives) ):
   if i < tp :
      str_conf = str_conf + prefix + positives[ i ] + ".pddl\n"
   else :
      tests.append( positives[ i ] )


for i in xrange( 0, len(negatives) ):
   if i < tn :
       str_conf = str_conf + prefix + negatives[ i ] + ".pddl\n"
   else :
      tests.append( negatives[ i ] )

# Adding tests
str_val=""
#str_conf=str_conf+str(len( tests ))+" 600\n"
for t in tests:
   str_val=str_val + "./universal-planning-validator/validator/validate.bin -p " + prefix + "domain.pddl " + prefix + t + ".pddl $1\n"
f_val=open("gripper-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +"-val.sh","w")
f_val.write( str_val )
f_val.close()

str_conf=str_conf+"0 0 0 1 1 0 0 0\n"
#str_conf=str_conf+"0 0 1 1 0 0 0\n"


f_conf=open("gripper-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +".txt","w")
f_conf.write( str_conf )
f_conf.close()

sys.exit(0)

