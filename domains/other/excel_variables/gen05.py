#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
try:
   name_size = int( sys.argv[ 1 ] )
   surname_size = int( sys.argv[ 2 ] )
except:
   print "Usage:"
   print sys.argv[ 0 ] + " <name_size> <surname_size>"
   print sys.argv[ 0 ] + " 3 4"
   sys.exit(-1)

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM INITIALS-"+str(name_size)+"-"+str(surname_size)+"-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:DOMAIN EXCEL)\n"
str_problem=str_problem + "  (:OBJECTS\n\tSPACE HYPH COLON DOT LPAR RPAR - LIMITER\n\tA B C D E F G H I J K L M N O P Q R S T U V W X Y Z N0 N1 N2 N3 N4 N5 N6 N7 N8 N9 - CHAR\n\tSTR STR2 - INPUT\n\tRES - OUTPUT\n\tSTR-VAR STR2-VAR - INPUT-VARIABLE\n\t"

for idx in xrange( 2, name_size + surname_size + 2 ):
   str_problem=str_problem + " I" + str( idx )
str_problem = str_problem + " - INDEX \n  )"

str_problem = str_problem + "\n  (:INIT"
str_problem = str_problem + "\n\t( HIINDEX STR I" + str( name_size ) +" )"
str_problem = str_problem + "\n\t( LOINDEX STR I0 )"
str_problem = str_problem + "\n\t( HIINDEX STR2 I" + str( surname_size ) +" )"
str_problem = str_problem + "\n\t( LOINDEX STR2 I0 )"
str_problem = str_problem + "\n\t( SIZE STR I" + str( name_size ) + " )"
str_problem = str_problem + "\n\t( SIZE STR2 I" + str( surname_size ) + " )"
str_problem = str_problem +	"\n\t( SIZE RES I0 )"
str_problem = str_problem + "\n\t( INPUT-ASSIGNMENT STR-VAR STR )"
str_problem = str_problem + "\n\t( INPUT-ASSIGNMENT STR2-VAR STR2 )"
for idx in xrange( 0, name_size + surname_size + 1 ):
   str_problem = str_problem + "\n\t( NEXT I" + str( idx ) + " I" + str( idx+1 ) + " )"

random.seed()
generated_str = []
for idx in xrange( 0, name_size ):
   generated_str.append( random.choice( string.ascii_uppercase ) )
   str_problem = str_problem + "\n\t( ASSIGNMENT STR I" + str( idx ) + " " + generated_str[ idx ] + " )"
generated_str2 = []
for idx in xrange( 0, surname_size ):
   generated_str2.append( random.choice( string.ascii_uppercase ) )
   str_problem = str_problem + "\n\t( ASSIGNMENT STR2 I" + str( idx ) + " " + generated_str2[ idx ] + " )"
str_problem = str_problem + "\n  )"

str_problem=str_problem + "\n  (:GOAL"
str_problem = str_problem + "\n\t( AND"
for idx in xrange( 0, 1 ):
   str_problem = str_problem + "\n\t( ASSIGNMENT RES I" + str( idx ) + " " + str( generated_str[ idx ] ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT RES I1 SPACE )"
for idx in xrange( 0, 1 ):
   str_problem = str_problem + "\n\t( ASSIGNMENT RES I" + str( 2 + idx ) + " " + str( generated_str2[ idx ] ) + " )"
str_problem = str_problem + "\n\t( SIZE RES I3 )"
str_problem=str_problem + "\n\t)\n  )\n)"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
