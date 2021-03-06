(define (problem infinite3neg)
	(:domain variables)
	(:objects
;		v0 v1 v2 v3 v4 v5 v6 - value
;		a b - variable
		v-1 v2 v3 v4 v5 v6 - value
	)
	(:init
		(assignment a v0)
		(assignment b v0)
		(sum v-1 v0 v-1)
		(sum v-1 v1 v0)
		(sum v-1 v2 v1)
		(sum v-1 v3 v2)
		(sum v-1 v4 v3)
		(sum v-1 v5 v4)
		(sum v-1 v6 v5)
		(sum v0 v-1 v-1)
		(sum v1 v-1 v0)
		(sum v2 v-1 v1)
		(sum v3 v-1 v2)
		(sum v4 v-1 v3)
		(sum v5 v-1 v4)
		(sum v6 v-1 v5)
		(sum v0 v0 v0)
		(sum v0 v1 v1)
		(sum v0 v2 v2)
		(sum v0 v3 v3)
		(sum v0 v4 v4)
		(sum v0 v5 v5)
		(sum v0 v6 v6)
		(sum v1 v0 v1)
		(sum v1 v1 v2)
		(sum v1 v2 v3)
		(sum v1 v3 v4)
		(sum v1 v4 v5)
		(sum v1 v5 v6)
		(sum v2 v0 v2)
		(sum v2 v1 v3)
		(sum v2 v2 v4)
		(sum v2 v3 v5)
		(sum v2 v4 v6)
		(sum v3 v0 v3)
		(sum v3 v1 v4)
		(sum v3 v2 v5)
		(sum v3 v3 v6)
		(sum v4 v0 v4)
		(sum v4 v1 v5)
		(sum v4 v2 v6)
		(sum v5 v0 v5)
		(sum v5 v1 v6)
		(sum v6 v0 v6)
	)
	(:goal (and
		(assignment a v0)
		(assignment b v0)
	))
)
