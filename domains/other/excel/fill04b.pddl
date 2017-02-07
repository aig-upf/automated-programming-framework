(define (problem first-last-initial)
(:domain excel)
(:objects
	str - input
	res - output
	a b c d e f g h i j k l m n o p q r s t u v w x y z n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - char
	space hyph colon dot lpar rpar - limiter
	i2 i3 i4 i5 i6 i7 - index
)
(:init
	(assignment str i0 j)
	(assignment str i1 a)
	(assignment str i2 n)
	(assignment str i3 e)
	(assignment str i4 space)
	(assignment str i5 h)
	(assignment str i6 u)
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
	(assignment res i0 j)
	(assignment res i1 a)
	(assignment res i2 n)
	(assignment res i3 e)
	(assignment res i4 space)
	(assignment res i5 h)
	(size res i6)
))
)
