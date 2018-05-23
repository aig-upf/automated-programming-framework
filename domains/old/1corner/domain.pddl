(define (domain 1corner)
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
		:parameters (?val1 ?val2 - value)
		:precondition (and (xpos ?val1) (consec ?val1 ?val2) (not (xmax ?val1)))
		:effect (and (not (xpos ?val1)) (xpos ?val2))
	)

	(:action xdec
		:parameters (?val1 ?val2 - value)
		:precondition (and (xpos ?val2) (consec ?val1 ?val2))
		:effect (and (not (xpos ?val2)) (xpos ?val1))
	)

	(:action yinc
		:parameters (?val1 ?val2 - value)
		:precondition (and (ypos ?val1) (consec ?val1 ?val2) (not (ymax ?val1)))
		:effect (and (not (ypos ?val1)) (ypos ?val2))
	)

	(:action ydec
		:parameters (?val1 ?val2 - value)
		:precondition (and (ypos ?val2) (consec ?val1 ?val2)) 
		:effect (and (not (ypos ?val2)) (ypos ?val1))
	)

	(:action visit
		:parameters (?val1 ?val2 - value)
		:precondition (and (xpos ?val1) (ypos ?val2))
		:effect (and (visited ?val1 ?val2))
	)

	(:derived (equalx-xmax)
		(exists (?val - value) (and (xpos ?val) (xmax ?val))))

	(:derived (equaly-ymax)
		(exists (?val - value) (and (ypos ?val) (ymax ?val))))

)
