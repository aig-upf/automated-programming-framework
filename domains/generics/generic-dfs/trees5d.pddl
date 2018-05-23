(define (problem trees5d)
	(:domain programming)
	(:objects
		left-child right-child visited - relation
		n1 n2 n3 n4 n5 - value
		current child - variable
	)
	(:init
		(assignment current n1)
		(copyable-2ary left-child)
		(copyable-2ary right-child)
		(achievable-1ary visited child)
		(achievable-1ary visited current)
		(includes-2ary left-child n1 n2)
		(includes-2ary right-child n1 n3)
		(includes-2ary left-child n2 n5)
		(includes-2ary right-child n3 n4)
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
