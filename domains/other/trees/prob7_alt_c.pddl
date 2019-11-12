(define (problem prob7_alt_c)
	(:domain trees_alt)
	(:objects
		current child - variable
		n1 n2 n3 n4 n5 n6 n7 - node
	)
	(:init
		(assignment current n1)
		(left-child n2 n1)
		(right-child n3 n1)
		(left-child n4 n2)
		(right-child n5 n2)
		(left-child n6 n3)
		(right-child n7 n3)
		(internal n1)
		(internal n2)
		(internal n3)
	)
	(:goal (and
		(visited n1)
		(visited n2)
		(visited n3)
		(visited n4)
		(visited n5)
		(visited n6)
		(visited n7)
	))
)
