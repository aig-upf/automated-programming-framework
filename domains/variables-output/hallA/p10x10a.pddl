(define (problem p10x10a)
  (:domain variables-output )
  (:objects  v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 - value 
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
	( not-output-two v0 v0)
	( not-output-two v0 v1)
	( not-output-two v0 v2)
	( not-output-two v0 v3)
	( not-output-two v0 v4)
	( not-output-two v0 v5)
	( not-output-two v0 v6)
	( not-output-two v0 v7)
	( not-output-two v0 v8)
	( not-output-two v0 v9)
	( not-output-two v1 v0)
	( not-output-two v1 v1)
	( not-output-two v1 v2)
	( not-output-two v1 v3)
	( not-output-two v1 v4)
	( not-output-two v1 v5)
	( not-output-two v1 v6)
	( not-output-two v1 v7)
	( not-output-two v1 v8)
	( not-output-two v1 v9)
	( not-output-two v2 v0)
	( not-output-two v2 v1)
	( not-output-two v2 v2)
	( not-output-two v2 v3)
	( not-output-two v2 v4)
	( not-output-two v2 v5)
	( not-output-two v2 v6)
	( not-output-two v2 v7)
	( not-output-two v2 v8)
	( not-output-two v2 v9)
	( not-output-two v3 v0)
	( not-output-two v3 v1)
	( not-output-two v3 v2)
	( not-output-two v3 v3)
	( not-output-two v3 v4)
	( not-output-two v3 v5)
	( not-output-two v3 v6)
	( not-output-two v3 v7)
	( not-output-two v3 v8)
	( not-output-two v3 v9)
	( not-output-two v4 v0)
	( not-output-two v4 v1)
	( not-output-two v4 v2)
	( not-output-two v4 v3)
	( not-output-two v4 v4)
	( not-output-two v4 v5)
	( not-output-two v4 v6)
	( not-output-two v4 v7)
	( not-output-two v4 v8)
	( not-output-two v4 v9)
	( not-output-two v5 v0)
	( not-output-two v5 v1)
	( not-output-two v5 v2)
	( not-output-two v5 v3)
	( not-output-two v5 v4)
	( not-output-two v5 v5)
	( not-output-two v5 v6)
	( not-output-two v5 v7)
	( not-output-two v5 v8)
	( not-output-two v5 v9)
	( not-output-two v6 v0)
	( not-output-two v6 v1)
	( not-output-two v6 v2)
	( not-output-two v6 v3)
	( not-output-two v6 v4)
	( not-output-two v6 v5)
	( not-output-two v6 v6)
	( not-output-two v6 v7)
	( not-output-two v6 v8)
	( not-output-two v6 v9)
	( not-output-two v7 v0)
	( not-output-two v7 v1)
	( not-output-two v7 v2)
	( not-output-two v7 v3)
	( not-output-two v7 v4)
	( not-output-two v7 v5)
	( not-output-two v7 v6)
	( not-output-two v7 v7)
	( not-output-two v7 v8)
	( not-output-two v7 v9)
	( not-output-two v8 v0)
	( not-output-two v8 v1)
	( not-output-two v8 v2)
	( not-output-two v8 v3)
	( not-output-two v8 v4)
	( not-output-two v8 v5)
	( not-output-two v8 v6)
	( not-output-two v8 v7)
	( not-output-two v8 v8)
	( not-output-two v8 v9)
	( not-output-two v9 v0)
	( not-output-two v9 v1)
	( not-output-two v9 v2)
	( not-output-two v9 v3)
	( not-output-two v9 v4)
	( not-output-two v9 v5)
	( not-output-two v9 v6)
	( not-output-two v9 v7)
	( not-output-two v9 v8)
	( not-output-two v9 v9)
	( assignment a v3)
	( assignment b v6)
	( assignment c v9)
	( assignment d v9) )
  (:goal
	( and
	( output-two v0 v0 )
	( not-output-two v0 v1)
	( not-output-two v0 v2)
	( not-output-two v0 v3)
	( not-output-two v0 v4)
	( not-output-two v0 v5)
	( not-output-two v0 v6)
	( not-output-two v0 v7)
	( not-output-two v0 v8)
	( output-two v0 v9 )
	( not-output-two v1 v0)
	( not-output-two v1 v1)
	( not-output-two v1 v2)
	( not-output-two v1 v3)
	( not-output-two v1 v4)
	( not-output-two v1 v5)
	( not-output-two v1 v6)
	( not-output-two v1 v7)
	( not-output-two v1 v8)
	( not-output-two v1 v9)
	( not-output-two v2 v0)
	( not-output-two v2 v1)
	( not-output-two v2 v2)
	( not-output-two v2 v3)
	( not-output-two v2 v4)
	( not-output-two v2 v5)
	( not-output-two v2 v6)
	( not-output-two v2 v7)
	( not-output-two v2 v8)
	( not-output-two v2 v9)
	( not-output-two v3 v0)
	( not-output-two v3 v1)
	( not-output-two v3 v2)
	( not-output-two v3 v3)
	( not-output-two v3 v4)
	( not-output-two v3 v5)
	( not-output-two v3 v6)
	( not-output-two v3 v7)
	( not-output-two v3 v8)
	( not-output-two v3 v9)
	( not-output-two v4 v0)
	( not-output-two v4 v1)
	( not-output-two v4 v2)
	( not-output-two v4 v3)
	( not-output-two v4 v4)
	( not-output-two v4 v5)
	( not-output-two v4 v6)
	( not-output-two v4 v7)
	( not-output-two v4 v8)
	( not-output-two v4 v9)
	( not-output-two v5 v0)
	( not-output-two v5 v1)
	( not-output-two v5 v2)
	( not-output-two v5 v3)
	( not-output-two v5 v4)
	( not-output-two v5 v5)
	( not-output-two v5 v6)
	( not-output-two v5 v7)
	( not-output-two v5 v8)
	( not-output-two v5 v9)
	( not-output-two v6 v0)
	( not-output-two v6 v1)
	( not-output-two v6 v2)
	( not-output-two v6 v3)
	( not-output-two v6 v4)
	( not-output-two v6 v5)
	( not-output-two v6 v6)
	( not-output-two v6 v7)
	( not-output-two v6 v8)
	( not-output-two v6 v9)
	( not-output-two v7 v0)
	( not-output-two v7 v1)
	( not-output-two v7 v2)
	( not-output-two v7 v3)
	( not-output-two v7 v4)
	( not-output-two v7 v5)
	( not-output-two v7 v6)
	( not-output-two v7 v7)
	( not-output-two v7 v8)
	( not-output-two v7 v9)
	( not-output-two v8 v0)
	( not-output-two v8 v1)
	( not-output-two v8 v2)
	( not-output-two v8 v3)
	( not-output-two v8 v4)
	( not-output-two v8 v5)
	( not-output-two v8 v6)
	( not-output-two v8 v7)
	( not-output-two v8 v8)
	( not-output-two v8 v9)
	( output-two v9 v0 )
	( not-output-two v9 v1)
	( not-output-two v9 v2)
	( not-output-two v9 v3)
	( not-output-two v9 v4)
	( not-output-two v9 v5)
	( not-output-two v9 v6)
	( not-output-two v9 v7)
	( not-output-two v9 v8)
	( output-two v9 v9 )
	)
  )
)