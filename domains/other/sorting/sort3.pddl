(define (problem sort3)
	(:domain sorting)
	(:objects
		i0 i1 i2 i3  - index
		v0 v1 v2 v3 - value
	)
	(:init
		(outeriter i0)
		(outerval v2)

		(iterator i0)
		(currentval v2)
		(itermax i3)

		(itermark i0)
		(valuemark v2)

		(assignment i0 v2)
		(assignment i1 v0)
		(assignment i2 v1)
		(assignment i3 v3)

		(consec i0 i1)
		(consec i1 i2)
		(consec i2 i3)

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
		(assignment i2 v2)
	))
)
