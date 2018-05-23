(define (domain fibonacci)
	(:requirements :typing)
	(:types value)
	(:constants v0 v1 - value)
	(:predicates
		(var0 ?val - value)
		(var1 ?val - value)
		(var2 ?val - value)
		(res ?val - value)
		(nth ?val - value)
		(sum ?val1 ?val2 ?val3 - value)
		(nth-number))

	(:action assign-var0-to-res
		:parameters ()
		:precondition ()
		:effect (and 
					(forall (?v1 ?v2 - value)
						(when (and (res ?v1)(var0 ?v2))	
								(and (not (res ?v1))(res ?v2))))
				)
	)

	(:action assign-var0-to-var2
		:parameters ()
		:precondition ()
		:effect (and 
				 (forall (?val1 - value)
			       (when (and (var2 ?val1))
			     	     (and (not (var2 ?val1)))))

			     (forall (?val1 - value)
			       (when (and (var0 ?val1))
			     	     (and (var2 ?val1))))))

	(:action assign-var2-to-var1
		:parameters ()
		:precondition ()
		:effect (and 
				 (forall (?val1 - value)
			       (when (and (var1 ?val1))
			     	     (and (not (var1 ?val1)))))

			     (forall (?val1 - value)
			       (when (and (var2 ?val1))
			     	     (and (var1 ?val1))))))

	(:action add-var1-to-var0
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 ?val3 - value)
  			        (when (and (var0 ?val1) (var1 ?val2) (sum ?val1 ?val2 ?val3))
  				      (and (not (var0 ?val1)) (var0 ?val3))
					))))

	(:derived (nth-number)
     (exists (?v - value) (and (res ?v) (nth ?v))))
)
