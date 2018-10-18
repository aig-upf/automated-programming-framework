(define (problem fibo4lifted)
	(:domain programming)
	(:objects
		v0 v1 v2 v3 v4 v5 - value
	)
	(:init
		(assignment fn v1)
		(assignment fn1 v0)
		(assignment fn2 v0)
		(assignment iter v4)
		(arity-2 next)
		(arity-3 sum)
		(includes-2ary next v0 v1)
		(includes-2ary next v1 v2)
		(includes-2ary next v2 v3)
		(includes-2ary next v3 v4)
		(includes-2ary next v4 v5)
		(includes-3ary sum v0 v0 v0)
		(includes-3ary sum v0 v1 v1)
		(includes-3ary sum v0 v2 v2)
		(includes-3ary sum v0 v3 v3)
		(includes-3ary sum v0 v4 v4)
		(includes-3ary sum v0 v5 v5)
		(includes-3ary sum v1 v0 v1)
		(includes-3ary sum v1 v1 v2)
		(includes-3ary sum v1 v2 v3)
		(includes-3ary sum v1 v3 v4)
		(includes-3ary sum v1 v4 v5)
		(includes-3ary sum v2 v0 v2)
		(includes-3ary sum v2 v1 v3)
		(includes-3ary sum v2 v2 v4)
		(includes-3ary sum v2 v3 v5)
		(includes-3ary sum v3 v0 v3)
		(includes-3ary sum v3 v1 v4)
		(includes-3ary sum v3 v2 v5)
		(includes-3ary sum v4 v0 v4)
		(includes-3ary sum v4 v1 v5)
		(includes-3ary sum v5 v0 v5)
	)
	(:goal (and
		(assignment fn v5)
		(assignment fn1 v3)
		(assignment fn2 v2)
		(assignment iter v0)
	))
)