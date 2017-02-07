(define (domain sorting)
	(:requirements :typing)
	(:types index value)
	(:predicates
		(outeriter ?ix - index)
		(outerval ?val - value)

		(iterator ?ix - index)
		(currentval ?val - value)

		(itermax ?ix - index)

		(itermark ?ix - index)
		(valuemark ?val - value)

		(assignment ?ix - index ?val - value)

		(consec ?ix1 ?ix2 - index)
		(lessthan ?v1 ?v2 - value)

		(equal-outeriter-max)
		(equal-iterator-max)
		(lessthan-assignment-mark)
	)

	(:action outeriterinc
		:parameters (?ix1 ?ix2 - index ?val - value)
		:precondition (and (outeriter ?ix1) (not (itermax ?ix1)) (consec ?ix1 ?ix2) (assignment ?ix2 ?val))
		:effect (and (forall (?val - value) (not (outerval ?val)))
		             (forall (?ix - index) (not (iterator ?ix)))
		             (forall (?val - value) (not (currentval ?val)))
		             (forall (?ix - index) (not (itermark ?ix)))
		             (forall (?val - value) (not (valuemark ?val)))
					 (not (outeriter ?ix1)) (outeriter ?ix2) (outerval ?val) 
					 (iterator ?ix2) (currentval ?val) (itermark ?ix2) (valuemark ?val)))

	(:action iterinc
		:parameters (?ix1 ?ix2 - index ?val - value)
		:precondition (and (iterator ?ix1) (not (itermax ?ix1)) (consec ?ix1 ?ix2) (assignment ?ix2 ?val))
		:effect (and (forall (?v - value) (not (currentval ?v)))
		             (not (iterator ?ix1)) (iterator ?ix2) (currentval ?val)))

	(:action mark-iterator-value
		:parameters (?ix - index ?val - value)
		:precondition (and (iterator ?ix)(currentval ?val) )
		:effect (and (forall (?i - index) (not (itermark ?i)))
					 (forall (?v - value) (not (valuemark ?v)))
					 (itermark ?ix)(valuemark ?val)))

	(:action swap
		:parameters (?i1 ?i2 - index ?v1 ?v2 - value)
		:precondition (and (outeriter ?i1)(outerval ?v1)(itermark ?i2)(valuemark ?v2) )
		:effect (and (forall (?v - value)
		                     (not (assignment ?i1 ?v)))
		             (forall (?v - value)
		                     (not (assignment ?i2 ?v)))
		             (forall (?v - value) 
							 (not (outerval ?v)))
					 (assignment ?i1 ?v2)(assignment ?i2 ?v1)(outerval ?v2)))

	(:derived (equal-outeriter-max)
		(exists (?ix - index) (and (outeriter ?ix) (itermax ?ix))))

	(:derived (equal-iterator-max)
		(exists (?ix - index) (and (iterator ?ix) (itermax ?ix))))

	(:derived (lessthan-assignment-mark)
		(exists (?v1 ?v2 - value)
		        (and (currentval ?v1) (valuemark ?v2) (lessthan ?v1 ?v2) )))

)
