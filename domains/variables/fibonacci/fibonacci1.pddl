(define (problem p1)
  (:domain variables)
	(:objects
;		v0 v1 - value
;		a b c d - variable
		;;a is fn
		;;b is iter
		;;c is fn1
		;;d is fn2
	)

  (:init 
	(assignment a v1)
	(assignment b v1)
	(assignment c v0)
	(assignment d v0)

	(sum v0 v0 v0)
	(sum v0 v1 v1)
	(sum v1 v0 v1)
  )
  (:goal (and  
	(assignment a v1)
	(assignment b v0)
	(assignment c v1)
	(assignment d v0)
  ))
)
