(define (problem p4x4bb)
  (:domain cluttered)
  (:objects v0 v1 v2 v3 - value )
  (:init  
	(xpos v3) (ypos v3) (xgoal v0) (ygoal v0)
	(consec v0 v1)(consec v1 v2)(consec v2 v3)
	(lessthan v0 v1)(lessthan v0 v2)(lessthan v0 v3)
	(lessthan v1 v2)(lessthan v1 v3)(lessthan v2 v3)
  )
  (:goal (and  (xgoal v0) (ygoal v0))))

