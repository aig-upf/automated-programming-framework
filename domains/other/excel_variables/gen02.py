#! /usr/bin/env python
import sys,time,random,string

#**************************************#
# MAIN
#**************************************#
string_size = 6

str_problem=""
str_problem=str_problem + "(DEFINE (PROBLEM EXTRACT-MINUTES-"+time.strftime("%d%m%Y%H%M%S")+")\n"
str_problem=str_problem + "  (:DOMAIN EXCEL)\n"
str_problem=str_problem + "  (:OBJECTS\n\tSPACE HYPH COLON DOT LPAR RPAR - LIMITER\n\tA B C D E F G H I J K L M N O P Q R S T U V W X Y Z N0 N1 N2 N3 N4 N5 N6 N7 N8 N9 - CHAR\n\tSTR - INPUT\n\tRES - OUTPUT\n\tSTR-VAR - INPUT-VARIABLE\n\t"
for idx in xrange( 2, string_size + 2 ):
   str_problem=str_problem + " I" + str( idx )
str_problem = str_problem + " - INDEX \n  )"

str_problem = str_problem + "\n  (:INIT"
str_problem = str_problem + "\n\t( HIINDEX STR I" + str( string_size ) +" )"
str_problem = str_problem + "\n\t( LOINDEX STR I0 )"
str_problem = str_problem + "\n\t( SIZE STR I" + str( string_size ) + " )"
str_problem = str_problem +	"\n\t( SIZE RES I0 )"
str_problem = str_problem + "\n\t( INPUT-ASSIGNMENT STR-VAR STR )"
for idx in xrange( 0, string_size + 1 ):
   str_problem = str_problem + "\n\t( NEXT I" + str( idx ) + " I" + str( idx+1 ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I0 LPAR )"

random.seed()
hour = random.randint(0,9)
minutes = random.randint(0,59)
seconds = random.randint(0,59)

str_problem = str_problem + "\n\t( ASSIGNMENT STR I0 N" + str( hour ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I1 COLON )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I2 N" + str( minutes/10 ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I3 N" + str( minutes%10 ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I4 DOT )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I5 N" + str( seconds/10 ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT STR I6 N" + str( seconds%10 ) + " )"
str_problem = str_problem + "\n  )"

str_problem=str_problem + "\n  (:GOAL"
str_problem = str_problem + "\n\t( AND"
str_problem = str_problem + "\n\t( ASSIGNMENT RES I0 N" + str( minutes/10 ) + " )"
str_problem = str_problem + "\n\t( ASSIGNMENT RES I1 N" + str( minutes%10 ) + " )"
str_problem=str_problem + "\n\t)\n  )\n)"

f_problem=open("new-problem.pddl","w")
f_problem.write(str_problem)
f_problem.close()

sys.exit(0)
