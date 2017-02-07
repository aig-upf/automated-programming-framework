#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   ncols = int(sys.argv[1])
   nrows = int(sys.argv[2])   
except:
   print "Usage:"
   print sys.argv[0] + " <ncols> <nrows>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(ncols)+"x"+str(nrows)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain visual-marker)\n"
str_problem=str_problem + "  (:objects "

for j in range(0,ncols):
   str_problem=str_problem + "x"+str(j)+" "
str_problem=str_problem + "- xpos "

for j in range(0,nrows):
   str_problem=str_problem + "y"+str(j)+" "
str_problem=str_problem + "- ypos "

str_problem=str_problem + ")\n"


str_problem=str_problem + "  (:init "
str_problem=str_problem + "(agent-x x0) "
str_problem=str_problem + "(agent-y y0) "
str_problem=str_problem + "(xmax x" + str(ncols-1) + ")"
str_problem=str_problem + "(ymax y" + str(nrows-1) + ")"
 
for j in range(0,ncols-1):
   str_problem=str_problem + "(suc-x x"+str(j)+" x"+str(j+1)+")"
for j in range(0,nrows-1):
   str_problem=str_problem + "(suc-y y"+str(j)+" y"+str(j+1)+")"

blocks=[]
random.seed()
for j in range(0,ncols):
   blocks.append(random.randint(0,nrows))

for i in range(0,ncols):
    for j in range(0,blocks[i]):
        str_problem=str_problem + "(block x"+str(i)+" y"+str(j)+")"

str_blocks = [i for i in str_problem.split(")(") if "block " in i]

if len(str_blocks)>1:
    str_problem=str_problem + "("+str_blocks[random.randint(0,len(str_blocks)-1)].replace("(","").replace(")","").replace("block","green")+")"
elif len(str_blocks)>0:    
    str_problem=str_problem + "("+str_blocks[0].replace("(","").replace(")","").replace("block","green")+")"

       
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and (marked))))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
