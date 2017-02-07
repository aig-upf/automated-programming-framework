(define (problem hallA4)
	(:domain programming)
	(:objects
		next visited - relation
		v0 v1 v2 v3 - value
		x y xm ym - variable
	)
	(:init
		(assignment x v2)
		(assignment y v2)
		(assignment xm v3)
		(assignment ym v3)
		(ordinal-2ary next)
		(achievable-2ary visited x y)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
	)
	(:goal (and
		(includes-2ary visited v0 v0)
		(includes-2ary visited v3 v0)
		(includes-2ary visited v3 v3)
		(includes-2ary visited v0 v3)
	))
)
