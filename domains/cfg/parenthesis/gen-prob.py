import sys, random

indexs = int(sys.argv[1])
print("(define (problem p"+str(indexs)+")")
print(" (:domain parenthesis)")
objects = " (:objects"
for i in range(0,indexs+1):
	objects = objects + " i" + str(i)
objects += " - index )"
print(objects)
print(" (:init")
print("   (at i0)")
for i in range(0,indexs):
	print("   (adjacent i"+str(i) + " i"+str(i+1) +")")
l = ["lpar","rpar"]
while len(l) < indexs:
	pos = random.randint(0, len(l)-1)
	l.insert(pos,"rpar")
	l.insert(pos,"lpar")
for i in range(0,indexs):
	print("   (content i"+str(i)+" "+l[i]+")")
print("   (content i"+str(indexs)+" empty)")
print("   (current-content "+l[ 0 ]+"))")
print(" (:goal (and (at i"+str(indexs)+")))")
print(")")
