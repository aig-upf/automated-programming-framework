(define (problem p5x5-1)
  (:domain variables-output)
  (:objects v0 v1 v2 v3 v4 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xmax
            ;;d is ymax
  )

  (:init (assignment a v0)
  	 (assignment b v4)
	 (assignment c v4)
	 (assignment d v4)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
	 (next v3 v4)
)
  (:goal (and  (output-two v0 v0))))
