(define (problem p9b)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 v4 v5 v6 v7 v8 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( next v3 v4)
	( next v4 v5)
	( next v5 v6)
	( next v6 v7)
	( next v7 v8)
	( less v0 v1)
	( less v0 v2)
	( less v0 v3)
	( less v0 v4)
	( less v0 v5)
	( less v0 v6)
	( less v0 v7)
	( less v0 v8)
	( less v1 v2)
	( less v1 v3)
	( less v1 v4)
	( less v1 v5)
	( less v1 v6)
	( less v1 v7)
	( less v1 v8)
	( less v2 v3)
	( less v2 v4)
	( less v2 v5)
	( less v2 v6)
	( less v2 v7)
	( less v2 v8)
	( less v3 v4)
	( less v3 v5)
	( less v3 v6)
	( less v3 v7)
	( less v3 v8)
	( less v4 v5)
	( less v4 v6)
	( less v4 v7)
	( less v4 v8)
	( less v5 v6)
	( less v5 v7)
	( less v5 v8)
	( less v6 v7)
	( less v6 v8)
	( less v7 v8)
	( vector-assignment v0 v1)
	( vector-assignment v1 v4)
	( vector-assignment v2 v7)
	( vector-assignment v3 v7)
	( vector-assignment v4 v7)
	( vector-assignment v5 v8)
	( vector-assignment v6 v3)
	( vector-assignment v7 v3)
	( vector-assignment v8 v3)
	( assignment a v0 )
	( content a v1 )
	( assignment b v0 )
	( content b v1 )
	( assignment tail v8) )
  (:goal
	( and
	( assignment a v8 )
	( content a v3 )
	( assignment b v0 )
	( content b v1 )
	)
  )
)