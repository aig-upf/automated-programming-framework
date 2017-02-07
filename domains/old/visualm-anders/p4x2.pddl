(define (problem p4x2)
  (:domain visual-marker)
  (:objects
	v0 v1 v2 v3 - value
  )
  (:init 
	(xpos v0)
	(ypos v0)
	(xmax v3)
	(ymax v1)
	(consec v0 v1)
	(consec v1 v2)
	(consec v2 v3)
	(block v0 v0)
	(block v1 v0)
	(block v2 v0)
	(green v2 v0)
	(block v0 v1)
	(block v1 v1)
  )
  (:goal
	(and (marked))
  )
)
