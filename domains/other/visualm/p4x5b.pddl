(define (problem p4x5b)
  (:domain visual-marker )
  (:objects  v0 v1 v2 v3 v4 v5 - value 
  )
  (:init
	( consec v0 v1)
	( consec v1 v2)
	( consec v2 v3)
	( consec v3 v4)
	( consec v4 v5)
	(xpos v0)(ypos v0)(xmax v4)(ymax v5)
	(green v4 v1 )
	(block v0 v0 )
	(block v0 v1 )
	(block v0 v2 )
	(block v0 v3 )
	(block v0 v4 )
	(block v1 v0 )
	(block v1 v1 )
	(block v1 v2 )
	(block v1 v3 )
	(block v3 v0 )
	(block v3 v1 )
	(block v4 v0 )
	(block v4 v1 )
	(block v4 v2 )
	(block v4 v3 )
	(block v4 v4 )
	(block v4 v5 ) )
  (:goal
	( and ( marked )
	)
  )
)