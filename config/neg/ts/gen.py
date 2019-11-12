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

prefix = "domains/neg/ts/"
positives = ["ts-1-pos-a","ts-2-pos-a","ts-3-pos-a","ts-4-pos-a"]#,"ts-5-pos-a"]#,"ts-6-pos-a","ts-7-pos-a"]
negatives = ["ts-1-neg-a","ts-1-neg-b","ts-1-neg-c","ts-1-neg-d","ts-2-neg-a","ts-2-neg-b","ts-2-neg-c","ts-2-neg-d","ts-3-neg-a","ts-3-neg-b","ts-3-neg-c","ts-3-neg-d","ts-4-neg-a","ts-4-neg-b","ts-4-neg-c","ts-4-neg-d"]#,"ts-5-neg-a","ts-5-neg-b","ts-5-neg-c","ts-5-neg-d"]#,"ts-6-neg-a","ts-6-neg-b","ts-6-neg-c","ts-6-neg-d","ts-7-neg-a","ts-7-neg-b","ts-7-neg-c","ts-7-neg-d"]
tests = []
for i in range(5, 22):
   tests.append( "ts-"+str(i)+"-neg-a" )
   tests.append( "ts-"+str(i)+"-neg-b" )
   tests.append( "ts-"+str(i)+"-neg-c" )
   tests.append( "ts-"+str(i)+"-neg-d" )
   tests.append( "ts-"+str(i)+"-pos-a" )

str_conf=compilation+"\nbin/compile\n" + prefix + "domain.pddl\ndomain.pddl ins.pddl\n0\n3 600 "
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
f_val=open("ts-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +"-val.sh","w")
f_val.write( str_val )
f_val.close()

str_conf=str_conf+"0 0 0 1 1 0 0 0\n"
#str_conf=str_conf+"0 0 1 1 0 0 0\n"


f_conf=open("ts-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +".txt","w")
f_conf.write( str_conf )
f_conf.close()

sys.exit(0)

