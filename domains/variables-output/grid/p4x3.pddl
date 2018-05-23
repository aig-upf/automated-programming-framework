(define (problem p4x3)
  (:domain variables-output )
  (:objects  v0 v1 v2 v3 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( assignment a v1)
	( assignment b v1)
	( assignment c v0)
	( assignment d v0) )
  (:goal
	( and
	( assignment a v0 )
	( assignment b v0 )
	)
  )
)