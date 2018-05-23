(define (domain count)
	(:requirements :typing)
	(:types index value)
	(:predicates
		(iterator ?ix - index)
		(currentval ?val - value)

		(counter ?val - value)
		(goal ?val - value)

		(assignment ?ix - index ?val - value)

		(consec-i ?ix1 ?ix2 - index)
		(consec-v ?v1 ?v2 - value)

		(equal-goal)
		(have-successor)
	)


	(:action iter-inc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val - value) (not (currentval ?val)))
		             (forall (?ix1 ?ix2 - index ?val - value)
		                     (when (and (iterator ?ix1) (consec-i ?ix1 ?ix2) (assignment ?ix2 ?val))
		                           (and (not (iterator ?ix1)) (iterator ?ix2) (currentval ?val))))))

	(:action iter-dec
		:parameters ()
		:precondition () 
		:effect (and (forall (?val - value) (not (currentval ?val)))
		             (forall (?ix1 ?ix2 - index ?val - value)
		                     (when (and (iterator ?ix1) (consec-i ?ix2 ?ix1) (assignment ?ix2 ?val))
		                           (and (not (iterator ?ix1)) (iterator ?ix2) (currentval ?val))))))

	(:action counter-inc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (counter ?val1) (consec-v ?val1 ?val2))
		                           (and (not (counter ?val1)) (counter ?val2))))))

	(:action counter-dec
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (counter ?val1) (consec-v ?val2 ?val1))
		                           (and (not (counter ?val1)) (counter ?val2))))))

	(:derived (equal-goal)
		(exists (?val - value) (and (currentval ?val)(goal ?val))))

	(:derived (have-successor)
		(exists (?ix1 ?ix2 - index) (and (iterator ?ix1) (consec-i ?ix1 ?ix2))))

)
