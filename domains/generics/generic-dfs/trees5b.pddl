(define (problem trees5b)
	(:domain programming)
	(:objects
		left-child right-child visited - relation
		n1 n2 n3 n4 n5 - value
		current child - variable
	)
	(:init
		(assignment current n5)
		(copyable-2ary left-child)
		(copyable-2ary right-child)
		(achievable-1ary visited child)
		(achievable-1ary visited current)
		(includes-2ary left-child n5 n4)
		(includes-2ary right-child n5 n1)
		(includes-2ary left-child n1 n2)
		(includes-2ary right-child n1 n3)
		(conditional-1ary visited)
	)
	(:goal (and
		(includes-1ary visited n1)
		(includes-1ary visited n2)
		(includes-1ary visited n3)
		(includes-1ary visited n4)
		(includes-1ary visited n5)
	))
)
