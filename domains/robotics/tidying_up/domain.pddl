(define (domain tidying-up)
	(:requirements :typing )
	(:types ball region value)
	(:predicates 
		(grasped ?b - ball)
		(placed-ball ?b - ball)
		(placed-region ?r - region ?b - ball)
		(balls-to-place ?v - value)
		(next-value ?v1 ?v2 - value)
		(next-ball ?b1 ?b2 - ball)
		(current-ball ?b - ball)
	)

	(:action grasp
		:parameters( )
		:precondition( )
		:effect(and
			(forall (?b - ball) 
				(when (and (current-ball ?b)(not (grasped ?b))) 
					(grasped ?b)
				)
			)
		)
	)

	(:action place
		:parameters( )
		:precondition( )
		:effect(and
			(forall (?b - ball ?r - region )
				(when (and (grasped ?b)(not (placed-ball ?b))(not (placed-region ?r ?b)) )
					(and (not (grasped ?b))(placed-ball ?b)(placed-region ?r ?b))
				)
			)
		)
	)

	(:action dec-balls-to-place
		:parameters( )
		:precondition ()
		:effect(and
			(forall (?v1 ?v2 - value)
				(when (and (balls-to-place ?v2)(next-value ?v1 ?v2) )
					(and (not (balls-to-place ?v2) )(balls-to-place ?v1))
				)
			)
		)
	)
	
	(:action next-ball
		:parameters(  )
		:precondition( )
		:effect( and 
			(forall (?b1 ?b2 - ball)
				(when (and (current-ball ?b1)(placed-ball ?b1)(next-ball ?b1 ?b2) )
					(and (not (current-ball ?b1))(current-ball ?b2))
				)
			)
		)
	)
)
