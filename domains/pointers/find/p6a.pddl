(define (problem p6a)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 v4 v5 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( next v3 v4)
	( next v4 v5)
	( vector-assignment v0 v3)
	( vector-assignment v1 v1)
	( vector-assignment v2 v1)
	( vector-assignment v3 v4)
	( vector-assignment v4 v2)
	( vector-assignment v5 v3)
	( assignment a v0 )
	( content a v3 )
	( assignment c v0 )
	( assignment target v3)
	( assignment tail v5) )
  (:goal
	( and
	( assignment a v5 )
	( assignment c v2 )
	)
  )
)