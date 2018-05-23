(define (problem mark4)
	(:domain sorting)
	(:objects
		i0 i1 i2 i3 - index
		v0 v1 v2 v3 v4 - value
	)
	(:init
		(iterator i0)
		(currentval v1)
		(itermax i3)

		(itermark i0)
		(valuemark v1)

		(assignment i0 v1)
		(assignment i1 v2)
		(assignment i2 v3)

		(consec i0 i1)
		(consec i1 i2)
		(consec i2 i3)

		(lessthan v0 v1)
		(lessthan v0 v2)
		(lessthan v0 v3)
		(lessthan v0 v4)
		(lessthan v1 v2)
		(lessthan v1 v3)
		(lessthan v1 v4)
		(lessthan v2 v3)
		(lessthan v2 v4)
		(lessthan v3 v4)
	)
	(:goal (and
		(itermark i0)
		(valuemark v1)
	))
)
