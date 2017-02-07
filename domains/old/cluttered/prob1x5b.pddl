(define (problem p1x5b)
  (:domain cluttered)
  (:objects v0 v1 v2 v3 v4 - value )
  (:init  
	(xpos v4) (ypos v2) (xgoal v0) (ygoal v2)
	(consec v0 v1)(consec v1 v2)(consec v2 v3)(consec v3 v4)
	(lessthan v0 v1)(lessthan v0 v2)(lessthan v0 v3)
	(lessthan v1 v2)(lessthan v1 v3)(lessthan v2 v3)
	(lessthan v0 v4)(lessthan v1 v4)(lessthan v2 v4)(lessthan v3 v4)
  )
  (:goal (and  (xpos v0) (ypos v2))))

