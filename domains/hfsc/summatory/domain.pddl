(define (domain summatory)
	(:requirements :typing)
	(:types value)
	(:constants v1 - value)
	(:predicates
		(var0 ?val - value)
		(var1 ?val - value)
		(sum ?val1 ?val2 ?val3 - value))
	
	(:action inc-var0
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
			        (when (and (var0 ?val1) (sum v1 ?val1 ?val2))
				      (and (not (var0 ?val1)) (var0 ?val2))))))
	(:action dec-var0
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
			        (when (and (var0 ?val1) (sum v1 ?val2 ?val1))
				      (and (not (var0 ?val1)) (var0 ?val2))))))

	(:action inc-var1
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
			        (when (and (var1 ?val1) (sum v1 ?val1 ?val2))
				      (and (not (var1 ?val1)) (var1 ?val2))))))

	(:action dec-var1
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
			        (when (and (var1 ?val1) (sum v1 ?val2 ?val1))
				      (and (not (var1 ?val1)) (var1 ?val2))))))

	(:action add-var1-to-var0
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 ?val3 - value)
  			        (when (and (var0 ?val1) (var1 ?val2) (sum ?val1 ?val2 ?val3))
  				      (and (not (var0 ?val1)) (var0 ?val3))))))

)