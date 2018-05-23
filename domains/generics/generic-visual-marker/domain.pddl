(define (domain vmarker)
	(:requirements :typing)
	(:types relation value variable)
	(:predicates
		(assignment ?var - variable ?val - value)
		(next ?val1 ?val2 - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)
	)

	(:action increment
		:parameters (?var - variable)
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val1) (next ?val1 ?val2))
		                           (and (not (assignment ?var ?val1)) (assignment ?var ?val2))))))
	(:action decrement
		:parameters (?var - variable)
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val2) (next ?val1 ?val2))
		                           (and (not (assignment ?var ?val2)) (assignment ?var ?val1))))))
)
