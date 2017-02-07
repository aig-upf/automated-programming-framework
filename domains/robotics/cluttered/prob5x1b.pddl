(define (problem p5x1b)
  (:domain cluttered)
  (:objects v0 v1 v2 - value )
  (:init  
	(xpos v1)(ypos v2) (xgoal v1)(ygoal v0)
	(consec v0 v1)(consec v1 v2)
	(lessthan v0 v1)(lessthan v0 v2)
	(lessthan v1 v2)
  )
  (:goal (and  (xpos v1)(ypos v0) ) )
)

