(define (problem p6x1)
  (:domain visual-marker)
  (:objects
	v0 v1 v2 v3 v4 v5 - value
  )
  (:init
	(xpos v0)
	(ypos v0)
	(xmax v5)
	(ymax v0)
	(consec v0 v1)
	(consec v1 v2)
	(consec v2 v3)
	(consec v3 v4)
	(consec v4 v5)
	(block v0 v0)
	(green v0 v0)
  )
  (:goal
	(and (marked))
  )
)
