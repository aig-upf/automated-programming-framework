(define (problem p4)
  (:domain variables)
	(:objects
;		v0 v1 v2 v3 v4 v5 - value
;		a b c d - variable
		;;a is fn
		;;b is iter
		;;c is fn1
		;;d is fn2
		v2 v3 v4 v5 - value
	)
  (:init 
		(assignment a v1)
		(assignment b v4)
		(assignment c v0)
		(assignment d v0)

	(sum v0 v0 v0)(sum v0 v1 v1)(sum v0 v2 v2)(sum v0 v3 v3)(sum v0 v4 v4)(sum v0 v5 v5)
	(sum v1 v0 v1)(sum v1 v1 v2)(sum v1 v2 v3)(sum v1 v3 v4)(sum v1 v4 v5)
	(sum v2 v0 v2)(sum v2 v1 v3)(sum v2 v2 v4)(sum v2 v3 v5)
	(sum v3 v0 v3)(sum v3 v1 v4)(sum v3 v2 v5)
	(sum v4 v0 v4)(sum v4 v1 v5)
	(sum v5 v0 v5)
  )
	(:goal (and
		(assignment a v5)
		(assignment b v0)
		(assignment c v3)
		(assignment d v2)
	))
)