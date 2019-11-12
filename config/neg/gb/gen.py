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

prefix = "domains/neg/gb/"
positives = ["gb-2-pos-a","gb-3-pos-a","gb-4-pos-a","gb-5-pos-a","gb-6-pos-a"]#,"gb-7-pos-a"]
negatives = ["gb-2-neg-a","gb-2-neg-b","gb-2-neg-c","gb-2-neg-d","gb-3-neg-a","gb-3-neg-b","gb-3-neg-c","gb-3-neg-d","gb-4-neg-a","gb-4-neg-b","gb-4-neg-c","gb-4-neg-d","gb-5-neg-a","gb-5-neg-b","gb-5-neg-c","gb-5-neg-d","gb-6-neg-a","gb-6-neg-b","gb-6-neg-c","gb-6-neg-d"]#,"gb-7-neg-a","gb-7-neg-b","gb-7-neg-c","gb-7-neg-d"]
tests = []

for i in range(7, 22):
   tests.append( "gb-"+str(i)+"-neg-a" )
   tests.append( "gb-"+str(i)+"-neg-b" )
   tests.append( "gb-"+str(i)+"-neg-c" )
   tests.append( "gb-"+str(i)+"-neg-d" )
   tests.append( "gb-"+str(i)+"-pos-a" )

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
f_val=open("gb-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +"-val.sh","w")
f_val.write( str_val )
f_val.close()

str_conf=str_conf+"0 0 0 1 1 0 0 0\n"
#str_conf=str_conf+"0 0 1 1 0 0 0\n"


f_conf=open("gb-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +".txt","w")
f_conf.write( str_conf )
f_conf.close()

sys.exit(0)

