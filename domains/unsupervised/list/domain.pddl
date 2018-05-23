(define (domain list)
	(:requirements :typing)
	(:types node )
	(:predicates
		(at ?n - node)
		(visited ?n - node)
		(not-visited ?n - node)
		(adjacent ?n1 ?n2 - node)
		;(tail ?n - node)
		;(is-tail)
	)


	(:action move-next
		:parameters ()
		:precondition ( and ) 
		:effect (and ( forall (?n1 ?n2 - node) 
						( when  (and ( adjacent ?n1 ?n2 ) ( at ?n1 ) )
								(and ( not (at ?n1) ) (at ?n2) )
						)
					 )
				)
	)

	(:action visit-node
		:parameters ()
		:precondition ( and )
		:effect ( and ( forall (?n - node ) 
						( when ( and (at ?n) ( not (visited ?n ) ) ) 
							   ( and (visited ?n)(not (not-visited ?n)) )
						)								
					  )
				)
			
		)
	)

	;(:derived (is-tail)
	;	(exists (?n - node) 
	;		(and (at ?n)(tail ?n)) )
	;	)
	;)

)
