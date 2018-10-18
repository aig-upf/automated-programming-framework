(define (problem p6)
  (:domain variables)
  (:objects 
		v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 - value
  )
  (:init 
		(assignment a v1)
		(assignment b v6)
		(assignment c v0)
		(assignment d v0)

		(sum v0 v0 v0)(sum v0 v1 v1)(sum v0 v2 v2)(sum v0 v3 v3)(sum v0 v4 v4)(sum v0 v5 v5)(sum v0 v6 v6)(sum v0 v7 v7)(sum v0 v8 v8)(sum v0 v9 v9)(sum v0 v10 v10)(sum v0 v11 v11)(sum v0 v12 v12)(sum v0 v13 v13)
		(sum v1 v0 v1)(sum v1 v1 v2)(sum v1 v2 v3)(sum v1 v3 v4)(sum v1 v4 v5)(sum v1 v5 v6)(sum v1 v6 v7)(sum v1 v7 v8)(sum v1 v8 v9)(sum v1 v9 v10)(sum v1 v10 v11)(sum v1 v11 v12)(sum v1 v12 v13)
		(sum v2 v0 v2)(sum v2 v1 v3)(sum v2 v2 v4)(sum v2 v3 v5)(sum v2 v4 v6)(sum v2 v5 v7)(sum v2 v6 v8)(sum v2 v7 v9)(sum v2 v8 v10)(sum v2 v9 v11)(sum v2 v10 v12)(sum v2 v11 v13)
		(sum v3 v0 v3)(sum v3 v1 v4)(sum v3 v2 v5)(sum v3 v3 v6)(sum v3 v4 v7)(sum v3 v5 v8)(sum v3 v6 v9)(sum v3 v7 v10)(sum v3 v8 v11)(sum v3 v9 v12)(sum v3 v10 v13)
		(sum v4 v0 v4)(sum v4 v1 v5)(sum v4 v2 v6)(sum v4 v3 v7)(sum v4 v4 v8)(sum v4 v5 v9)(sum v4 v6 v10)(sum v4 v7 v11)(sum v4 v8 v12)(sum v4 v9 v13)
		(sum v5 v0 v5)(sum v5 v1 v6)(sum v5 v2 v7)(sum v5 v3 v8)(sum v5 v4 v9)(sum v5 v5 v10)(sum v5 v6 v11)(sum v5 v7 v12)(sum v5 v8 v13)
		(sum v6 v0 v6)(sum v6 v1 v7)(sum v6 v2 v8)(sum v6 v3 v9)(sum v6 v4 v10)(sum v6 v5 v11)(sum v6 v6 v12)(sum v6 v7 v13)
		(sum v7 v0 v7)(sum v7 v1 v8)(sum v7 v2 v9)(sum v7 v3 v10)(sum v7 v4 v11)(sum v7 v5 v12)(sum v7 v6 v13)
		(sum v8 v0 v8)(sum v8 v1 v9)(sum v8 v2 v10)(sum v8 v3 v11)(sum v8 v4 v12)(sum v8 v5 v13)
		(sum v9 v0 v9)(sum v9 v1 v10)(sum v9 v2 v11)(sum v9 v3 v12)(sum v9 v4 v13)
		(sum v10 v0 v10)(sum v10 v1 v11)(sum v10 v2 v12)(sum v10 v3 v13)
		(sum v11 v0 v11)(sum v11 v1 v12)(sum v11 v2 v13)
		(sum v12 v0 v12)(sum v12 v1 v13)
		(sum v13 v0 v13)
  )
	(:goal (and
		(assignment a v13)
		(assignment b v0)
		(assignment c v8)
		(assignment d v5)
	))
)



