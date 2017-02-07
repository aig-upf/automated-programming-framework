(define (problem summatory2)
	(:domain programming)
	(:objects
		next sum - relation
		v0 v1 v2 v3 - value
		a b - variable
	)
	(:init
		(assignment a v0)
		(assignment b v2)
		(ordinal-2ary next)
		(ordinal-3ary sum)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
		(includes-3ary sum v0 v0 v0)
		(includes-3ary sum v0 v1 v1)
		(includes-3ary sum v0 v2 v2)
		(includes-3ary sum v0 v3 v3)
		(includes-3ary sum v1 v0 v1)
		(includes-3ary sum v1 v1 v2)
		(includes-3ary sum v1 v2 v3)
		(includes-3ary sum v2 v0 v2)
		(includes-3ary sum v2 v1 v3)
		(includes-3ary sum v3 v0 v3)
	)
	(:goal (and
		(assignment a v3)
		(assignment b v0)
	))
)
