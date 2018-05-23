(define (domain list)
	(:requirements :typing)
	(:types node )
	(:predicates
		(at ?n - node)
		(visited ?n - node)
		(adjacent ?n1 ?n2 - node)
		(goal ?n - node)
		(not-equal-goal)
		(checked ?n - node)
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
	
	(:action check-goal
		:parameters ()
		:precondition ( and )
		:effect ( and (not (not-equal-goal) ) 
					  ( forall (?n - node)
						( when  ( and ( at ?n )(not (goal ?n)) )
								( and ( not-equal-goal) (checked ?n) )
						) ) )
	)

	(:action visit-node
		:parameters ()
		:precondition ( and )
		:effect ( and ( forall (?n - node ) 
						( when ( and (at ?n) ( not (visited ?n ) ) ) 
							   ( and (visited ?n) )
						)								
					  )
				)
			
		)
	)

	;(:derived (not-equal-goal)
	;	(exists (?n - node) 
	;			(and (at ?n)(not (goal ?n)) )
	;	)
	;)

)
