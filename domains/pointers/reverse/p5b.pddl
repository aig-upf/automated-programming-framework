(define (problem p5b)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 v4 - value 
  )
  (:init
	( next v0 v1)
	( next v1 v2)
	( next v2 v3)
	( next v3 v4)
	( less v0 v1)
	( less v0 v2)
	( less v0 v3)
	( less v0 v4)
	( less v1 v2)
	( less v1 v3)
	( less v1 v4)
	( less v2 v3)
	( less v2 v4)
	( less v3 v4)
	( vector-assignment v0 v1)
	( vector-assignment v1 v1)
	( vector-assignment v2 v4)
	( vector-assignment v3 v2)
	( vector-assignment v4 v3)
	( assignment a v0 )
	( content a v1 )
	( assignment b v4 )
	( content b v3 ) )
  (:goal
	( and
	( vector-assignment v0 v3)
	( vector-assignment v1 v2)
	( vector-assignment v2 v4)
	( vector-assignment v3 v1)
	( vector-assignment v4 v1)
	)
  )
)