(define (problem p3-2)
  (:domain 1lane)
  (:objects v0 v1 v2 - value )
  (:init 
	(xpos v1)(xgoal v2) 
	(consec v0 v1)
	(consec v1 v2))
  (:goal (and  (visited v2) )))
