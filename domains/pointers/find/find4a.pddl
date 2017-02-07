(define (problem find4a)
	(:domain pointers)
	(:objects
		v0 v1 v2 v3 - value
;		a c target tail - variable
		;; a is iterator
		;; c is counter
	)
	(:init
		(assignment a v0)
		(content a v2)	
		(assignment c v0)
		(assignment target v1)
		(assignment tail v3)
		(vector-assignment v0 v2)
		(vector-assignment v1 v3)
		(vector-assignment v2 v1)
		(vector-assignment v3 v0)
		(next v0 v1)
		(next v1 v2)
		(next v2 v3)
	)
	(:goal (and
		(assignment a v3)
		(assignment c v1)
	))
)
