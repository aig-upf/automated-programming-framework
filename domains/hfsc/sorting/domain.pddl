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
		(lessthan ?val1 ?val2 - value)

		(equal-outeriter-max)
		(equal-iterator-max)
		(lessthan-assignment-mark)
	)

	(:action outeriterinc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val - value) (not (outerval ?val)))
		             (forall (?ix - index) (not (iterator ?ix)))
		             (forall (?val - value) (not (currentval ?val)))
		             (forall (?ix - index) (not (itermark ?ix)))
		             (forall (?val - value) (not (valuemark ?val)))
		             (forall (?ix1 ?ix2 - index ?val - value)
		                     (when (and (outeriter ?ix1) (not (itermax ?ix1)) (consec ?ix1 ?ix2) (assignment ?ix2 ?val))
		                           (and (not (outeriter ?ix1)) (outeriter ?ix2) (outerval ?val) (iterator ?ix2) (currentval ?val) (itermark ?ix2) (valuemark ?val))))))

	(:action iterinc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val - value) (not (currentval ?val)))
		             (forall (?ix1 ?ix2 - index ?val - value)
		                     (when (and (iterator ?ix1) (not (itermax ?ix1)) (consec ?ix1 ?ix2) (assignment ?ix2 ?val))
		                           (and (not (iterator ?ix1)) (iterator ?ix2) (currentval ?val))))))

	(:action mark-iterator-value
		:parameters ()
		:precondition ()
		:effect (and (forall (?ix - index) (not (itermark ?ix)))
		             (forall (?ix - index) (when (iterator ?ix) (itermark ?ix)))
					 (forall (?val - value) (not (valuemark ?val)))
		             (forall (?val - value) (when (currentval ?val) (valuemark ?val)))))

	;(:action mark-value
	;	:parameters ()
	;	:precondition ()
	;	:effect (and (forall (?val - value) (not (valuemark ?val)))
	;	             (forall (?val - value) (when (currentval ?val) (valuemark ?val)))))

	(:action swap
		:parameters ()
		:precondition ()
		:effect (and (forall (?ix - index ?val - value)
		                     (when (outeriter ?ix) (not (assignment ?ix ?val))))
		             (forall (?ix - index ?val - value)
		                     (when (itermark ?ix) (not (assignment ?ix ?val))))
		             (forall (?ix - index ?val - value)
		                     (when (and (itermark ?ix) (outerval ?val)) (assignment ?ix ?val)))
		             (forall (?val - value) (not (outerval ?val)))
		             (forall (?ix - index ?val - value)
		                     (when (and (outeriter ?ix) (valuemark ?val))
		                           (and (assignment ?ix ?val) (outerval ?val))))))

	(:derived (equal-outeriter-max)
		(exists (?ix - index) (and (outeriter ?ix) (itermax ?ix))))

	(:derived (equal-iterator-max)
		(exists (?ix - index) (and (iterator ?ix) (itermax ?ix))))

	(:derived (lessthan-assignment-mark)
		(exists (?val1 ?val2 - value)
		        (and (currentval ?val1) (valuemark ?val2) (lessthan ?val1 ?val2))))

)
