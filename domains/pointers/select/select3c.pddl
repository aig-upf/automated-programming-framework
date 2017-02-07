(define (problem select3c)
	(:domain pointers)
	(:objects
		v0 v1 v2 v3 - value
;		a b tail - variable
		;; a is iterator
		;; b is itermark
	)
	(:init
		(assignment a v0)
		(content a v2)

		(assignment b v0)
		(content b v2)

		(assignment tail v3)

		(vector-assignment v0 v2)
		(vector-assignment v1 v1)
		(vector-assignment v2 v3)
		(vector-assignment v3 v3)

		(next v0 v1)
		(next v1 v2)
		(next v2 v3)

		(less v0 v1)
		(less v0 v2)
		(less v0 v3)
		(less v1 v2)
		(less v1 v3)
		(less v2 v3)
	)
	(:goal (and
		(assignment a v3)
		(content a v3)

		(assignment b v1)
		(content b v1)
	))
)
