(define (problem sumatory-1)
	(:domain variables)
	(:objects
;		v0 v1 v2 v3 - value
;		a b - variable
		v-1 v2 v3 - value
	)
	(:init
		(assignment a v0)
		(assignment b v1)
		(sum v-1 v0 v-1)
		(sum v-1 v1 v0)
		(sum v-1 v2 v1)
		(sum v-1 v3 v2)
		(sum v0 v-1 v-1)
		(sum v1 v-1 v0)
		(sum v2 v-1 v1)
		(sum v3 v-1 v2)
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
		(assignment a v1)
		(assignment b v0)
	))
)
