import sys, random

indexs = int(sys.argv[1])
print("(define (problem complex-p"+str(indexs)+")")
print(" (:domain complex-parenthesis)")
objects = " (:objects"
for i in range(0,indexs+1):
	objects = objects + " i" + str(i)
objects += " - index )"
print(objects)
print(" (:init")
print("   (at i0)")
for i in range(0,indexs):
	print("   (adjacent i"+str(i) + " i"+str(i+1) +")")
l = ["lpar","rpar","lcubra","rcubra","lsqbra","rsqbra"]
r = []
while len(r) < indexs:
	pos = random.randint(0, 2)
	r.insert(0,l[pos*2])
	r.insert(len(r),l[pos*2+1])
for i in range(0,indexs):
	print("   (content i"+str(i)+" "+r[i]+")")
print("   (content i"+str(indexs)+" empty)")
print("   (current-content "+r[ 0 ]+"))")
print(" (:goal (and (at i"+str(indexs)+")))")
print(")")
