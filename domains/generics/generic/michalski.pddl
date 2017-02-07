(define (problem list3)
	(:domain programming)
	(:objects
		next - relation
		left right - value
		direction - variable
	)
	(:init
		(assignment direction left)
		(ordinal-2ary next)
		(includes-2ary next left right)
	)
	(:goal (and
		(assignment direction left)
	))
)
