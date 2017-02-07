(define (problem p1x5a)
  (:domain variables-output)
  (:objects v0 v1 v2 v3 v4 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xgoal
            ;;d is ygoal
)
  (:init (assignment a v0)
  	 (assignment b v0)
	 (assignment c v0)
	 (assignment d v4)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
	 (next v3 v4)
)
  (:goal (and (assignment a v0)
	      (assignment b v4))))
