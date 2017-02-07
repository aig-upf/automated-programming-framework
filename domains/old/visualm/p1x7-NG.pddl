(define (problem p1x4-0-1-08092015155036)
  (:domain visual-marker)
  (:objects x0 - xpos y0 y1 y2 y3 y4 y5 y6 - ypos )
  (:init 
	(agent-x x0) (agent-y y5) 
	(xmax x0)(ymax y4)
	(suc-y y0 y1)(suc-y y1 y2)(suc-y y2 y3)(suc-y y3 y4)(suc-y y4 y5)(suc-y y5 y6)
	(block x0 y0)(block x0 y1)(block x0 y2)(block x0 y3)(block x0 y4)(block x0 y5)(block x0 y6))
  (:goal (and (agent-x x0) (agent-y y0))))
