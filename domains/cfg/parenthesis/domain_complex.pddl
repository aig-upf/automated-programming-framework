(define (domain complex-parenthesis)
	(:requirements :typing)
	(:types index symbol)
	(:constants lpar rpar lsqbra rsqbra lcubra rcubra empty - symbol)
	(:predicates
		(at ?i - index)
		(adjacent ?i1 ?i2 - index)
		(content ?i - index ?l - symbol )
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

	(:action process-lsqbra
		:parameters ()
		:precondition (and (current-content lsqbra) ) 
		:effect (and ( forall (?i1 ?i2 - index ?s - symbol) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?s) )
								(and ( not (at ?i1) ) (at ?i2) (not (current-content lsqbra))(current-content ?s))
						)
					 )
				)
	)
	
	(:action process-rsqbra
		:parameters ()
		:precondition (and (current-content rsqbra)) 
		:effect (and ( forall (?i1 ?i2 - index ?s - symbol) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?s) )
								(and ( not (at ?i1) ) (at ?i2)(not (current-content rsqbra))(current-content ?s) )
						)
					 )
				)
	)

	(:action process-lcubra
		:parameters ()
		:precondition (and (current-content lcubra) ) 
		:effect (and ( forall (?i1 ?i2 - index ?s - symbol) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?s) )
								(and ( not (at ?i1) ) (at ?i2) (not (current-content lcubra))(current-content ?s))
						)
					 )
				)
	)
	
	(:action process-rcubra
		:parameters ()
		:precondition (and (current-content rcubra)) 
		:effect (and ( forall (?i1 ?i2 - index ?s - symbol) 
						( when  (and ( adjacent ?i1 ?i2 ) ( at ?i1 ) (content ?i2 ?s) )
								(and ( not (at ?i1) ) (at ?i2)(not (current-content rcubra))(current-content ?s) )
						)
					 )
				)
	)


)
