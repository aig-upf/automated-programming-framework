(define (problem hallA5x5)
	(:domain hallA)
	(:objects v0 v1 v2 v3 v4 v5 - value )
	(:init
		(assignment xpos v4)
		(assignment ypos v0)
		(includes-2ary consec v0 v1)
		(includes-2ary consec v1 v2)
		(includes-2ary consec v2 v3)
		(includes-2ary consec v3 v4)
		(includes-2ary consec v4 v5)
		;(includes-2ary consec v5 v6)
		;(includes-2ary consec v6 v7)
		;(includes-2ary consec v7 v8)
		;(includes-2ary consec v8 v9)
		(arity-2 visited)
		(arity-2 consec)

		(includes-2ary notvisited v0 v0)
		(includes-2ary notvisited v1 v0)
		(includes-2ary notvisited v2 v0)
		(includes-2ary notvisited v3 v0)
		(includes-2ary notvisited v4 v0)
		(includes-2ary notvisited v5 v0)
		(includes-2ary notvisited v0 v1)
		(includes-2ary notvisited v1 v1)
		(includes-2ary notvisited v2 v1)
		(includes-2ary notvisited v3 v1)
		(includes-2ary notvisited v4 v1)
		(includes-2ary notvisited v5 v1)
		(includes-2ary notvisited v0 v2)
		(includes-2ary notvisited v1 v2)
		(includes-2ary notvisited v2 v2)
		(includes-2ary notvisited v3 v2)
		(includes-2ary notvisited v4 v2)
		(includes-2ary notvisited v5 v2)
		(includes-2ary notvisited v0 v3)
		(includes-2ary notvisited v1 v3)
		(includes-2ary notvisited v2 v3)
		(includes-2ary notvisited v3 v3)
		(includes-2ary notvisited v4 v3)
		(includes-2ary notvisited v5 v3)
		(includes-2ary notvisited v0 v4)
		(includes-2ary notvisited v1 v4)
		(includes-2ary notvisited v2 v4)
		(includes-2ary notvisited v3 v4)
		(includes-2ary notvisited v4 v4)
		(includes-2ary notvisited v5 v4)
		(includes-2ary notvisited v0 v5)
		(includes-2ary notvisited v1 v5)
		(includes-2ary notvisited v2 v5)
		(includes-2ary notvisited v3 v5)
		(includes-2ary notvisited v4 v5)
		(includes-2ary notvisited v5 v5)
	)
	(:goal (and
		(includes-2ary visited v0 v0)
		(includes-2ary notvisited v1 v0)
		(includes-2ary notvisited v2 v0)
		(includes-2ary notvisited v3 v0)
		(includes-2ary notvisited v4 v0)
		(includes-2ary visited v5 v0)
		(includes-2ary notvisited v0 v1)
		(includes-2ary notvisited v1 v1)
		(includes-2ary notvisited v2 v1)
		(includes-2ary notvisited v3 v1)
		(includes-2ary notvisited v4 v1)
		(includes-2ary notvisited v5 v1)
		(includes-2ary notvisited v0 v2)
		(includes-2ary notvisited v1 v2)
		(includes-2ary notvisited v2 v2)
		(includes-2ary notvisited v3 v2)
		(includes-2ary notvisited v4 v2)
		(includes-2ary notvisited v5 v2)
		(includes-2ary notvisited v0 v3)
		(includes-2ary notvisited v1 v3)
		(includes-2ary notvisited v2 v3)
		(includes-2ary notvisited v3 v3)
		(includes-2ary notvisited v4 v3)
		(includes-2ary notvisited v5 v3)
		(includes-2ary notvisited v0 v4)
		(includes-2ary notvisited v1 v4)
		(includes-2ary notvisited v2 v4)
		(includes-2ary notvisited v3 v4)
		(includes-2ary notvisited v4 v4)
		(includes-2ary notvisited v5 v4)
		(includes-2ary visited v0 v5)
		(includes-2ary notvisited v1 v5)
		(includes-2ary notvisited v2 v5)
		(includes-2ary notvisited v3 v5)
		(includes-2ary notvisited v4 v5)
		(includes-2ary visited v5 v5)
		
	))
)
