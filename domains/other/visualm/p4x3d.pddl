(define (problem p4x3d)
  (:domain visual-marker )
  (:objects  v0 v1 v2 v3 v4 - value 
  )
  (:init
	( consec v0 v1)
	( consec v1 v2)
	( consec v2 v3)
	( consec v3 v4)
	(xpos v0)(ypos v0)(xmax v4)(ymax v3)
	(green v1 v1 )
	(block v1 v0 )
	(block v1 v1 )
	(block v1 v2 ) )
  (:goal
	( and ( marked )
	)
  )
)