(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block columns)
  (:predicates (on ?x - block ?y - block)
	       (ontable ?x - block)
	       (clear ?x - block)
	       (handempty)
	       (holding ?x - block)
			(all-clear)
			(goal-towers)
			(goal-columns ?c - columns)
			(current-columns ?c - columns)
			(adjacent-columns ?c1 ?c2 - columns)
	       )

  (:action pick-up
	     :parameters (?x - block)
	     :precondition (and (clear ?x) (ontable ?x) (handempty))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (handempty))
		   (holding ?x)
		   (forall (?c1 ?c2 - columns) 
			(and (when 
				(and (adjacent-columns ?c1 ?c2)(current-columns ?c2) )
				(and (not (current-columns ?c2))(current-columns ?c1) )
			))
		   )
		 )
  )

  (:action put-down
	     :parameters (?x - block )
	     :precondition (holding ?x)
	     :effect
	     (and (not (holding ?x))
		   (clear ?x)
		   (handempty)
		   (ontable ?x)
		   (forall (?c1 ?c2 - columns) (and 
			(when (and (adjacent-columns ?c1 ?c2)(current-columns ?c1) )
				(and (not (current-columns ?c1))(current-columns ?c2) )
			)))))

  (:action stack
	     :parameters (?x - block ?y - block)
	     :precondition (and (holding ?x) (clear ?y))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (handempty)
		   (on ?x ?y)))
  (:action unstack
	     :parameters (?x - block ?y - block)
	     :precondition (and (on ?x ?y) (clear ?x) (handempty))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (handempty))
		   (not (on ?x ?y))))

  (:derived (all-clear)
	(forall (?b - block) (and (clear ?b) ) )
  )
  (:derived (goal-towers)
	(exists (?c - columns) (and (goal-columns ?c)(current-columns ?c) ) )
  )
)
