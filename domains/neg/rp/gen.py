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
str_problem="(define (problem rp"+str(nvalue)+posneg[int(isPos)]+"-"+letter+")\n"
str_problem=str_problem + "  (:domain robopainter)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,nvalue+1):
   str_problem=str_problem + "i"+str(j)+" "
str_problem=str_problem + "- index)\n"

str_problem=str_problem + "  (:init (at i0)(last i"+str(nvalue)+")"

for i in range(0,nvalue):
   str_problem = str_problem+"(adjacent i"+str(i)+" i"+str(i+1)+")"
   str_problem = str_problem+"(white-cell i"+str(i)+")"
str_problem=str_problem + ")\n"

# Run for negative instances



str_problem=str_problem + "(:goal (and  (at i"+str(nvalue)+") "

black = [  i%2 for i in range( 0, nvalue) ]

while (not isPos) :
   ok = False
   for i in range( 0, nvalue ):
      black[ i ] = random.randint(0,1)
      if( black[ i ] != (i%2) ):
         ok = True
   if ok == True:
      break

for i in range(0,nvalue):
   if black[ i ] == 1 :
      str_problem = str_problem+"(painted-black i"+str(i)+")"
   else:
      str_problem = str_problem+"(white-cell i"+str(i)+")"

str_problem=str_problem + "  )))\n"

f_problem=open("rp-"+ str(nvalue) + posneg[int(isPos)] +"-"+letter+ ".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
