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
		(all-balls-in-roomB)
		;(no-balls-in-roomA))

   (:action move
       :parameters  ()
       :precondition ( and )
       :effect ( and  
				(when (and (at-robby roomA))
       	       	     	(and (at-robby roomB) (not (at-robby roomA))))
				(when (and (at-robby roomB))
       	       	     	(and (at-robby roomA) (not (at-robby roomB))))))

   (:action pick
		:parameters ( ?g - gripper )
		:precondition( and (free ?g ) )
		:effect( and
			(forall (?b - ball ?r - room)
				(when 	(and (at ?b ?r)(at-robby ?r))
						(and (carry ?b ?g)(not (at ?b ?r))(not (free ?g)) )
				)
			(forall (?b1 ?b2 - ball)
				(and 
					(when 	(and (next-ball ?b1)(succ-balls ?b1 ?b2))
							(and (not (next-ball ?b1))(next-ball ?b2))
					)
				)
			)
		)
	)

	(:action drop
		:parameters ( ?g - gripper )
		:precondition ( and )
		:effect( and
			(forall (?b - ball ?r - room)
				(and 
					(when 	(and (carry ?b ?g)(at-robby ?r))
							(and (at ?b ?r)(free ?g)(not (carry ?b ?g)))
					)
				)
			)
		)
	)
	
	(:derived (all-balls-in-roomB)
		(and (forall (?b - ball) (and (at ?b roomB) ))))

	;(:derived (no-balls-in-roomA)
	;	(and (forall (?b - ball) (and (not (at ?b roomA)) ))))
)
