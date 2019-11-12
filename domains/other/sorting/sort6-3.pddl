(define (problem sort6-3)
	(:domain sorting)
	(:objects
		i0 i1 i2 i3 i4 i5 i6 - index
		v0 v1 v2 v3 - value
	)
	(:init
		(outeriter i0)
		(outerval v0)

		(iterator i0)
		(currentval v0)
		(itermax i6)

		(itermark i0)
		(valuemark v0)

		(assignment i0 v0)
		(assignment i1 v2)
		(assignment i2 v2)
		(assignment i3 v2)
		(assignment i4 v1)
		(assignment i5 v1)
		(assignment i6 v3)

		(consec i0 i1)
		(consec i1 i2)
		(consec i2 i3)
		(consec i3 i4)
		(consec i4 i5)
		(consec i5 i6)

		(lessthan v0 v1)
		(lessthan v0 v2)
		(lessthan v0 v3)
		(lessthan v1 v2)
		(lessthan v1 v3)
		(lessthan v2 v3)
	)
	(:goal (and
		(assignment i0 v0)
		(assignment i1 v1)
		(assignment i2 v1)
		(assignment i3 v2)
		(assignment i4 v2)
		(assignment i5 v2)
	))
)
