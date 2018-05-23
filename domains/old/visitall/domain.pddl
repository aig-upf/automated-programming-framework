(define (domain visitall)
	(:requirements :typing)
	(:types value)
	(:predicates
		(xpos ?val - value)
		(ypos ?val - value)
		(xmin ?val - value)
		(ymin ?val - value)
		(xmax ?val - value)
		(ymax ?val - value)
		(consec ?val1 ?val2 - value)
		(visited ?val1 ?val2 - value)
		(equalx-xmax)
		(equaly-ymax)
	)

	(:action xinc
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (xpos ?val1) (consec ?val1 ?val2) (not (xmax ?val1)))
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
		                     (when (and (ypos ?val1) (consec ?val1 ?val2) (not (ymax ?val1)))
		                           (and (not (ypos ?val1)) (ypos ?val2))))))

	(:action ydec
		:parameters ()
		:precondition () 
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (ypos ?val2) (consec ?val1 ?val2))
		                           (and (not (ypos ?val2)) (ypos ?val1))))))

	(:action visit
		:parameters ()
		:precondition ()
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (xpos ?val1) (ypos ?val2))
		                           (and (visited ?val1 ?val2))))))

	(:derived (equalx-xmax)
		(exists (?val - value) (and (xpos ?val) (xmax ?val))))

	(:derived (equaly-ymax)
		(exists (?val - value) (and (ypos ?val) (ymax ?val))))

)
