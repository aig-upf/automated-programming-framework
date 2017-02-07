(define (problem visualm2x4)
	(:domain programming)
	(:objects
		; block not really necessary!
		block empty green next - relation
		v0 v1 v2 v3 v4 - value
		x y xm ym - variable
	)
	(:init 
		(assignment x v0)
		(assignment y v0)
		(assignment xm v4)
		(assignment ym v1)
		(ordinal-2ary next)
		(conditional-2ary block)
		(conditional-2ary green)
		(conditional-2ary empty)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
		(includes-2ary next v3 v4)
		(includes-2ary block v0 v0)
		(includes-2ary block v1 v0)
		(includes-2ary block v2 v0)
		(includes-2ary block v3 v0)
		(includes-2ary green v3 v0)
	)
	(:goal (and
		(assignment x v3)
		(assignment y v0)
	))
)
