(define (domain cluttered)
	(:requirements :typing)
	(:types value)
	(:predicates
		(xpos ?val - value)
		(ypos ?val - value)
		(xgoal ?val - value)
		(ygoal ?val - value)
		(consec ?v1 ?v2 - value)
		(lessthan ?v1 ?v2 - value )
		(x-less-than-xgoal)
		(y-less-than-ygoal)
		(x-greater-than-xgoal)
		(y-greater-than-ygoal)
		(x-equal-xgoal)
		(y-equal-ygoal)
	)

	(:action xinc
		:parameters (?v1 ?v2 ?v3 - value)
		:precondition (and (xpos ?v1)(ypos ?v3) (consec ?v1 ?v2)) 
		:effect (and (not (xpos ?v1)) (xpos ?v2)))

	(:action xdec
		:parameters (?v1 ?v2 ?v3 - value)
		:precondition (and (xpos ?v2)(ypos ?v3)(consec ?v1 ?v2)) 
		:effect (and (not (xpos ?v2)) (xpos ?v1)))

	(:action yinc
		:parameters (?v1 ?v2 ?v3 - value)
		:precondition (and (ypos ?v1)(xpos ?v3)(consec ?v1 ?v2))
		:effect  (and (not (ypos ?v1)) (ypos ?v2)))

	(:action ydec
		:parameters (?v1 ?v2 ?v3 - value)
		:precondition (and (ypos ?v2)(xpos ?v3)(consec ?v1 ?v2))
		:effect  (and (not (ypos ?v2)) (ypos ?v1)))

	(:derived (x-less-than-xgoal)
		(exists (?v1 ?v2 - value) (and (xpos ?v1)(xgoal ?v2)(lessthan ?v1 ?v2)))
	)
	(:derived (y-less-than-ygoal)
		(exists (?v1 ?v2 - value) (and (ypos ?v1)(ygoal ?v2)(lessthan ?v1 ?v2)))
	)
	
	(:derived (x-greater-than-xgoal)
		(exists (?v1 ?v2 - value) (and (xpos ?v1)(xgoal ?v2)(lessthan ?v2 ?v1)))
	)

	(:derived (y-greater-than-ygoal)
		(exists (?v1 ?v2 - value) (and (ypos ?v1)(ygoal ?v2)(lessthan ?v2 ?v1)))
	)
	
	(:derived (x-equal-xgoal)
		(exists (?v - value) (and (xpos ?v)(xgoal ?v)))
	)

	(:derived (y-equal-ygoal)
		(exists (?v - value) (and (ypos ?v)(ygoal ?v)))
	)
)
