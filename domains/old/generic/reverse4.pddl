(define (problem reverse4)
	(:domain programming)
	(:objects
		next - relation
		v0 v1 v2 v3 - value
		i j - variable
	)
	(:init
		(assignment i v0)
		(assignment j v3)
		(vector-assignment v0 v1)
		(vector-assignment v1 v0)
		(vector-assignment v2 v3)
		(vector-assignment v3 v2)
		(ordinal-2ary next)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
	)
	(:goal (and
		(vector-assignment v0 v2)
		(vector-assignment v1 v3)
		(vector-assignment v2 v0)
		(vector-assignment v3 v1)
	))
)
