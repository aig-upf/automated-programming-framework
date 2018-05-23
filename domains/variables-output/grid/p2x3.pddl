(define (problem p2x3)
  (:domain variables-output )
  (:objects  v0 v1 v2 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( assignment a v0)
	( assignment b v2)
	( assignment c v1)
	( assignment d v0) )
  (:goal
	( and
	( assignment a v1 )
	( assignment b v0 )
	)
  )
)