(define (problem p10x10b)
  (:domain mgo)
  (:objects v-4 v-3 v-2 v-1 v0 v1 v2 v3 v4 - value )
  (:init  
	(xpos v3) (ypos v-3) (xgoal v-3) (ygoal v1)
	(consec v-4 v-3)(consec v-3 v-2)(consec v-2 v-1)(consec v-1 v0)(consec v0 v1)(consec v1 v2)(consec v2 v3)(consec v3 v4)
  )
  (:goal (and  (xpos v-3) (ypos v1))))
