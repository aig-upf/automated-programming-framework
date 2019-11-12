(define (problem p3x3bb-2)
  (:domain variables-output)
  (:objects v0 v1 v2 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xgoal
            ;;d is ygoal
)
  (:init (assignment a v2)
  	 (assignment b v2)
	 (next v0 v1)
	 (next v1 v2)
)
  (:goal (and (assignment a v0)
	      (assignment b v0))))
