(define (problem sort4)
	(:domain sorting)
	(:objects
		i0 i1 i2 i3 i4  - index
		v0 v1 v2 v3 - value
	)
	(:init
		(outeriter i0)
		(outerval v1)

		(iterator i0)
		(currentval v1)
		(itermax i4)

		(itermark i0)
		(valuemark v1)

		(assignment i0 v1)
		(assignment i1 v2)
		(assignment i2 v0)
		(assignment i3 v1)
		(assignment i4 v3)

		(consec i0 i1)
		(consec i1 i2)
		(consec i2 i3)
		(consec i3 i4)

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
	))
)
