(define (domain gripper)
   (:requirements :typing)
   (:types room ball gripper)
   (:constants left right - gripper roomA roomB - room)
   (:predicates 
		(at-robby ?r - room)
		(at ?b - ball ?r - room)
		(free ?g - gripper)
		(carry ?o - ball ?g - gripper)
		(succ-balls ?b1 ?b2 - ball)
		(next-ball ?b - ball)
		;(all-balls-in-roomB)
		(no-balls-in-roomA))

   (:action move
       :parameters  ()
       :precondition ( and )
       :effect ( and  
				(when (and (at-robby roomA))
       	       	     	(and (at-robby roomB) (not (at-robby roomA))))
				(when (and (at-robby roomB))
       	       	     	(and (at-robby roomA) (not (at-robby roomB))))))

   (:action pick-left
		:parameters ()
		:precondition( and (free left) )
		:effect( and
			(forall (?b1 ?b2 - ball ?r - room)
				(and 
					(when 	(and (at ?b1 ?r) (at-robby ?r)(next-ball ?b1)(succ-balls ?b1 ?b2))
							(and (carry ?b1 left)(not (at ?b1 ?r))(not (free left))(not (next-ball ?b1))(next-ball ?b2))
					)
				)
			)
		)
	)
	
	(:action pick-right
		:parameters ()
		:precondition( and (free right) )
		:effect(and
			(forall (?b1 ?b2 - ball ?r - room)
				(and 
					(when 	(and (at ?b1 ?r) (at-robby ?r)(next-ball ?b1)(succ-balls ?b1 ?b2))
							(and (carry ?b1 right)(not (at ?b1 ?r))(not (free right))(not (next-ball ?b1))(next-ball ?b2))
					)
				)
			)
		)
	)

	(:action drop-left
		:parameters ()
		:precondition ( and )
		:effect( and
			(forall (?b - ball ?r - room)
				(and 
					(when 	(and (carry ?b left)(at-robby ?r))
							(and (at ?b ?r)(free left)(not (carry ?b left)))
					)
				)
			)
		)
	)

	(:action drop-right
		:parameters ()
		:precondition ( and )
		:effect( and
			(forall (?b - ball ?r - room)
				(and 
					(when 	(and (carry ?b right)(at-robby ?r))
							(and (at ?b ?r)(free right)(not (carry ?b right)))
					)
				)
			)
		)
	)
	
	;(:derived (all-balls-in-roomB)
	;	(and (forall (?b - ball) (and (at ?b roomB) ))))

	(:derived (no-balls-in-roomA)
		(and (forall (?b - ball) (and (not (at ?b roomA)) ))))
)
