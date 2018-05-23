(define (problem p2x2a)
  (:domain variables-output )
  (:objects  v0 v1 - value 
  )
  (:init
	( next v0 v1)
	( not-output-two v0 v0)
	( not-output-two v0 v1)
	( not-output-two v1 v0)
	( not-output-two v1 v1)
	( assignment a v0)
	( assignment b v0)
	( assignment c v1)
	( assignment d v1) )
  (:goal
	( and
	( output-two v0 v0 )
	( output-two v0 v1 )
	( output-two v1 v0 )
	( output-two v1 v1 )
	)
  )
)