(define (problem p4x4bb-2)
  (:domain variables-output)
  (:objects v0 v1 v2 v3 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xgoal
            ;;d is ygoal
)
  (:init (assignment a v3)
  	 (assignment b v3)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
)
  (:goal (and (assignment a v0)
	      (assignment b v0))))
