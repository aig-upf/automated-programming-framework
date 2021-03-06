(define (problem prob10x10)
	(:domain visitall)
	(:objects v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 - value )
	(:init
		(assignment xpos v0)
		(assignment ypos v0)
		(includes-2ary consec v0 v1)
		(includes-2ary consec v1 v2)
		(includes-2ary consec v2 v3)
		(includes-2ary consec v3 v4)
		(includes-2ary consec v4 v5)
		(includes-2ary consec v5 v6)
		(includes-2ary consec v6 v7)
		(includes-2ary consec v7 v8)
		(includes-2ary consec v8 v9)
		(arity-2 visited)
		(arity-2 consec)
	)
	(:goal (and
		(includes-2ary visited v0 v0)
		(includes-2ary visited v1 v0)
		(includes-2ary visited v2 v0)
		(includes-2ary visited v3 v0)
		(includes-2ary visited v4 v0)
		(includes-2ary visited v5 v0)
		(includes-2ary visited v6 v0)
		(includes-2ary visited v7 v0)
		(includes-2ary visited v8 v0)
		(includes-2ary visited v9 v0)
		(includes-2ary visited v0 v1)
		(includes-2ary visited v1 v1)
		(includes-2ary visited v2 v1)
		(includes-2ary visited v3 v1)
		(includes-2ary visited v4 v1)
		(includes-2ary visited v5 v1)
		(includes-2ary visited v6 v1)
		(includes-2ary visited v7 v1)
		(includes-2ary visited v8 v1)
		(includes-2ary visited v9 v1)
		(includes-2ary visited v0 v2)
		(includes-2ary visited v1 v2)
		(includes-2ary visited v2 v2)
		(includes-2ary visited v3 v2)
		(includes-2ary visited v4 v2)
		(includes-2ary visited v5 v2)
		(includes-2ary visited v6 v2)
		(includes-2ary visited v7 v2)
		(includes-2ary visited v8 v2)
		(includes-2ary visited v9 v2)
		(includes-2ary visited v0 v3)
		(includes-2ary visited v1 v3)
		(includes-2ary visited v2 v3)
		(includes-2ary visited v3 v3)
		(includes-2ary visited v4 v3)
		(includes-2ary visited v5 v3)
		(includes-2ary visited v6 v3)
		(includes-2ary visited v7 v3)
		(includes-2ary visited v8 v3)
		(includes-2ary visited v9 v3)
		(includes-2ary visited v0 v4)
		(includes-2ary visited v1 v4)
		(includes-2ary visited v2 v4)
		(includes-2ary visited v3 v4)
		(includes-2ary visited v4 v4)
		(includes-2ary visited v5 v4)
		(includes-2ary visited v6 v4)
		(includes-2ary visited v7 v4)
		(includes-2ary visited v8 v4)
		(includes-2ary visited v9 v4)
		(includes-2ary visited v0 v5)
		(includes-2ary visited v1 v5)
		(includes-2ary visited v2 v5)
		(includes-2ary visited v3 v5)
		(includes-2ary visited v4 v5)
		(includes-2ary visited v5 v5)
		(includes-2ary visited v6 v5)
		(includes-2ary visited v7 v5)
		(includes-2ary visited v8 v5)
		(includes-2ary visited v9 v5)
		(includes-2ary visited v0 v6)
		(includes-2ary visited v1 v6)
		(includes-2ary visited v2 v6)
		(includes-2ary visited v3 v6)
		(includes-2ary visited v4 v6)
		(includes-2ary visited v5 v6)
		(includes-2ary visited v6 v6)
		(includes-2ary visited v7 v6)
		(includes-2ary visited v8 v6)
		(includes-2ary visited v9 v6)
		(includes-2ary visited v0 v7)
		(includes-2ary visited v1 v7)
		(includes-2ary visited v2 v7)
		(includes-2ary visited v3 v7)
		(includes-2ary visited v4 v7)
		(includes-2ary visited v5 v7)
		(includes-2ary visited v6 v7)
		(includes-2ary visited v7 v7)
		(includes-2ary visited v8 v7)
		(includes-2ary visited v9 v7)
		(includes-2ary visited v0 v8)
		(includes-2ary visited v1 v8)
		(includes-2ary visited v2 v8)
		(includes-2ary visited v3 v8)
		(includes-2ary visited v4 v8)
		(includes-2ary visited v5 v8)
		(includes-2ary visited v6 v8)
		(includes-2ary visited v7 v8)
		(includes-2ary visited v8 v8)
		(includes-2ary visited v9 v8)
		(includes-2ary visited v0 v9)
		(includes-2ary visited v1 v9)
		(includes-2ary visited v2 v9)
		(includes-2ary visited v3 v9)
		(includes-2ary visited v4 v9)
		(includes-2ary visited v5 v9)
		(includes-2ary visited v6 v9)
		(includes-2ary visited v7 v9)
		(includes-2ary visited v8 v9)
		(includes-2ary visited v9 v9)
		
	))
)
