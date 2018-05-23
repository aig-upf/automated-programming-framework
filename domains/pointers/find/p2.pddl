(define (problem p2)
  (:domain pointers )
  (:objects  v0 v1 - value 
  )
  (:init
	( next v0 v1)
	( vector-assignment v0 v1)
	( vector-assignment v1 v0)
	( assignment a v0 )
	( content a v1 )
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