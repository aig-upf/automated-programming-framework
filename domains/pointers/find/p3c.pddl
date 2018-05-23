(define (problem p3c)
  (:domain pointers )
  (:objects  v0 v1 v2 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( vector-assignment v0 v0)
	( vector-assignment v1 v0)
	( vector-assignment v2 v1)
	( assignment a v0 )
	( content a v0 )
	( assignment c v0 )
	( assignment target v1)
	( assignment tail v2) )
  (:goal
	( and
	( assignment a v2 )
	( assignment c v1 )
	)
  )
)