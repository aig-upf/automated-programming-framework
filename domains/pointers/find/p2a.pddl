(define (problem p2a)
  (:domain pointers )
  (:objects  v0 v1 v2 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( vector-assignment v0 v0)
	( vector-assignment v1 v1)
	( assignment a v0 )
	( content a v0 )
	( assignment c v0 )
	( assignment target v1)
	( assignment tail v1) )
  (:goal
	( and
	( assignment a v1 )
	( assignment c v1 )
	)
  )
)