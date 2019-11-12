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

prefix = "domains/neg/fibo/"
positives = ["fibo-1-pos-a","fibo-2-pos-a","fibo-3-pos-a","fibo-4-pos-a"]#,"fibo-5-pos-a"]#,"fibo-6-pos-a","fibo-7-pos-a"]
negatives = ["fibo-1-neg-a","fibo-1-neg-b","fibo-1-neg-c","fibo-1-neg-d","fibo-2-neg-a","fibo-2-neg-b","fibo-2-neg-c","fibo-2-neg-d","fibo-3-neg-a","fibo-3-neg-b","fibo-3-neg-c","fibo-3-neg-d","fibo-4-neg-a","fibo-4-neg-b","fibo-4-neg-c","fibo-4-neg-d"]#,"fibo-5-neg-a","fibo-5-neg-b","fibo-5-neg-c","fibo-5-neg-d"]#,"fibo-6-neg-a","fibo-6-neg-b","fibo-6-neg-c","fibo-6-neg-d","fibo-7-neg-a","fibo-7-neg-b","fibo-7-neg-c","fibo-7-neg-d"]
tests = []
for i in range(5, 14):
   tests.append( "fibo-"+str(i)+"-neg-a" )
   tests.append( "fibo-"+str(i)+"-neg-b" )
   tests.append( "fibo-"+str(i)+"-neg-c" )
   tests.append( "fibo-"+str(i)+"-neg-d" )
   tests.append( "fibo-"+str(i)+"-pos-a" )

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
f_val=open("fibo-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +"-val.sh","w")
f_val.write( str_val )
f_val.close()

str_conf=str_conf+"0 0 0 1 1 0 0 0\n"
#str_conf=str_conf+"0 0 1 1 0 0 0\n"


f_conf=open("fibo-"+ compilation + "-" + str(tp) + "-" + str(tn) + "-" + letter +".txt","w")
f_conf.write( str_conf )
f_conf.close()

sys.exit(0)

