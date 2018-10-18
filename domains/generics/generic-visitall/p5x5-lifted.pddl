(define (problem prob5x5)
	(:domain visitall)
	;(:objects v0 v1 v2 v3 v4 - value )
	(:objects v0 v1 v2 v3 - value )
	(:init
		(assignment xpos v0)
		(assignment ypos v0)
		(includes-2ary consec v0 v1)
		(includes-2ary consec v1 v2)
		(includes-2ary consec v2 v3)
		;(includes-2ary consec v3 v4)
		(arity-2 visited)
		(arity-2 consec)
	)
	(:goal (and
		(includes-2ary visited v0 v0)
		(includes-2ary visited v1 v0)
		(includes-2ary visited v2 v0)
		(includes-2ary visited v3 v0)
		;(includes-2ary visited v4 v0)
		(includes-2ary visited v0 v1)
		(includes-2ary visited v1 v1)
		(includes-2ary visited v2 v1)
		(includes-2ary visited v3 v1)
		;(includes-2ary visited v4 v1)
		(includes-2ary visited v0 v2)
		(includes-2ary visited v1 v2)
		(includes-2ary visited v2 v2)
		(includes-2ary visited v3 v2)
		;(includes-2ary visited v4 v2)
		(includes-2ary visited v0 v3)
		(includes-2ary visited v1 v3)
		(includes-2ary visited v2 v3)
		(includes-2ary visited v3 v3)
		;(includes-2ary visited v4 v3)
		;(includes-2ary visited v0 v4)
		;(includes-2ary visited v1 v4)
		;(includes-2ary visited v2 v4)
		;(includes-2ary visited v3 v4)
		;(includes-2ary visited v4 v4)
		
	))
)