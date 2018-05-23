(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?val - value)

		(ordinal-1ary ?rel - relation)
		(ordinal-2ary ?rel - relation)

		(achievable-1ary ?rel - relation ?var - variable)

		(includes-1ary ?rel - relation ?val - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)

	)

	(:action increment-2ary
		:parameters (?rel - relation ?var - variable)
		:precondition (ordinal-2ary ?rel)
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val1) (includes-2ary ?rel ?val1 ?val2))
		                           (and (not (assignment ?var ?val1)) (assignment ?var ?val2))))))


	(:action achieve-1ary
		:parameters (?rel - relation ?var - variable)
		:precondition (achievable-1ary ?rel ?var)
		:effect (and (forall (?val - value)
		                     (when (and (assignment ?var ?val))
		                           (and (includes-1ary ?rel ?val))))))

)
