(define (problem p6x6ab)
  (:domain variables-output)
  (:objects v0 v1 v2 v3 v4 v5 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xgoal
            ;;d is ygoal
)
  (:init (assignment a v2)
  	 (assignment b v4)
	 (assignment c v5)
	 (assignment d v2)
	 (modifiable a)
	 (modifiable b)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
	 (next v3 v4)
	 (next v4 v5)
)
  (:goal (and (assignment a v5)
	      (assignment b v2))))
