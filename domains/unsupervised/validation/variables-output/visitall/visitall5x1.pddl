(define (problem prob5x1)
	(:domain variables-output)
	(:objects v0 v1 v2 v3 v4 v5 - value 	          
;		  a b c d - variable
            	  ;;a is xpos
            	  ;;b is ypos
            	  ;;c is xmax
            	  ;;d is ymax
)
	(:init
	 (assignment a v0)
  	 (assignment b v0)
	 (assignment c v5)
	 (assignment d v5)
	 (next v0 v1)
	 (next v1 v2)
	 (next v2 v3)
	 (next v3 v4)
	 (next v4 v5)
	)
	(:goal (and
		(output-two v0 v0)
		(output-two v1 v0)
		(output-two v2 v0)
		(output-two v3 v0)
		(output-two v4 v0)		
	))
)
