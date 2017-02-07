(define (problem trees7)
	(:domain programming)
	(:objects
		left-child right-child internal visited - relation
		n1 n2 n3 n4 n5 n6 n7 - value
		current child - variable
	)
	(:init
		(assignment current n1)
		(copyable-2ary left-child)
		(copyable-2ary right-child)
		(conditional-1ary internal)
		(achievable-1ary visited child)
		(achievable-1ary visited current)
		(includes-2ary left-child n1 n2)
		(includes-2ary right-child n1 n3)
		(includes-2ary left-child n3 n4)
		(includes-2ary right-child n3 n5)
		(includes-2ary left-child n4 n6)
		(includes-2ary right-child n4 n7)
		(includes-1ary internal n1)
		(includes-1ary internal n3)
		(includes-1ary internal n4)
	)
	(:goal (and
		(includes-1ary visited n1)
		(includes-1ary visited n2)
		(includes-1ary visited n3)
		(includes-1ary visited n4)
		(includes-1ary visited n5)
		(includes-1ary visited n6)
		(includes-1ary visited n7)
	))
)
