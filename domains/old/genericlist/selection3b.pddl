(define (problem selection3b)
	(:domain genericlist)
	(:objects
		next lessthan - relation
		i1 i2 i3 i4 v1 v2 v3 v4 - value
		iter best tail - variable
	)
	(:init
		(assignment iter i1)
		(pointer iter v2)
		(assignment best i1)
		(pointer best v2)
		(assignment tail i4)
		(vector-assignment i1 v2)
		(vector-assignment i2 v3)
		(vector-assignment i3 v4)
		(next i1 i2)
		(next i2 i3)
		(next i3 i4)
		(includes lessthan v1 v2)
		(includes lessthan v1 v3)
		(includes lessthan v1 v4)
		(includes lessthan v2 v3)
		(includes lessthan v2 v4)
		(includes lessthan v3 v4)
	)
	(:goal (and
		(assignment best i1)
	))
)
