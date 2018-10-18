(define (domain regularExpressions)
	(:requirements :typing)
	(:types index letter)
	(:constants a b empty - letter)
	(:predicates
		(at ?i - index)
		(adjacent ?i1 ?i2 - index)
		(content ?i - index ?l - letter )
		(current-content ?l - letter )
	)


	(:action process-a
		:parameters ()
		:precondition (and (current-content a)) 
		:effect (and ( forall (?i1 ?i2 - index ?l - letter) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?l) )
								(and ( not (at ?i1) ) (at ?i2)(not (current-content a)) (current-content ?l)  )
						)
					 )
				)
	)
	
	(:action process-b
		:parameters ()
		:precondition (and (current-content b)) 
		:effect (and ( forall (?i1 ?i2 - index ?l - letter) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?l) )
								(and ( not (at ?i1) ) (at ?i2)(not (current-content b)) (current-content ?l) )
						)
					 )
				)
	)

)