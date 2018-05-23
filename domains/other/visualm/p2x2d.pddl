(define (problem p2x2d)
  (:domain visual-marker )
  (:objects  v0 v1 v2 - value 
  )
  (:init
	( consec v0 v1)
	( consec v1 v2)
	(xpos v0)(ypos v0)(xmax v2)(ymax v2)
	(green v1 v2 )
	(block v1 v0 )
	(block v1 v1 )
	(block v1 v2 )
	(block v2 v0 )
	(block v2 v1 ) )
  (:goal
	( and ( marked )
	)
  )
)