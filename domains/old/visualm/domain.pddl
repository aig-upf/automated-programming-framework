(define (domain visual-marker)
  (:requirements :typing)	
  (:types xpos ypos)
  (:predicates (suc-x ?x1 ?x2 - xpos)
               (suc-y ?y1 ?y2 - ypos)
               (agent-x ?x - xpos)
               (agent-y ?y - ypos)
               (block ?x - xpos ?y - ypos)
               (green ?x - xpos ?y - ypos)
	       (obs-block) (obs-green)(no-obs-green)(no-obs-block)
	       (xmax ?x - xpos)
	       (ymax ?y - ypos)
	       (equalx-xmax)
	       (equaly-ymax)
		   (marked) )

  (:action up
    :parameters ()
    :precondition () 
    :effect (forall (?y1 ?y2 - ypos)
              (when (and (suc-y ?y1 ?y2) (agent-y ?y1))
	      	    (and (agent-y ?y2) (not (agent-y ?y1))))))

  (:action down
    :parameters ()
    :precondition () 
    :effect (forall (?y1 ?y2 - ypos)
              (when (and (suc-y ?y1 ?y2) (agent-y ?y2))
	      	    (and (agent-y ?y1) (not (agent-y ?y2))))))

  (:action right
    :parameters ()
    :precondition () 
    :effect (forall (?x1 ?x2 - xpos)
    	      (when (and (suc-x ?x1 ?x2) (agent-x ?x1))
	      	    (and (agent-x ?x2) (not (agent-x ?x1))))))

  (:action left
    :parameters ()
    :precondition () 
    :effect (forall (?x1 ?x2 - xpos)
    	      (when (and (suc-x ?x1 ?x2) (agent-x ?x2))
	      	    (and (agent-x ?x1) (not (agent-x ?x2)))))) 

  ;(:action mark-green-block
  ;   :parameters  ()
  ;   :precondition ()
  ;   :effect
  ;    (forall (?x - xpos ?y - ypos)
  ;      (when (and (agent-x ?x) (agent-y ?y) (green ?x ?y))
  ;        (marked)))
  ;)

  (:action mark-green-block
     :parameters  ()
     :precondition (and (obs-green) )
     :effect
      (and (marked) )
  )

  (:derived (obs-block)
	 (exists  (?x - xpos ?y - ypos) (and (agent-x ?x) (agent-y ?y) (block ?x ?y) )))

  (:derived (obs-green)
     (exists  (?x - xpos ?y - ypos) (and (agent-x ?x) (agent-y ?y) (green ?x ?y))))

	(:derived (no-obs-green)
     (exists  (?x - xpos ?y - ypos) (and (agent-x ?x) (agent-y ?y) (not (green ?x ?y)))))

(:derived (no-obs-block)
	 (exists  (?x - xpos ?y - ypos) (and (agent-x ?x) (agent-y ?y) (not (block ?x ?y)) )))

  (:derived (equalx-xmax)
     (exists (?x - xpos) (and (agent-x ?x) (xmax ?x))))

  (:derived (equaly-ymax)
     (exists (?y - ypos) (and (agent-y ?y) (ymax ?y))))


)
