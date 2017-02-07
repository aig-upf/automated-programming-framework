(define (problem p4x4-8)
  (:domain variables-output)
  (:objects v0 v1 v2 v3 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xmax
            ;;d is ymax
  )
  
  (:init (assignment a v0)
  	 (assignment b v0)
	 (assignment c v3)
	 (assignment d v3)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
)
  (:goal (and  (output-two v0 v3) )))
