(define (problem trees3b)
	(:domain programming)
	(:objects
		left-child right-child internal visited - relation
		n1 n2 n3 - value
		current child - variable
	)
	(:init
		(assignment current n3)
		(copyable-2ary left-child)
		(copyable-2ary right-child)
		;(conditional-1ary internal)
		(achievable-1ary visited child)
		(achievable-1ary visited current)
		(includes-2ary left-child n3 n1)
		(includes-2ary right-child n1 n2)
		;(includes-1ary internal n1)
		(conditional-1ary visited)
		(includes-2ary left-child n2 null)
		(includes-2ary right-child n2 null)
		(includes-2ary left-child n1 null)
		(includes-2ary right-child n3 null)
	)
	(:goal (and
		(includes-1ary visited n1)
		(includes-1ary visited n2)
		(includes-1ary visited n3)
	))
)