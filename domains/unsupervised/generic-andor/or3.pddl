(define (problem and3)
	(:domain programming)
	;(:objects zero one - relation x1 x2 - value )
	(:objects )
	(:init
		(ordinal-1ary zero)
		(ordinal-1ary one)
		(includes-1ary one x1)
		(includes-1ary zero x2)
	)
	(:goal (and
		(assignment y v1)
	))
)
