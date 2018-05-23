(define (problem p2d)
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
	( assignment b v0 )
	( content b v0 )
	( assignment tail v1) )
  (:goal
	( and
	( assignment a v1 )
	( content a v1 )
	( assignment b v0 )
	( content b v0 )
	)
  )
)