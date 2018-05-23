(define (problem p5x5)
  (:domain variables-output )
  (:objects  v0 v1 v2 v3 v4 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( next v3 v4)
	( assignment a v3)
	( assignment b v2)
	( assignment c v4)
	( assignment d v0) )
  (:goal
	( and
	( assignment a v4 )
	( assignment b v0 )
	)
  )
)