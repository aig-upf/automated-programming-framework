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
		:parameters ( ?b1 ?b2 - ball ?r - room )
		:precondition( and (free left)(at-robby ?r)(next-ball ?b1)(succ-balls ?b1 ?b2) )
		:effect( and 
				(when (and (at ?b1 ?r))
					(and (carry ?b1 left)(not (at ?b1 ?r))(not (free left))(not (next-ball ?b1))(next-ball ?b2))
				)
		)
	)
	
	(:action pick-right
		:parameters (?b1 ?b2 - ball ?r - room)
		:precondition( and (free right)(at-robby ?r)(next-ball ?b1)(succ-balls ?b1 ?b2) )
		:effect(and 
				(when (and (at ?b1 ?r))
					(and (carry ?b1 right)(not (at ?b1 ?r))(not (free right))(not (next-ball ?b1))(next-ball ?b2))
				)
		)
	)

	(:action drop-left
		:parameters (?b - ball ?r - room)
		:precondition ( and (at-robby ?r))
		:effect( and 
					(free left)
					(when (and (carry ?b left))
						(and (at ?b ?r)(not (carry ?b left)))
					)
		)
	)

	(:action drop-right
		:parameters (?b - ball ?r - room)
		:precondition ( and (at-robby ?r))
		:effect( and 
					(free right)
					(when (and (carry ?b right))
						(and (at ?b ?r)(not (carry ?b right)))
					)
		)
	)

	(:derived (no-balls-in-roomA)
		(and (forall (?b - ball) (and (not (at ?b roomA)) ))))
)
