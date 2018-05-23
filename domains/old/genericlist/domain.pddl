(define (domain genericlist)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?idx - value)
		(vector-assignment ?idx ?val - value)
		(pointer ?var - variable ?val - value)

		(next ?idx1 ?idx2 - value)

		(includes ?rel - relation ?val1 ?val2 - value)
	)

	(:action increment
		:parameters (?var - variable)
		:precondition ()
		:effect (and (forall (?val - value)
		                     (and (not (assignment ?var ?val)) (not (pointer ?var ?val))))
		             (forall (?idx1 ?idx2 - value)
		                     (when (and (assignment ?var ?idx1) (next ?idx1 ?idx2))
		                           (and (assignment ?var ?idx2))))
		             (forall (?idx1 ?idx2 ?val - value)
		                     (when (and (assignment ?var ?idx1) (next ?idx1 ?idx2) (vector-assignment ?idx2 ?val))
		                           (and (pointer ?var ?val))))))

	(:action copy
		:parameters (?var1 ?var2 - variable)
		:precondition ()
		:effect (and (forall (?val - value)
		                     (and (not (assignment ?var1 ?val)) (not (pointer ?var1 ?val))))
		             (forall (?idx - value)
		                     (when (assignment ?var2 ?idx)
		                           (assignment ?var1 ?idx)))
		             (forall (?val - value)
		                     (when (pointer ?var2 ?val)
		                           (pointer ?var1 ?val)))))
)
