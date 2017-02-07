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
		:parameters(?b - ball)
		:precondition(and (current-ball ?b)(not (grasped ?b)))
		:effect(and (grasped ?b) )
	)

	(:action place
		:parameters(?b - ball ?r - region )
		:precondition(and (grasped ?b)(not (placed-ball ?b))(not (placed-region ?r ?b)))
		:effect(and (not (grasped ?b))(placed-ball ?b)(placed-region ?r ?b))
	)

	(:action dec-balls-to-place
		:parameters(?v1 ?v2 - value)
		:precondition (and (balls-to-place ?v2)(next-value ?v1 ?v2))
		:effect(and (not (balls-to-place ?v2) )(balls-to-place ?v1))
	)
	
	(:action next-ball
		:parameters(?b1 ?b2 - ball)
		:precondition(and (current-ball ?b1)(placed-ball ?b1)(next-ball ?b1 ?b2))
		:effect(and (not (current-ball ?b1))(current-ball ?b2))
	)
)
