(define (problem p5x1)
  (:domain visual-marker)
  (:objects
	v0 v1 v2 v3 v4 - value
  )
  (:init
	(xpos v0)
	(ypos v0)
	(xmax v4)
	(ymax v0)
	(consec v0 v1)
	(consec v1 v2)
	(consec v2 v3)
	(consec v3 v4)
	(block v0 v0)
	(block v1 v0)
	(block v2 v0)
	(block v3 v0)
	(green v3 v0)
  )
  (:goal
	(and (marked))
  )
)
