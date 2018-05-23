(define (problem p2x3a)
  (:domain visual-marker )
  (:objects  v0 v1 v2 v3 - value 
  )
  (:init
	( consec v0 v1)
	( consec v1 v2)
	( consec v2 v3)
	(xpos v0)(ypos v0)(xmax v2)(ymax v3)
	(green v1 v0 )
	(block v1 v0 )
	(block v1 v1 )
	(block v1 v2 ) )
  (:goal
	( and ( marked )
	)
  )
)