(define (problem tu-3balls-C)
	(:domain tidying-up)
	(:objects o0 o1 o2 bmax - ball v0 v1 v2 v3 - value dummy_goal_o0 dummy_goal_o1 dummy_goal_o2 - region)
	(:init 
		(next-ball o2 o1)(next-ball o1 o0)(next-ball o0 bmax)
		(current-ball o2)
		(balls-to-place v3)
		(next-value v0 v1)(next-value v1 v2)(next-value v2 v3)
	)

	(:goal (and (placed-region dummy_goal_o0 o0)(placed-region dummy_goal_o1 o1)(placed-region dummy_goal_o2 o2) )))
