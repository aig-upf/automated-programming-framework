(define (problem reverse5)
	(:domain programming)
	(:objects
		next - relation
		v0 v1 v2 v3 v4 - value
		i j - variable
	)
	(:init
		(assignment i v0)
		(assignment j v4)
		(vector-assignment v0 v2)
		(vector-assignment v1 v3)
		(vector-assignment v2 v4)
		(vector-assignment v3 v0)
		(vector-assignment v4 v1)
		(ordinal-2ary next)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
		(includes-2ary next v3 v4)
	)
	(:goal (and
		(vector-assignment v0 v1)
		(vector-assignment v1 v0)
		(vector-assignment v2 v4)
		(vector-assignment v3 v3)
		(vector-assignment v4 v2)
	))
)
