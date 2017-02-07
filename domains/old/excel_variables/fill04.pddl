(define (problem first-last-initial)
(:domain excel)
(:objects
	var - variable
	str - input
	res - output
	a b c d e f g h i j k l m n o p q r s t u v w x y z n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - char
	space hyph colon dot lpar rpar - limiter
	i2 i3 i4 i5 i6 i7 - index
)
(:init
	(variable-assignment var str)
	(assignment str i0 b)
	(assignment str i1 o)
	(assignment str i2 b)
	(assignment str i3 space)
	(assignment str i4 d)
	(assignment str i5 o)
	(assignment str i6 e)
	(loindex str i0)
	(hiindex str i7)
	(size str i7)

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
	(assignment res i0 b)
	(assignment res i1 o)
	(assignment res i2 b)
	(assignment res i3 space)
	(assignment res i4 d)
	(size res i5)
))
)
