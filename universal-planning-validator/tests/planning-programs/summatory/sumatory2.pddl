(define (problem sumatory2)
	(:domain variables)
	(:objects
;		v0 v1 v2 v3 - value
;		a b - variable
		v2 v3 - value
	)
	(:init
		(assignment a v0)
		(assignment b v2)
		(sum v0 v0 v0)
		(sum v0 v1 v1)
		(sum v0 v2 v2)
		(sum v0 v3 v3)
		(sum v1 v0 v1)
		(sum v1 v1 v2)
		(sum v1 v2 v3)
		(sum v2 v0 v2)
		(sum v2 v1 v3)
		(sum v3 v0 v3)
	)
	(:goal (and
		(assignment a v3)
		(assignment b v0)
	))
)
