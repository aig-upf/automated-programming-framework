(define (problem or4)
	(:domain programming)
	(:objects zero one - relation x1 x2 - value )
	(:init
		(ordinal-1ary zero)
		(ordinal-1ary one)
		(includes-1ary one x1)
		(includes-1ary one x2)
	)
	(:goal (and
		(assignment y v1)
	))
)
