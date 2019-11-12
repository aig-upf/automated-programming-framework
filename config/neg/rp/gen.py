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

prefix = "domains/neg/rp/"
positives = ["rp-1-pos-a","rp-2-pos-a","rp-3-pos-a","rp-4-pos-a","rp-5-pos-a","rp-6-pos-a","rp-7-pos-a","rp-8-pos-a"]
negatives = ["rp-1-neg-a","rp-1-neg-b","rp-1-neg-c","rp-1-neg-d","rp-2-neg-a","rp-2-neg-b","rp-2-neg-c","rp-2-neg-d","rp-3-neg-a","rp-3-neg-b","rp-3-neg-c","rp-3-neg-d","rp-4-neg-a","rp-4-neg-b","rp-4-neg-c","rp-4-neg-d","rp-5-neg-a","rp-5-neg-b","rp-5-neg-c","rp-5-neg-d","rp-6-neg-a","rp-6-neg-b","rp-6-neg-c","rp-6-neg-d","rp-7-neg-a","rp-7-neg-b","rp-7-neg-c","rp-7-neg-d","rp-8-neg-a","rp-8-neg-b","rp-8-neg-c","rp-8-neg-d"]
tests = []
for i in range(9, 22):
   tests.append( "rp-"+str(i)+"-neg-a" )
   tests.append( "rp-"+str(i)+"-neg-b" )
   tests.append( "rp-"+str(i)+"-neg-c" )
   tests.append( "rp-"+str(i)+"-neg-d" )
   tests.append( "rp-"+str(i)+"-pos-a" )

str_conf=compilation+"\nbin/compile\n" + prefix + "domain.pddl\ndomain.pddl ins.pddl\n0\n5 600 "
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
f_val=open("rp-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +"-val.sh","w")
f_val.write( str_val )
f_val.close()

str_conf=str_conf+"0 0 0 1 1 0 0 0\n"
#str_conf=str_conf+"0 0 1 1 0 0 0\n"


f_conf=open("rp-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +".txt","w")
f_conf.write( str_conf )
f_conf.close()

sys.exit(0)

