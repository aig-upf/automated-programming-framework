(define (problem p7)
  (:domain variables)
  (:objects v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18 v19 v20 v21 v22 - value)
  (:init (assignment a v1) (assignment b v7) (assignment c v0) (assignment d v0)
	(sum v0 v0 v0)
	(sum v0 v1 v1)
	(sum v0 v2 v2)
	(sum v0 v3 v3)
	(sum v0 v4 v4)
	(sum v0 v5 v5)
	(sum v0 v6 v6)
	(sum v0 v7 v7)
	(sum v0 v8 v8)
	(sum v0 v9 v9)
	(sum v0 v10 v10)
	(sum v0 v11 v11)
	(sum v0 v12 v12)
	(sum v0 v13 v13)
	(sum v0 v14 v14)
	(sum v0 v15 v15)
	(sum v0 v16 v16)
	(sum v0 v17 v17)
	(sum v0 v18 v18)
	(sum v0 v19 v19)
	(sum v0 v20 v20)
	(sum v0 v21 v21)
	(sum v0 v22 v22)
	(sum v1 v0 v1)
	(sum v1 v1 v2)
	(sum v1 v2 v3)
	(sum v1 v3 v4)
	(sum v1 v4 v5)
	(sum v1 v5 v6)
	(sum v1 v6 v7)
	(sum v1 v7 v8)
	(sum v1 v8 v9)
	(sum v1 v9 v10)
	(sum v1 v10 v11)
	(sum v1 v11 v12)
	(sum v1 v12 v13)
	(sum v1 v13 v14)
	(sum v1 v14 v15)
	(sum v1 v15 v16)
	(sum v1 v16 v17)
	(sum v1 v17 v18)
	(sum v1 v18 v19)
	(sum v1 v19 v20)
	(sum v1 v20 v21)
	(sum v1 v21 v22)
	(sum v2 v0 v2)
	(sum v2 v1 v3)
	(sum v2 v2 v4)
	(sum v2 v3 v5)
	(sum v2 v4 v6)
	(sum v2 v5 v7)
	(sum v2 v6 v8)
	(sum v2 v7 v9)
	(sum v2 v8 v10)
	(sum v2 v9 v11)
	(sum v2 v10 v12)
	(sum v2 v11 v13)
	(sum v2 v12 v14)
	(sum v2 v13 v15)
	(sum v2 v14 v16)
	(sum v2 v15 v17)
	(sum v2 v16 v18)
	(sum v2 v17 v19)
	(sum v2 v18 v20)
	(sum v2 v19 v21)
	(sum v2 v20 v22)
	(sum v3 v0 v3)
	(sum v3 v1 v4)
	(sum v3 v2 v5)
	(sum v3 v3 v6)
	(sum v3 v4 v7)
	(sum v3 v5 v8)
	(sum v3 v6 v9)
	(sum v3 v7 v10)
	(sum v3 v8 v11)
	(sum v3 v9 v12)
	(sum v3 v10 v13)
	(sum v3 v11 v14)
	(sum v3 v12 v15)
	(sum v3 v13 v16)
	(sum v3 v14 v17)
	(sum v3 v15 v18)
	(sum v3 v16 v19)
	(sum v3 v17 v20)
	(sum v3 v18 v21)
	(sum v3 v19 v22)
	(sum v4 v0 v4)
	(sum v4 v1 v5)
	(sum v4 v2 v6)
	(sum v4 v3 v7)
	(sum v4 v4 v8)
	(sum v4 v5 v9)
	(sum v4 v6 v10)
	(sum v4 v7 v11)
	(sum v4 v8 v12)
	(sum v4 v9 v13)
	(sum v4 v10 v14)
	(sum v4 v11 v15)
	(sum v4 v12 v16)
	(sum v4 v13 v17)
	(sum v4 v14 v18)
	(sum v4 v15 v19)
	(sum v4 v16 v20)
	(sum v4 v17 v21)
	(sum v4 v18 v22)
	(sum v5 v0 v5)
	(sum v5 v1 v6)
	(sum v5 v2 v7)
	(sum v5 v3 v8)
	(sum v5 v4 v9)
	(sum v5 v5 v10)
	(sum v5 v6 v11)
	(sum v5 v7 v12)
	(sum v5 v8 v13)
	(sum v5 v9 v14)
	(sum v5 v10 v15)
	(sum v5 v11 v16)
	(sum v5 v12 v17)
	(sum v5 v13 v18)
	(sum v5 v14 v19)
	(sum v5 v15 v20)
	(sum v5 v16 v21)
	(sum v5 v17 v22)
	(sum v6 v0 v6)
	(sum v6 v1 v7)
	(sum v6 v2 v8)
	(sum v6 v3 v9)
	(sum v6 v4 v10)
	(sum v6 v5 v11)
	(sum v6 v6 v12)
	(sum v6 v7 v13)
	(sum v6 v8 v14)
	(sum v6 v9 v15)
	(sum v6 v10 v16)
	(sum v6 v11 v17)
	(sum v6 v12 v18)
	(sum v6 v13 v19)
	(sum v6 v14 v20)
	(sum v6 v15 v21)
	(sum v6 v16 v22)
	(sum v7 v0 v7)
	(sum v7 v1 v8)
	(sum v7 v2 v9)
	(sum v7 v3 v10)
	(sum v7 v4 v11)
	(sum v7 v5 v12)
	(sum v7 v6 v13)
	(sum v7 v7 v14)
	(sum v7 v8 v15)
	(sum v7 v9 v16)
	(sum v7 v10 v17)
	(sum v7 v11 v18)
	(sum v7 v12 v19)
	(sum v7 v13 v20)
	(sum v7 v14 v21)
	(sum v7 v15 v22)
	(sum v8 v0 v8)
	(sum v8 v1 v9)
	(sum v8 v2 v10)
	(sum v8 v3 v11)
	(sum v8 v4 v12)
	(sum v8 v5 v13)
	(sum v8 v6 v14)
	(sum v8 v7 v15)
	(sum v8 v8 v16)
	(sum v8 v9 v17)
	(sum v8 v10 v18)
	(sum v8 v11 v19)
	(sum v8 v12 v20)
	(sum v8 v13 v21)
	(sum v8 v14 v22)
	(sum v9 v0 v9)
	(sum v9 v1 v10)
	(sum v9 v2 v11)
	(sum v9 v3 v12)
	(sum v9 v4 v13)
	(sum v9 v5 v14)
	(sum v9 v6 v15)
	(sum v9 v7 v16)
	(sum v9 v8 v17)
	(sum v9 v9 v18)
	(sum v9 v10 v19)
	(sum v9 v11 v20)
	(sum v9 v12 v21)
	(sum v9 v13 v22)
	(sum v10 v0 v10)
	(sum v10 v1 v11)
	(sum v10 v2 v12)
	(sum v10 v3 v13)
	(sum v10 v4 v14)
	(sum v10 v5 v15)
	(sum v10 v6 v16)
	(sum v10 v7 v17)
	(sum v10 v8 v18)
	(sum v10 v9 v19)
	(sum v10 v10 v20)
	(sum v10 v11 v21)
	(sum v10 v12 v22)
	(sum v11 v0 v11)
	(sum v11 v1 v12)
	(sum v11 v2 v13)
	(sum v11 v3 v14)
	(sum v11 v4 v15)
	(sum v11 v5 v16)
	(sum v11 v6 v17)
	(sum v11 v7 v18)
	(sum v11 v8 v19)
	(sum v11 v9 v20)
	(sum v11 v10 v21)
	(sum v11 v11 v22)
	(sum v12 v0 v12)
	(sum v12 v1 v13)
	(sum v12 v2 v14)
	(sum v12 v3 v15)
	(sum v12 v4 v16)
	(sum v12 v5 v17)
	(sum v12 v6 v18)
	(sum v12 v7 v19)
	(sum v12 v8 v20)
	(sum v12 v9 v21)
	(sum v12 v10 v22)
	(sum v13 v0 v13)
	(sum v13 v1 v14)
	(sum v13 v2 v15)
	(sum v13 v3 v16)
	(sum v13 v4 v17)
	(sum v13 v5 v18)
	(sum v13 v6 v19)
	(sum v13 v7 v20)
	(sum v13 v8 v21)
	(sum v13 v9 v22)
	(sum v14 v0 v14)
	(sum v14 v1 v15)
	(sum v14 v2 v16)
	(sum v14 v3 v17)
	(sum v14 v4 v18)
	(sum v14 v5 v19)
	(sum v14 v6 v20)
	(sum v14 v7 v21)
	(sum v14 v8 v22)
	(sum v15 v0 v15)
	(sum v15 v1 v16)
	(sum v15 v2 v17)
	(sum v15 v3 v18)
	(sum v15 v4 v19)
	(sum v15 v5 v20)
	(sum v15 v6 v21)
	(sum v15 v7 v22)
	(sum v16 v0 v16)
	(sum v16 v1 v17)
	(sum v16 v2 v18)
	(sum v16 v3 v19)
	(sum v16 v4 v20)
	(sum v16 v5 v21)
	(sum v16 v6 v22)
	(sum v17 v0 v17)
	(sum v17 v1 v18)
	(sum v17 v2 v19)
	(sum v17 v3 v20)
	(sum v17 v4 v21)
	(sum v17 v5 v22)
	(sum v18 v0 v18)
	(sum v18 v1 v19)
	(sum v18 v2 v20)
	(sum v18 v3 v21)
	(sum v18 v4 v22)
	(sum v19 v0 v19)
	(sum v19 v1 v20)
	(sum v19 v2 v21)
	(sum v19 v3 v22)
	(sum v20 v0 v20)
	(sum v20 v1 v21)
	(sum v20 v2 v22)
	(sum v21 v0 v21)
	(sum v21 v1 v22)
	(sum v22 v0 v22))
  (:goal (and  (assignment a v21) (assignment b v0) (assignment c v13) (assignment d v8))))
