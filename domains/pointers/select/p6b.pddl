(define (problem p6b)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 v4 v5 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( next v3 v4)
	( next v4 v5)
	( less v0 v1)
	( less v0 v2)
	( less v0 v3)
	( less v0 v4)
	( less v0 v5)
	( less v1 v2)
	( less v1 v3)
	( less v1 v4)
	( less v1 v5)
	( less v2 v3)
	( less v2 v4)
	( less v2 v5)
	( less v3 v4)
	( less v3 v5)
	( less v4 v5)
	( vector-assignment v0 v0)
	( vector-assignment v1 v2)
	( vector-assignment v2 v2)
	( vector-assignment v3 v5)
	( vector-assignment v4 v0)
	( vector-assignment v5 v0)
	( assignment a v0 )
	( content a v0 )
	( assignment b v0 )
	( content b v0 )
	( assignment tail v5) )
  (:goal
	( and
	( assignment a v5 )
	( content a v0 )
	( assignment b v0 )
	( content b v0 )
	)
  )
)