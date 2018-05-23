(define (domain 1lane)
	(:requirements :typing)
	(:types value)
	(:predicates
		(xpos ?v - value)
		(xgoal ?v - value )
		(consec ?val1 ?val2 - value)
		(visited ?v - value)
		(is-goal)
	)

	(:action xinc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (xpos ?val1) (consec ?val1 ?val2) )
		                           (and (not (xpos ?val1)) (xpos ?val2))))))

	(:action xdec
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (xpos ?val2) (consec ?val1 ?val2))
		                           (and (not (xpos ?val2)) (xpos ?val1))))))

	(:action visit
		:parameters ()
		:precondition ()
		:effect (and (forall (?v - value)
		                     (when (and (xpos ?v) )
		                           (and (visited ?v ))))))
	(:derived (is-goal)
		(exists (?v - value) (and (xpos ?v) (xgoal ?v))))
)
