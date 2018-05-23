(define (problem list123-lifted)
	(:domain programming)
	(:objects
		n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 nil - value
	)
	(:init
		(assignment iter n1)
		(assignment tail nil)

		(ordinal-1ary visited)
		(ordinal-2ary next)

		(achievable-1ary visited iter)

		(includes-2ary next n1 n2)
		(includes-2ary next n2 n3)
		(includes-2ary next n3 n4)
		(includes-2ary next n4 n5)
		(includes-2ary next n5 n6)
		(includes-2ary next n6 n7)
		(includes-2ary next n7 n8)
		(includes-2ary next n8 n9)
		(includes-2ary next n9 n10)
		(includes-2ary next n10 nil)

		(arity-1 visited)
		(arity-2 next)
	)
	(:goal (and
		(includes-1ary visited n1)
		(includes-1ary visited n2)
		(includes-1ary visited n3)
		(includes-1ary visited n4)
		(includes-1ary visited n5)
		(includes-1ary visited n6)
		(includes-1ary visited n7)
		(includes-1ary visited n8)
		(includes-1ary visited n9)
		(includes-1ary visited n10)
	))
)
