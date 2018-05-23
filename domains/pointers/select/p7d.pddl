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
	( less v0 v1)
	( less v0 v2)
	( less v0 v3)
	( less v0 v4)
	( less v0 v5)
	( less v0 v6)
	( less v1 v2)
	( less v1 v3)
	( less v1 v4)
	( less v1 v5)
	( less v1 v6)
	( less v2 v3)
	( less v2 v4)
	( less v2 v5)
	( less v2 v6)
	( less v3 v4)
	( less v3 v5)
	( less v3 v6)
	( less v4 v5)
	( less v4 v6)
	( less v5 v6)
	( vector-assignment v0 v4)
	( vector-assignment v1 v6)
	( vector-assignment v2 v4)
	( vector-assignment v3 v0)
	( vector-assignment v4 v3)
	( vector-assignment v5 v6)
	( vector-assignment v6 v4)
	( assignment a v0 )
	( content a v4 )
	( assignment b v0 )
	( content b v4 )
	( assignment tail v6) )
  (:goal
	( and
	( assignment a v6 )
	( content a v4 )
	( assignment b v3 )
	( content b v0 )
	)
  )
)