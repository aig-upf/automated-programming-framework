(define (problem p2c)
  (:domain pointers )
  (:objects  v0 v1 - value 
  )
  (:init
	( next v0 v1)
	( less v0 v1)
	( vector-assignment v0 v0)
	( vector-assignment v1 v1)
	( assignment a v0 )
	( content a v0 )
	( assignment b v1 )
	( content b v1 ) )
  (:goal
	( and
	( vector-assignment v0 v1)
	( vector-assignment v1 v0)
	)
  )
)