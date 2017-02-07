#! /usr/bin/env python
import sys,time,random

#**************************************#
# MAIN
#**************************************#
try:
	nrows = int(sys.argv[1])
	ncols = int(sys.argv[2])
	mode  = int(sys.argv[3])
except:
	print "Usage:"
	print sys.argv[0] + " <nrows> <ncols> <mode(0...15)>"
	sys.exit(-1)

str_problem=""
str_problem=str_problem + "(define (problem p"+str(nrows)+"x"+str(ncols)+"-"+str(mode)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:domain 4corners)\n"
str_problem=str_problem + "  (:objects "

nsize = max(nrows,ncols)
for j in range(0,nsize):
	str_problem=str_problem + "v"+str(j)+" "
str_problem=str_problem + "- value "

str_problem=str_problem + ")\n"

random.seed()

x_i=random.randint(0, ncols-1)
y_i=random.randint(0, nrows-1)
m1 = mode&1
m2 = mode&2
m4 = mode&4
m8 = mode&8

str_problem=str_problem + "  (:init (xpos v"+str(x_i)+")(ypos v"+str(y_i)+")(xmin v0)(ymin v0)(xmax v" + str(ncols-1) + ")(ymax v" + str(nrows-1) + ") "
str_goals = ""

if m1 == 1 :
	str_goals = str_goals + " (visited v0 v0) "

if m2 == 2 :
	str_goals = str_goals + " (visited v" + str(ncols-1) + " v0) "

if m4 == 4 :
	str_goals = str_goals + " (visited v" + str(ncols-1) + " v" + str(nrows-1) + ") "

if m8 == 8 :
	str_goals = str_goals + " (visited v0 v" + str(ncols-1) + ") "

for j in range(0,nsize-1):
	str_problem=str_problem + "(consec v"+str(j)+" v"+str(j+1)+")"   
str_problem=str_problem + ")\n"

str_problem=str_problem + "  (:goal (and " + str_goals + ")))\n"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
