(define (domain grid)
	(:requirements :typing)
	(:types value)
	(:predicates
		(xpos ?val - value)
		(ypos ?val - value)
		(xgoal ?val - value)
		(ygoal ?val - value)
		(consec ?val1 ?val2 - value)
		(equalx-xgoal)
		(equaly-ygoal)
		;(not-equalx-xgoal)
		;(not-equaly-ygoal)
	)

	(:action xinc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (xpos ?val1) (consec ?val1 ?val2))
		                           (and (not (xpos ?val1)) (xpos ?val2))))))

	(:action xdec
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (xpos ?val2) (consec ?val1 ?val2))
		                           (and (not (xpos ?val2)) (xpos ?val1))))))

	(:action yinc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (ypos ?val1) (consec ?val1 ?val2))
		                           (and (not (ypos ?val1)) (ypos ?val2))))))

	(:action ydec
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (ypos ?val2) (consec ?val1 ?val2))
		                           (and (not (ypos ?val2)) (ypos ?val1))))))

	(:derived (equalx-xgoal)
		(exists (?val - value) (and (xpos ?val) (xgoal ?val))))

	(:derived (equaly-ygoal)
		(exists (?val - value) (and (ypos ?val) (ygoal ?val))))

	;(:derived (not-equalx-xgoal)
	;	(exists (?val - value) (and (xpos ?val) (not (xgoal ?val)))))

	;(:derived (not-equaly-ygoal)
	;	(exists (?val - value) (and (ypos ?val) (not (ygoal ?val)))))
)
