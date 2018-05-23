(define (problem p7d)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 v4 v5 v6 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( next v3 v4)
	( next v4 v5)
	( next v5 v6)
	( vector-assignment v0 v5)
	( vector-assignment v1 v5)
	( vector-assignment v2 v2)
	( vector-assignment v3 v3)
	( vector-assignment v4 v0)
	( vector-assignment v5 v2)
	( vector-assignment v6 v5)
	( assignment a v0 )
	( content a v5 )
	( assignment c v0 )
	( assignment target v0)
	( assignment tail v6) )
  (:goal
	( and
	( assignment a v6 )
	( assignment c v1 )
	)
  )
)