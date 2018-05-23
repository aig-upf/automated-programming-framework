(define (problem p4a)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( vector-assignment v0 v1)
	( vector-assignment v1 v1)
	( vector-assignment v2 v2)
	( vector-assignment v3 v1)
	( assignment a v0 )
	( content a v1 )
	( assignment c v0 )
	( assignment target v2)
	( assignment tail v3) )
  (:goal
	( and
	( assignment a v3 )
	( assignment c v1 )
	)
  )
)