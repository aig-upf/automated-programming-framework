(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?val - value)
		(vector-assignment ?idx ?val - value)

		(ordinal-2ary ?rel - relation)
		(ordinal-3ary ?rel - relation)

		(copyable-2ary ?rel - relation)

		(conditional-1ary ?rel - relation)
		(conditional-2ary ?rel - relation)

		(achievable-1ary ?rel - relation ?var - variable)
		(achievable-2ary ?rel - relation ?var1 ?var2 - variable)

		(includes-1ary ?rel - relation ?val - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)
		(includes-3ary ?rel - relation ?val1 ?val2 ?val3 - value)

		(equal ?var1 ?var2 - variable)
		(satisfies-1ary ?rel - relation ?var - variable)
		(satisfies-2ary ?rel - relation ?var1 ?var2 - variable)

		;; static predicates that control actions and derived predicates
		(can-swap)
	)

	(:action vector-swap
		:parameters (?var1 ?var2 - variable)
		:precondition (can-swap)
		:effect (and
			(forall (?idx ?val - value)
			        (when (and (assignment ?var1 ?idx) (vector-assignment ?idx ?val))
			              (and (not (vector-assignment ?idx ?val)))))
			(forall (?idx ?val - value)
			      	(when (and (assignment ?var2 ?idx) (vector-assignment ?idx ?val))
			              (and (not (vector-assignment ?idx ?val)))))
			(forall (?idx1 ?idx2 ?val - value)
			      	(when (and (assignment ?var1 ?idx1) (assignment ?var2 ?idx2) (vector-assignment ?idx1 ?val))
			              (and (vector-assignment ?idx2 ?val))))
			(forall (?idx1 ?idx2 ?val - value)
			      	(when (and (assignment ?var1 ?idx1) (assignment ?var2 ?idx2) (vector-assignment ?idx2 ?val))
			              (and (vector-assignment ?idx1 ?val))))))

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

	(:action achieve-1ary
		:parameters (?rel - relation ?var - variable)
		:precondition (achievable-1ary ?rel ?var)
		:effect (and (forall (?val - value)
		                     (when (and (assignment ?var ?val))
		                           (and (includes-1ary ?rel ?val))))))

	(:action achieve-2ary
		:parameters (?rel - relation ?var1 ?var2 - variable)
		:precondition (achievable-2ary ?rel ?var1 ?var2)
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var1 ?val1) (assignment ?var2 ?val2))
		                           (and (includes-2ary ?rel ?val1 ?val2))))))

	(:derived (equal ?var1 ?var2 - variable)
		(exists (?val - value) (and (assignment ?var1 ?val) (assignment ?var2 ?val))))

	(:derived (satisfies-1ary ?rel - relation ?var - variable)
		(and (conditional-1ary ?rel) (exists (?val - value) (and (assignment ?var ?val) (includes-1ary ?rel ?val)))))

	(:derived (satisfies-2ary ?rel - relation ?var1 ?var2 - variable)
		(and (conditional-2ary ?rel) (exists (?val1 ?val2 - value) (and (assignment ?var1 ?val1) (assignment ?var2 ?val2) (includes-2ary ?rel ?val1 ?val2)))))

)
