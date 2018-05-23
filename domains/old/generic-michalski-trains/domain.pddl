(define (domain michalski)
	(:requirements :typing)
	(:types relation value)
	(:predicates
		(east)
		(west)

		(ordinal-1ary ?rel - relation)
		(ordinal-2ary ?rel - relation)

		(includes-1ary ?rel - relation ?val - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)
	)

	(:action set-west
		:parameters()
		:precondition (east)
		:effect (and (not (east) ) (west) )
	)
)
