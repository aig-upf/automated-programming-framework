(define (problem visitone4)
	(:domain programming)
	(:objects
		next - relation
		v0 v1 v2 v3 - value
		x y xg yg - variable
	)
	(:init
		(assignment x v0)
		(assignment y v0)
		(assignment xg v3)
		(assignment yg v2)
		(ordinal-2ary next)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
	)
	(:goal (and
		(assignment x v3)
		(assignment y v2)
	))
)
