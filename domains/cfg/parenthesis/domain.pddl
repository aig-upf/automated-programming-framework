(define (domain parenthesis)
	(:requirements :typing)
	(:types index symbol)
	(:constants lpar rpar empty - symbol)
	(:predicates
		(at ?i - index)
		(adjacent ?i1 ?i2 - index)
		(content ?i - index ?s - symbol )
		(current-content ?s - symbol )
	)


	(:action process-lpar
		:parameters ()
		:precondition (and (current-content lpar) ) 
		:effect (and ( forall (?i1 ?i2 - index ?s - symbol) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?s) )
								(and ( not (at ?i1) ) (at ?i2) (not (current-content lpar))(current-content ?s))
						)
					 )
				)
	)
	
	(:action process-rpar
		:parameters ()
		:precondition (and (current-content rpar)) 
		:effect (and ( forall (?i1 ?i2 - index ?s - symbol) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?s) )
								(and ( not (at ?i1) ) (at ?i2)(not (current-content rpar))(current-content ?s) )
						)
					 )
				)
	)

)
