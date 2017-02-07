(define (problem select2)
	(:domain pointers)
	(:objects
		v0 v1 v2 - value
;		a b tail - variable
		;; a is iterator
		;; b is itermark
	)
	(:init
		(assignment a v0)
		(content a v1)

		(assignment b v0)
		(content b v1)

		(assignment tail v2)

		(vector-assignment v0 v1)
		(vector-assignment v1 v0)
		(vector-assignment v2 v2)

		(next v0 v1)
		(next v1 v2)

		(less v0 v1)
		(less v0 v2)
		(less v1 v2)
	)
	(:goal (and
		(assignment a v2)
		(content a v2)

		(assignment b v1)
		(content b v0)
	))
)
