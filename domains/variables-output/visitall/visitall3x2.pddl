(define (problem prob3x2)
	(:domain variables-output)
	(:objects v0 v1 v2 v3 - value
;	          a b c d - variable
            	  ;;a is xpos
            	  ;;b is ypos
            	  ;;c is xmax
            	  ;;d is ymax
)
	(:init
	 (assignment a v0)
  	 (assignment b v0)
	 (assignment c v3)
	 (assignment d v2)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
	)
	(:goal (and
		(output-two v0 v0)
		(output-two v1 v0)
		(output-two v2 v0)
		(output-two v0 v1)
		(output-two v1 v1)
		(output-two v2 v1)	
	))
)
