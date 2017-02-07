(define (problem reverse)
(:domain excel)
(:objects
	str str2 - input
	res - output
	a b c d e f g h i j k l m n o p q r s t u v w x y z n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - char
	space hyph colon dot lpar rpar - limiter
	i2 i3 i4 i5 i6 i7 - index
)
(:init
	(assignment str i0 b)
	(assignment str i1 o)
	(assignment str i2 b)
	(loindex str i0)
	(hiindex str i3)
	(size str i3)

	(assignment str2 i0 d)
	(assignment str2 i1 o)
	(assignment str2 i2 e)
	(loindex str2 i0)
	(hiindex str2 i3)
	(size str2 i3)

	(size res i0)

	(next i0 i1)
	(next i1 i2)
	(next i2 i3)
	(next i3 i4)
	(next i4 i5)
	(next i5 i6)
	(next i6 i7)
)
(:goal (and
	(assignment res i0 d)
	(assignment res i1 o)
	(assignment res i2 e)
	(assignment res i3 space)
	(assignment res i4 b)
	(assignment res i5 o)
	(assignment res i6 b)
))
)
