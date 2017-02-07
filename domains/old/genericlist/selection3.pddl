(define (problem selection3)
	(:domain genericlist)
	(:objects
		next lessthan - relation
		i1 i2 i3 i4 v1 v2 v3 v4 - value
		iter best tail - variable
	)
	(:init
		(assignment iter i1)
		(pointer iter v4)
		(assignment best i1)
		(pointer best v4)
		(assignment tail i4)
		(vector-assignment i1 v4)
		(vector-assignment i2 v1)
		(vector-assignment i3 v3)
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
		(assignment best i2)
	))
)
