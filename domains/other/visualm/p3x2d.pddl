(define (problem p3x2d)
  (:domain visual-marker )
  (:objects  v0 v1 v2 v3 - value 
  )
  (:init
	( consec v0 v1)
	( consec v1 v2)
	( consec v2 v3)
	(xpos v0)(ypos v0)(xmax v3)(ymax v2)
	(green v1 v2 )
	(block v0 v0 )
	(block v0 v1 )
	(block v1 v0 )
	(block v1 v1 )
	(block v1 v2 ) )
  (:goal
	( and ( marked )
	)
  )
)