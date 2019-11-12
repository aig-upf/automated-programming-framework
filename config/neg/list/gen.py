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

prefix = "domains/neg/list/"
positives = ["list-1-pos-a","list-2-pos-a","list-3-pos-a","list-4-pos-a","list-5-pos-a","list-6-pos-a","list-7-pos-a"]
negatives = ["list-1-neg-a","list-1-neg-b","list-1-neg-c","list-1-neg-d","list-2-neg-a","list-2-neg-b","list-2-neg-c","list-2-neg-d","list-3-neg-a","list-3-neg-b","list-3-neg-c","list-3-neg-d","list-4-neg-a","list-4-neg-b","list-4-neg-c","list-4-neg-d","list-5-neg-a","list-5-neg-b","list-5-neg-c","list-5-neg-d","list-6-neg-a","list-6-neg-b","list-6-neg-c","list-6-neg-d","list-7-neg-a","list-7-neg-b","list-7-neg-c","list-7-neg-d"]
tests = []
for i in range(8, 22):
   tests.append( "list-"+str(i)+"-neg-a" )
   tests.append( "list-"+str(i)+"-neg-b" )
   tests.append( "list-"+str(i)+"-neg-c" )
   tests.append( "list-"+str(i)+"-neg-d" )
   tests.append( "list-"+str(i)+"-pos-a" )

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
f_val=open("list-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +"-val.sh","w")
f_val.write( str_val )
f_val.close()

str_conf=str_conf+"0 0 0 1 1 0 0 0\n"
#str_conf=str_conf+"0 0 1 1 0 0 0\n"


f_conf=open("list-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +".txt","w")
f_conf.write( str_conf )
f_conf.close()

sys.exit(0)

