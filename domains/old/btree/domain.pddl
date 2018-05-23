(define (domain btree)
	(:requirements :typing)
	(:types value)
	(:predicates
		(consec-0 ?val1 ?val2 - value)
		(consec-1 ?val1 ?val2 - value)
		(varnode ?val - value)
		(vargoal ?val - value)
		(visited ?val - value)	
		(equal-goal)	
	)

	(:action next-0
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (varnode ?val1) (consec-0 ?val1 ?val2))
		                           (and (not (varnode ?val1)) (varnode ?val2))))))
	(:action next-1
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (varnode ?val1) (consec-1 ?val1 ?val2))
		                           (and (not (varnode ?val1)) (varnode ?val2))))))
	(:action previous
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (varnode ?val1) (consec-0 ?val2 ?val1))
		                           (and (not (varnode ?val1)) (varnode ?val2))))
			     (forall (?val1 ?val2 - value)
		                     (when (and (varnode ?val1) (consec-1 ?val2 ?val1))
		                           (and (not (varnode ?val1)) (varnode ?val2))))))

	(:action visit
		:parameters ()
		:precondition () 
		:effect (and (forall (?val - value)
		                     (when (and (varnode ?val))
		                           (and (visited ?val))))))

	(:derived (equal-goal)
		(exists (?val - value) (and (varnode ?val) (vargoal ?val))))
					   
)
