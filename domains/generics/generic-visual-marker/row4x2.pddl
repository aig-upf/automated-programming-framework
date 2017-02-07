(define (problem row4x2)
	(:domain vmarker)
	(:objects
		block empty green - relation
		v0 v1 v2 v3 v4 - value
		x y xm ym - variable
	)
	(:init 
		(assignment x v0)
		(assignment y v0)
		(assignment xm v4)
		(assignment ym v2)
		(next v0 v1)
		(next v1 v2)
		(next v2 v3)
		(next v3 v4)
		(includes-2ary block v0 v0)
		(includes-2ary block v1 v0)
		(includes-2ary block v2 v0)
		(includes-2ary green v2 v0)
		(includes-2ary empty v3 v0)
		(includes-2ary block v0 v1)
		(includes-2ary block v1 v1)
		(includes-2ary empty v2 v1)
		(includes-2ary empty v3 v1)
	)
	(:goal (and
		(assignment x v2)
		(assignment y v0)
	))
)
