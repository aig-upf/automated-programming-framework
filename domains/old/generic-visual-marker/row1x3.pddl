(define (problem row3x1b)
	(:domain vmarker)
	(:objects
		block empty green - relation
		v0 v1 v2 v3 - value
		x y xm ym - variable
	)
	(:init 
		(assignment x v0)
		(assignment y v0)
		(assignment xm v1)
		(assignment ym v3)
		(next v0 v1)
		(next v1 v2)
		(next v2 v3)
		(includes-2ary block v0 v0)
		(includes-2ary block v0 v1)
		(includes-2ary block v0 v2)
		
		(includes-2ary green v0 v1)
	)
	(:goal (and
		(assignment x v0)
		(assignment y v1)
	))
)
