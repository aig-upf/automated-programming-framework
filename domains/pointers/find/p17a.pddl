(define (problem p17a)
  (:domain pointers )
  (:objects  v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 - value 
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
	( next v8 v9)
	( next v9 v10)
	( next v10 v11)
	( next v11 v12)
	( next v12 v13)
	( next v13 v14)
	( next v14 v15)
	( next v15 v16)
	( next v16 v17)
	( vector-assignment v0 v5)
	( vector-assignment v1 v16)
	( vector-assignment v2 v11)
	( vector-assignment v3 v7)
	( vector-assignment v4 v1)
	( vector-assignment v5 v11)
	( vector-assignment v6 v14)
	( vector-assignment v7 v11)
	( vector-assignment v8 v12)
	( vector-assignment v9 v9)
	( vector-assignment v10 v16)
	( vector-assignment v11 v7)
	( vector-assignment v12 v4)
	( vector-assignment v13 v5)
	( vector-assignment v14 v10)
	( vector-assignment v15 v3)
	( vector-assignment v16 v6)
	( assignment a v0 )
	( content a v5 )
	( assignment c v0 )
	( assignment target v16)
	( assignment tail v16) )
  (:goal
	( and
	( assignment a v16 )
	( assignment c v2 )
	)
  )
)