(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?val - value)

		(ordinal-2ary ?rel - relation)

		(includes-2ary ?rel - relation ?val1 ?val2 - value)
	)

	(:action decrement-2ary
		:parameters (?rel - relation ?var - variable)
		:precondition (ordinal-2ary ?rel)
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val2) (includes-2ary ?rel ?val1 ?val2))
		                           (and (not (assignment ?var ?val2)) (assignment ?var ?val1))))))

	(:action increment-2ary
		:parameters (?rel - relation ?var - variable)
		:precondition (ordinal-2ary ?rel)
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val1) (includes-2ary ?rel ?val1 ?val2))
		                           (and (not (assignment ?var ?val1)) (assignment ?var ?val2))))))

)
