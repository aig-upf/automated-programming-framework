(define (domain list)
	(:requirements :typing)
	(:types node )
	(:predicates
		(goal ?n - node)
		(at ?n - node)
		(visited ?n - node)
		(checked ?n - node)
		(adjacent ?n1 ?n2 - node)
		(not-equal-goal)
		;(equal-goal)
	)


	(:action move-next
		:parameters (?n1 ?n2 - node)
		:precondition ( and ( adjacent ?n1 ?n2 ) ( at ?n1 )) 
		:effect (and ( not (at ?n1) ) (at ?n2) )
	)
	
	(:action check-goal
		:parameters ( ?n - node )
		:precondition ( and ( at ?n ) )
		:effect ( and (checked ?n)(not (not-equal-goal))
					  ( when  ( and (not (goal ?n) ) )
						( and (not-equal-goal))
					  )
				)
	)

	(:action visit-node
		:parameters (?n - node)
		:precondition ( and (at ?n) ( not (visited ?n ) ) )
		:effect ( and (visited ?n) )
	)

	;(:derived (not-equal-goal)
	;	(exists (?n - node) 
	;			(and (at ?n)(not (goal ?n)) )
	;	)
	;)
	;(:derived (equal-goal)
	;	(exists (?n - node) 
	;			(and (at ?n)(goal ?n) )
	;	)
	;)
)
