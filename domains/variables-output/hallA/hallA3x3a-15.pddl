(define (problem p3x3a-15)
  (:domain variables-output)
  (:objects v0 v1 v2 - value 
;  	    a b c d - variable
            ;;a is xpos
            ;;b is ypos
            ;;c is xmax
            ;;d is ymax
  )
  
  (:init (assignment a v0)
  	 (assignment b v0)
	 (next v0 v1)
	 (next v1 v2)
	 (not-output-two v0 v0)(not-output-two v0 v1)(not-output-two v0 v2)
	 (not-output-two v1 v0)(not-output-two v1 v1)(not-output-two v1 v2)
	 (not-output-two v2 v0)(not-output-two v2 v1)(not-output-two v2 v2)
)
  (:goal (and  
	 (output-two v0 v0)    (not-output-two v0 v1)(output-two v0 v2)
	 (not-output-two v1 v0)(not-output-two v1 v1)(not-output-two v1 v2)
	 (output-two v2 v0)    (not-output-two v2 v1)(output-two v2 v2))))
