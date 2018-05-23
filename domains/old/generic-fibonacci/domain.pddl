(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?val - value)

		(ordinal-2ary ?rel - relation)
		(ordinal-3ary ?rel - relation)

		(copyable-2ary ?rel - relation)

		(achievable-1ary ?rel - relation ?var - variable)
		(achievable-2ary ?rel - relation ?var1 ?var2 - variable)

		(includes-2ary ?rel - relation ?val1 ?val2 - value)
		(includes-3ary ?rel - relation ?val1 ?val2 ?val3 - value)

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

	(:action increment-3ary
		:parameters (?rel - relation ?var1 ?var2 - variable)
		:precondition (ordinal-3ary ?rel)
		:effect (and (forall (?val1 ?val2 ?val3 - value)
		                     (when (and (assignment ?var1 ?val1) (assignment ?var2 ?val2) (includes-3ary ?rel ?val1 ?val2 ?val3))
		                           (and (not (assignment ?var1 ?val1)) (assignment ?var1 ?val3))))))

	(:action copy-2ary
		:parameters (?rel - relation ?var1 ?var2 - variable)
		:precondition (copyable-2ary ?rel)
		:effect (and (forall (?val - value) (not (assignment ?var1 ?val)))
		             (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var2 ?val1) (includes-2ary ?rel ?val1 ?val2))
		                           (and (assignment ?var1 ?val2))))))

	;(:action achieve-2ary
	;	:parameters (?rel - relation ?var1 ?var2 - variable)
	;	:precondition (achievable-2ary ?rel ?var1 ?var2)
	;	:effect (and (forall (?val1 ?val2 - value)
	;	                     (when (and (assignment ?var1 ?val1) (assignment ?var2 ?val2))
	;	                           (and (includes-2ary ?rel ?val1 ?val2))))))
)
