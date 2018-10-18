#! /usr/bin/env python
import sys,time

def summatory(n):
   return (n*(n+1))/2
   

#**************************************#
# MAIN
#**************************************#
try:
   nvalue = int(sys.argv[1])
except:
   print "Usage:"
   print sys.argv[0] + " <length>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem ab-regex-"+str(nvalue)+")\n"
str_problem=str_problem + "  (:domain regularExpressions)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,nvalue+1):
   str_problem=str_problem + "i"+str(j)+" "
str_problem=str_problem + "- index)\n"

str_problem=str_problem + "  (:init (at i0)"
if( nvalue == 0 ):
   str_problem=str_problem + "(current-content empty) "
else:
   str_problem=str_problem + "(current-content a)"

for i in range(0,nvalue):
   str_problem = str_problem+"(adjacent i"+str(i)+" i"+str(i+1)+")"
   if ( i % 2 ) == 0 :
      str_problem = str_problem+"(content i"+str(i)+" a)"
   else:
      str_problem = str_problem+"(content i"+str(i)+" b)"
str_problem=str_problem + "(content i"+str(nvalue)+" empty ) )\n"

str_problem=str_problem + "  (:goal (and  (at i"+str(nvalue)+") )))\n"

f_problem=open("p"+ str(nvalue) +".pddl","w")
f_problem.write( str_problem )
f_problem.close()

sys.exit(0)
