#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
   nrows = int(sys.argv[1])
   ncols = int(sys.argv[2])
   modex = sys.argv[3]
   modey = sys.argv[4]   
except:
   print "Usage:"
   print sys.argv[0] + " <nrows> <ncols> <modex(a|b)> <modey(a|b)>"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(nrows)+"x"+str(ncols)+str(modex)+str(modey)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain grid)\n"
str_problem=str_problem + "  (:objects "

nsize = max(nrows,ncols)
for j in range(0,nsize):
   str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value "

str_problem=str_problem + ")\n"


str_problem=str_problem + "  (:init "
random.seed()
if modex =="a":
    x_i=random.randint(0, ncols-1)
    time.sleep(0.1)
    x_g=random.randint(x_i, ncols-1)
if modex =="b":
    x_g=random.randint(0, ncols-1)
    time.sleep(0.1)
    x_i=random.randint(x_g, ncols-1)    
if modey =="a":
    y_i=random.randint(0, nrows-1)
    time.sleep(0.1)    
    y_g=random.randint(y_i, nrows-1)
if modey =="b":
    y_g=random.randint(0, nrows-1)
    time.sleep(0.1)
    y_i=random.randint(y_g, nrows-1)        

str_problem=str_problem + " (xpos v" + str(x_i) + ")"
str_problem=str_problem + " (ypos v" + str(y_i) + ")"
str_problem=str_problem + " (xgoal v" + str(x_g) + ")"
str_problem=str_problem + " (ygoal v" + str(y_g) + ")"

for j in range(0,nsize-1):
   str_problem=str_problem + "(consec v"+str(j)+" v"+str(j+1)+")"   
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and "
str_problem=str_problem + " (xpos v" + str(x_g) + ")"
str_problem=str_problem + " (ypos v" + str(y_g) + ")"

str_problem=str_problem + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
