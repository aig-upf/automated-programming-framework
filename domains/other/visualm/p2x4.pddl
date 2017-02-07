(define (problem p2x4)
  (:domain visual-marker)
  (:objects
	v0 v1 v2 v3 - value
  )
  (:init 
	(xpos v0)
	(ypos v0)
	(xmax v1)
	(ymax v3)
	(consec v0 v1)
	(consec v1 v2)
	(consec v2 v3)
	(block v0 v0)
	(block v0 v2)
	(green v0 v2)
	(block v0 v3)
  )
  (:goal
	(and (marked))
  )
)
