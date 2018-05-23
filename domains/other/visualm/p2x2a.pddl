(define (problem p2x2a)
  (:domain visual-marker )
  (:objects  v0 v1 v2 - value 
  )
  (:init
	( consec v0 v1)
	( consec v1 v2)
	(xpos v0)(ypos v0)(xmax v2)(ymax v2)
	(green v0 v0 )
	(block v0 v0 )
	(block v0 v1 )
	(block v1 v0 )
	(block v1 v1 ) )
  (:goal
	( and ( marked )
	)
  )
)