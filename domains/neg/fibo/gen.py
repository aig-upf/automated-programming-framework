#! /usr/bin/env python
import sys,time,random
  

#**************************************#
# MAIN
#**************************************#
try:
   nvalue = int(sys.argv[1])
   isPosStr = str(sys.argv[2])
   letter = str(sys.argv[3])
except:
   print "Usage:"
   print sys.argv[0] + " <nvalue> <isPositive?> <letter>"
   print sys.argv[0] + " 2 False a"
   sys.exit(-1)

isPos = False
if isPosStr == "True" :
   isPos = True   
posneg = ["-neg","-pos"]
str_problem="(define (problem fibo"+str(nvalue)+posneg[int(isPos)]+"-"+letter+")\n"
str_problem=str_problem + "  (:domain variables)\n"
str_problem=str_problem + "  (:objects "

oa = 1
ob = nvalue
oc = 0
od = 0

da = 1
db = 0
dc = 0
dd = 0

auxvalue = nvalue
while auxvalue > 0 :
   dd = dc
   dc = da
   da = dc + dd
   auxvalue = auxvalue - 1

for j in range(2,da+1):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value)\n"


# Run for negative instances
while (not isPos) :
   oa = random.randint(0,da)
   ob = random.randint(0,nvalue)
   oc = random.randint(0,da)
   od = random.randint(0,da)

   auxda = random.randint(0,da)
   auxdb = random.randint(0,da)
   auxdc = random.randint(0,da)
   auxdd = random.randint(0,nvalue)

   auxa = oa
   auxb = ob
   auxc = oc
   auxd = od

   while auxb > auxdb :
      auxd = auxc
      auxc = auxa
      auxa = auxc + auxd
      auxb = auxb - 1;

   if auxa != auxda or auxc != auxdc or auxd != auxdd:
      da = auxda
      db = auxdb
      dc = auxdc
      dd = auxdd
      break

str_problem=str_problem + "  (:init (assignment a v" + str(oa) + ") (assignment b v"+str(ob)+") (assignment c v"+str(oc)+") (assignment d v"+str(od)+") "

for i in range(0,da+1):
   for j in range(0,da+1-i):
      str_problem=str_problem + "(sum v"+str(i)+" v"+str(j)+" v"+str(i+j)+")"            
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and  (assignment a v" + str(da) + ") (assignment b v"+str(db)+") (assignment c v"+str(dc)+") (assignment d v"+str(dd)+"))))\n"

f_problem=open("fibo-"+ str(nvalue) + posneg[int(isPos)] +"-"+letter+ ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
