(define (domain mgo)
	(:requirements :typing)
	(:types value)
	(:predicates
		(xpos ?val - value)
		(ypos ?val - value)
		(xgoal ?val - value)
		(ygoal ?val - value)
		(consec ?v1 ?v2 - value)
		(wall ?v1 ?v2 - value )
		(equalx-xgoal)
		(equaly-ygoal)
		(not-equalx-xgoal)
		(not-equaly-ygoal)
		;(in-wall)
	)

	;(:action xinc
	;	:parameters (?v1 ?v2 - value)
	;	:precondition (and (xpos ?v1) (consec ?v1 ?v2)) 
	;	:effect (and (not (xpos ?v1)) (xpos ?v2)))

	(:action xdec
		:parameters (?v1 ?v2 ?v3 - value)
		:precondition (and (xpos ?v2)(ypos ?v3) (consec ?v1 ?v2)(not (wall ?v1 ?v3))) 
		:effect (and (not (xpos ?v2)) (xpos ?v1)))

	(:action yinc
		:parameters (?v1 ?v2 ?v3 - value)
		:precondition (and (ypos ?v1)(xpos ?v3)(consec ?v1 ?v2)(not (wall ?v3 ?v2)))
		:effect  (and (not (ypos ?v1)) (ypos ?v2)))

	(:derived (equalx-xgoal)
		(exists (?val - value) (and (xpos ?val) (xgoal ?val))))

	(:derived (equaly-ygoal)
		(exists (?val - value) (and (ypos ?val) (ygoal ?val))))

	(:derived (not-equalx-xgoal)
		(exists (?val - value) (and (xpos ?val) (not (xgoal ?val)))))

	(:derived (not-equaly-ygoal)
		(exists (?val - value) (and (ypos ?val) (not (ygoal ?val)))))

	;(:derived (in-wall)
	;	(exists (?v1 ?v2 - value) (and (xpos ?v1)(ypos ?v2)(wall ?v1 ?v2)))
	;)
)
