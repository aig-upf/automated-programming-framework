(define (problem p2)
  (:domain variables)
	(:objects
;		v0 v1 v2 - value
;		a b c d - variable
		;;a is fn
		;;b is iter
		;;c is fn1
		;;d is fn2

		v2 - value
	)

  (:init 
		(assignment a v1)
		(assignment b v2)
		(assignment c v0)
		(assignment d v0)

		(sum v0 v0 v0)
		(sum v0 v1 v1)
		(sum v0 v2 v2)
		(sum v1 v0 v1)
		(sum v1 v1 v2)
		(sum v2 v0 v2)
  )
  (:goal (and  
		(assignment a v2)
		(assignment b v0)
		(assignment c v1)
		(assignment d v1)
	))
)
