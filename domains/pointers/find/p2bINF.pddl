(define (problem p2b)
  (:domain pointers )
  (:objects  v0 v1 - value 
  )
  (:init
	( next v0 v1)
	( vector-assignment v0 v1)
	( vector-assignment v1 v1)
	( assignment a v0 )
	( content a v1 )
	( assignment c v0 )
	( assignment target v0)
	( assignment tail v1) )
  (:goal
	( and
	( assignment a v1 )
	( assignment c v0 )
	)
  )
)