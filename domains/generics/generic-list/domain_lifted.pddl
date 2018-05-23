(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:constants 
		next visited - relation
		iter tail - variable
	)
	(:predicates
		(assignment ?var - variable ?val - value)

		(ordinal-1ary ?rel - relation)
		(ordinal-2ary ?rel - relation)

		(achievable-1ary ?rel - relation ?var - variable)

		(includes-1ary ?rel - relation ?val - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)

		(arity-1 ?rel - relation)
		(arity-2 ?rel - relation)
	)

	(:action increment-2ary
		:parameters (?rel - relation ?var - variable ?v1 ?v2 - value )
		:precondition (and (ordinal-2ary ?rel)(assignment ?var ?v1) (includes-2ary ?rel ?v1 ?v2))
		:effect (and (not (assignment ?var ?v1)) (assignment ?var ?v2)))


	(:action achieve-1ary
		:parameters (?rel - relation ?var - variable ?val - value )
		:precondition (and (achievable-1ary ?rel ?var)(assignment ?var ?val))
		:effect (and (includes-1ary ?rel ?val)))

)
