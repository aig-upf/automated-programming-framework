(define (problem select4)
	(:domain sorting)
	(:objects
		i0 i1 i2 i3 i4  - index
		v0 v1 v2 v3 - value
	)
	(:init
		(iterator i1)
		(currentval v2)
		(itermax i4)

		(itermark i1)
		(valuemark v2)

		(assignment i0 v2)
		(assignment i1 v2)
		(assignment i2 v2)
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
		(itermark i3)
		(valuemark v1)
	))
)
