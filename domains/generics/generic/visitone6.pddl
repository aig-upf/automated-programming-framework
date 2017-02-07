(define (problem visitone6)
	(:domain programming)
	(:objects
		next - relation
		v0 v1 v2 v3 v4 v5 - value
		x y xg yg - variable
	)
	(:init
		(assignment x v2)
		(assignment y v4)
		(assignment xg v5)
		(assignment yg v2)
		(ordinal-2ary next)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
		(includes-2ary next v3 v4)
		(includes-2ary next v4 v5)
	)
	(:goal (and
		(assignment x v5)
		(assignment y v2)
	))
)
