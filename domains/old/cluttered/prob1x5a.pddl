(define (problem p1x5a)
  (:domain cluttered)
  (:objects v0 v1 v2 v3 - value )
  (:init  
	(xpos v0) (ypos v1) (xgoal v3) (ygoal v1)
	(consec v0 v1)(consec v1 v2)(consec v2 v3)
	(lessthan v0 v1)(lessthan v0 v2)(lessthan v0 v3)
	(lessthan v1 v2)(lessthan v1 v3)
	(lessthan v2 v3)
  )
  (:goal (and  (xpos v3) (ypos v1))))

