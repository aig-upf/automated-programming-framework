(define (domain visual-marker)
  (:requirements :typing)	
  (:types value)
  (:predicates
		(xpos ?val - value)
		(ypos ?val - value)
		(xmax ?val - value)
		(ymax ?val - value)
		(consec ?val1 ?val2 - value)
		(block ?val1 ?val2 - value)
		(green ?val1 ?val2 - value)
		(marked)
		(equalx-xmax)
		(equaly-ymax)
		(obs-block)
		(obs-green)
  )

  (:action up
	:parameters (?v1 ?v2 - value)
	:precondition (and (not (ymax ?v1)) (consec ?v1 ?v2) (ypos ?v1)) 
	:effect (and (ypos ?v2) (not (ypos ?v1))))

  (:action down
    :parameters (?v1 ?v2 - value)
    :precondition (and (consec ?v1 ?v2) (ypos ?v2)) 
	:effect (and (ypos ?v1) (not (ypos ?v2))))

  (:action right
    :parameters (?v1 ?v2 - value)
    :precondition (and (not (xmax ?v1)) (consec ?v1 ?v2) (xpos ?v1)) 
	:effect (and (xpos ?v2) (not (xpos ?v1))))

  (:action left
    :parameters (?v1 ?v2 - value)
    :precondition (and (consec ?v1 ?v2) (xpos ?v2))
	:effect (and (xpos ?v1) (not (xpos ?v2))))

  (:action mark-green-block
     :parameters  ()
     :precondition (obs-green)
     :effect (and (marked)))

  (:derived (obs-block)
	 (exists (?v1 ?v2 - value) (and (xpos ?v1) (ypos ?v2) (block ?v1 ?v2))))

  (:derived (obs-green)
	 (exists (?v1 ?v2 - value) (and (xpos ?v1) (ypos ?v2) (block ?v1 ?v2) (green ?v1 ?v2))))

  (:derived (equalx-xmax)
     (exists (?v - value) (and (xpos ?v) (xmax ?v))))

  (:derived (equaly-ymax)
     (exists (?v - value) (and (ypos ?v) (ymax ?v))))
)
