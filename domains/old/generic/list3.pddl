(define (problem list3)
	(:domain programming)
	(:objects
		next visited - relation
		n1 n2 n3 n4 - value
		iter tail - variable
	)
	(:init
		(assignment iter n1)
		(assignment tail n4)
		(ordinal-2ary next)
		(achievable-1ary visited iter)
		(includes-2ary next n1 n2)
		(includes-2ary next n2 n3)
		(includes-2ary next n3 n4)
	)
	(:goal (and
		(includes-1ary visited n1)
		(includes-1ary visited n2)
		(includes-1ary visited n3)
	))
)
