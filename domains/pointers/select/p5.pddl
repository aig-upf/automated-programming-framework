(define (problem p5)
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
	( vector-assignment v0 v3)
	( vector-assignment v1 v3)
	( vector-assignment v2 v1)
	( vector-assignment v3 v0)
	( vector-assignment v4 v4)
	( assignment a v0 )
	( content a v3 )
	( assignment b v0 )
	( content b v3 )
	( assignment tail v4) )
  (:goal
	( and
	( assignment a v4 )
	( content a v4 )
	( assignment b v3 )
	( content b v0 )
	)
  )
)