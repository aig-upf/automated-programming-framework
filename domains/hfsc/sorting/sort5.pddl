(define (problem sort5)
	(:domain sorting)
	(:objects
		i0 i1 i2 i3 i4 i5 - index
		v0 v1 v2 v3 v4 v5 - value
	)
	(:init
		(outeriter i0)
		(outerval v4)

		(iterator i0)
		(currentval v4)
		(itermax i5)

		(itermark i0)
		(valuemark v4)

		(assignment i0 v4)
		(assignment i1 v1)
		(assignment i2 v3)
		(assignment i3 v2)
		(assignment i4 v0)
		(assignment i5 v5)

		(consec i0 i1)
		(consec i1 i2)
		(consec i2 i3)
		(consec i3 i4)
		(consec i4 i5)

		(lessthan v0 v1)
		(lessthan v0 v2)
		(lessthan v0 v3)
		(lessthan v0 v4)
		(lessthan v0 v5)
		(lessthan v1 v2)
		(lessthan v1 v3)
		(lessthan v1 v4)
		(lessthan v1 v5)
		(lessthan v2 v3)
		(lessthan v2 v4)
		(lessthan v2 v5)
		(lessthan v3 v4)
		(lessthan v3 v5)
		(lessthan v4 v5)
	)
	(:goal (and
		(assignment i0 v0)
		(assignment i1 v1)
		(assignment i2 v2)
		(assignment i3 v3)
		(assignment i4 v4)
	))
)
