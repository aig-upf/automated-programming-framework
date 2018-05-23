(define (problem reverse3)
	(:domain pointers)
	(:objects
		v0 v1 v2 - value
;		a b - variable
	)
	(:init
		(assignment a v0)
		(content a v1)
		(assignment b v2)
		(content b v2)
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
		(vector-assignment v0 v2)
		(vector-assignment v1 v0)
		(vector-assignment v2 v1)
		(assignment a v1)
		(assignment b v1)
	))
)
