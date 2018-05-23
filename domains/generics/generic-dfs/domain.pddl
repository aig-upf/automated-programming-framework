(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	;(:constants null - value)
	(:predicates
		(assignment ?var - variable ?val - value)

		(copyable-2ary ?rel - relation)

		(conditional-1ary ?rel - relation)

		(achievable-1ary ?rel - relation ?var - variable)

		(includes-1ary ?rel - relation ?val - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)

		(equal ?var1 ?var2 - variable)
		;(assigned ?v - variable)
		;(is-null ?v - variable)
		(satisfies-1ary ?rel - relation ?var - variable)
		;(achieved ?r - relation ?v - variable)
	)

	(:action copy-2ary
		:parameters (?rel - relation ?var1 ?var2 - variable)
		:precondition (copyable-2ary ?rel)
		:effect (and (forall (?val - value) (not (assignment ?var1 ?val)))
		             (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var2 ?val1) (includes-2ary ?rel ?val1 ?val2))
		                           (and (assignment ?var1 ?val2))))))

	(:action achieve-1ary
		:parameters (?rel - relation ?var - variable)
		:precondition (achievable-1ary ?rel ?var)
		:effect (and (forall (?val - value)
		                     (when (and (assignment ?var ?val))
		                           (and (includes-1ary ?rel ?val))))))


	(:derived (equal ?var1 ?var2 - variable)
		(exists (?val - value) (and (assignment ?var1 ?val) (assignment ?var2 ?val))))

	;(:derived (is-null ?v - variable)
	;	(exists () (and (assignment ?v null)))
	;)
	;(:derived (achieved ?r - relation ?v - variable)
	;	(exists (?val - value) (and (achievable-1ary ?r ?v)(assignment ?v ?val) ))
	;)
	;(:derived (assigned ?v - variable)
	;	(exists (?val - value) (and (assignment ?v ?val)))
	;)
	(:derived (satisfies-1ary ?rel - relation ?var - variable)
		(and (conditional-1ary ?rel) (exists (?val - value) (and (assignment ?var ?val) (includes-1ary ?rel ?val)))))
)
