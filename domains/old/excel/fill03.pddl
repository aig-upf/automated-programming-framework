(define (problem reverse)
(:domain excel)
(:objects
	str - input
	res - output
	a b c d e f g h i j k l m n o p q r s t u v w x y z n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - char
	space hyph colon dot lpar rpar - limiter
	i2 i3 i4 i5 i6 - index
)
(:init
	(assignment str i0 h)
	(assignment str i1 i)
	(assignment str i2 space)
	(assignment str i3 h)
	(assignment str i4 o)

	(loindex str i0)
	(hiindex str i5)
	(size str i5)
	(size res i0)

	(next i0 i1)
	(next i1 i2)
	(next i2 i3)
	(next i3 i4)
	(next i4 i5)
	(next i5 i6)
)
(:goal (and
	(assignment res i0 h)
	(assignment res i1 o)
	(assignment res i2 space)
	(assignment res i3 h)
	(assignment res i4 i)
))
)
