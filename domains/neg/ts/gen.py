#! /usr/bin/env python
import sys,time,random

def summatory(n):
   return (n*(n+1))/2
   

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
str_problem="(define (problem ts"+str(nvalue)+posneg[int(isPos)]+"-"+letter+")\n"
str_problem=str_problem + "  (:domain variables)\n"
str_problem=str_problem + "  (:objects "

suma = nvalue * (nvalue + 1)/2
for j in range(2,suma+1):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value)\n"

oa = 0
ob = nvalue
osuma = suma
db = 0

# Run for negative instances
while (not isPos) :
   oa = random.randint(0,suma)
   ob = random.randint(0,nvalue)
   osuma = random.randint(0,suma)
   db = random.randint(0,nvalue)
   auxb = ob;
   auxa = oa;
   
   while auxb > db :
      auxa = auxa + auxb
      auxb = auxb - 1;
   if auxa != osuma:
      break

str_problem=str_problem + "  (:init (assignment a v" + str(oa) + ") (assignment b v"+str(ob)+") "

for i in range(0,suma+1):
   for j in range(0,suma+1-i):
      str_problem=str_problem + "(sum v"+str(i)+" v"+str(j)+" v"+str(i+j)+")"            
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and  (assignment a v"+str(osuma)+") (assignment b v" + str(db) + "))))\n"

f_problem=open("ts-"+ str(nvalue) + posneg[int(isPos)] +"-"+letter+ ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
