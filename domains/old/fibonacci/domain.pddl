(define (domain fibonacci)
	(:requirements :typing)
	(:types value)
	(:constants v0 v1 - value)
	(:predicates
		(fn1 ?v - value)
		(fn2 ?v - value)
		(fn ?v - value)
		(nth ?v - value)
		(sum ?v1 ?v2 ?v3 - value)
		(suc-v ?v1 ?v2 - value))

	(:action assign-fn1-to-fn2
		:parameters ()
		:precondition ()
		:effect (and 
					(forall (?v1 ?v2 - value)
						(when (and (fn1 ?v1)(fn2 ?v2))	
								(and (not (fn2 ?v2))(fn2 ?v1))))
				)
	)
	(:action assign-fn-to-fn1
		:parameters ()
		:precondition ()
		:effect (and 
					(forall (?v1 ?v2 - value)
						(when (and (fn ?v1)(fn1 ?v2))	
								(and (not (fn1 ?v2))(fn1 ?v1))))
				)
	)

	(:action add-fn2-to-fn
		:parameters ()
		:precondition ()
		:effect (and (forall (?v1 ?v2 ?v3 - value)
  			        (when (and (fn2 ?v1) (fn ?v2) (sum ?v1 ?v2 ?v3))
  				      (and (not (fn ?v2)) (fn ?v3))
					))))


	(:action dec-n
		:parameters ()
		:precondition ()
		:effect (and (forall (?v1 ?v2 - value)
					(when (and (nth ?v2)(suc-v ?v1 ?v2))
						(and (not (nth ?v2)) (nth ?v1))
					))
				)
	)
)
