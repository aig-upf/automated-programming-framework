(define (problem select5-NEG)
	(:domain pointers)
	(:objects
		v0 v1 v2 v3 v4 v5 - value
;		a b tail - variable
		;; a is iterator
		;; b is itermark
	)
	(:init
	        (assignment a v1)
		(content c v1)

	        (assignment b v1)
		(content b v1)

	        (assignment tail v5)

		(vector-assignment v0 v0)
		(vector-assignment v1 v1)
		(vector-assignment v2 v2)
		(vector-assignment v3 v2)
		(vector-assignment v4 v2)
		(vector-assignment v5 v3)

		(next v0 v1)
		(next v1 v2)
		(next v2 v3)
		(next v3 v4)
		(next v4 v5)

		(less v0 v1)
		(less v0 v2)
		(less v0 v3)
		(less v1 v2)
		(less v1 v3)
		(less v2 v3)
	)
	(:goal (and
	        (assignment a v1)
		(content a v1)

	        (assignment b v1)
		(content b v1)
	))
)
