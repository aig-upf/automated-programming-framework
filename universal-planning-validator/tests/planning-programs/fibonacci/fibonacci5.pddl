(define (problem p5)
  (:domain variables)
  (:objects 
;		v0 v1 v2 v3 v4 v5 v6 v7 v8 - value
;		a b c d - variable
		;;a is fn
		;;b is iter
		;;c is fn1
		;;d is fn2
		v2 v3 v4 v5 v6 v7 v8 - value
  )
  (:init 
		(assignment a v1)
		(assignment b v5)
		(assignment c v0)
		(assignment d v0)

		(sum v0 v0 v0)(sum v0 v1 v1)(sum v0 v2 v2)(sum v0 v3 v3)(sum v0 v4 v4)(sum v0 v5 v5)(sum v0 v6 v6)(sum v0 v7 v7)(sum v0 v8 v8)
		(sum v1 v0 v1)(sum v1 v1 v2)(sum v1 v2 v3)(sum v1 v3 v4)(sum v1 v4 v5)(sum v1 v5 v6)(sum v1 v6 v7)(sum v1 v7 v8)
		(sum v2 v0 v2)(sum v2 v1 v3)(sum v2 v2 v4)(sum v2 v3 v5)(sum v2 v4 v6)(sum v2 v5 v7)(sum v2 v6 v8)
		(sum v3 v0 v3)(sum v3 v1 v4)(sum v3 v2 v5)(sum v3 v3 v6)(sum v3 v4 v7)(sum v3 v5 v8)
		(sum v4 v0 v4)(sum v4 v1 v5)(sum v4 v2 v6)(sum v4 v3 v7)(sum v4 v4 v8)
		(sum v5 v0 v5)(sum v5 v1 v6)(sum v5 v2 v7)(sum v5 v3 v8)
		(sum v6 v0 v6)(sum v6 v1 v7)(sum v6 v2 v8)
		(sum v7 v0 v7)(sum v7 v1 v8)
		(sum v8 v0 v8)
  )
	(:goal (and
		(assignment a v8)
		(assignment b v0)
		(assignment c v5)
		(assignment d v3)
	))
)



