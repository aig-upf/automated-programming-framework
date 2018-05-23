(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?val - value)

		(ordinal-1ary ?rel - relation)
		(ordinal-2ary ?rel - relation)
		(ordinal-3ary ?rel - relation)

		(arity-2 ?rel - relation)
		(arity-3 ?rel - relation)

		(includes-2ary ?rel - relation ?val1 ?val2 - value)
		(includes-3ary ?rel - relation ?val1 ?val2 ?val3 - value)

	)

	(:action decrement-2ary
		:parameters (?rel - relation ?var - variable ?val1 ?val2 - value)
		:precondition (and (ordinal-2ary ?rel)(assignment ?var ?val2) (includes-2ary ?rel ?val1 ?val2))
		:effect (and (not (assignment ?var ?val2)) (assignment ?var ?val1)))

	(:action increment-3ary
		:parameters (?rel - relation ?var1 ?var2 - variable ?val1 ?val2 ?val3 - value)
		:precondition (and (ordinal-3ary ?rel)(assignment ?var1 ?val1) (assignment ?var2 ?val2) (includes-3ary ?rel ?val1 ?val2 ?val3))
		:effect (and (not (assignment ?var1 ?val1)) (assignment ?var1 ?val3)))

)
