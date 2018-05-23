(define (problem p2)
  (:domain variables-output )
  (:objects  v0 v1 v2 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( assignment a v0 )
	( assignment b v0 )
	( assignment c v2 )
	( assignment d v2 ) )
  (:goal
	( and
	( output-two v0 v0 )
	( output-two v0 v1 )
	( output-two v1 v0 )
	( output-two v1 v1 )
	)
  )
)