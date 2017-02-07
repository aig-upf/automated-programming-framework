(define (problem hallA5)
	(:domain programming)
	(:objects
		next visited - relation
		v0 v1 v2 v3 v4 - value
		x y xm ym - variable
	)
	(:init
		(assignment x v4)
		(assignment y v0)
		(assignment xm v4)
		(assignment ym v4)
		(ordinal-2ary next)
		(achievable-2ary visited x y)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
		(includes-2ary next v3 v4)
	)
	(:goal (and
		(includes-2ary visited v0 v0)
		(includes-2ary visited v4 v0)
		(includes-2ary visited v4 v4)
		(includes-2ary visited v0 v4)
	))
)
