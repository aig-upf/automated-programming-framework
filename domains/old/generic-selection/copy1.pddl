(define (problem copy1)
	(:domain sorting)
	(:objects
		lessthan - relation
		i0 i1 i2 imax v1 v2 v3 v4 vmax - value
		iter best - variable
	)
	(:init
		(ordinal-2ary lessthan)

		(assignment iter i0)
		(assign-pointer iter vmax)
		(assignment best i0)
		(assign-pointer best vmax)

		(next i0 i1)
		(next i1 i2)
		(next i2 imax)

		(vector-assignment i1 v2)
		(vector-assignment i2 v3)

		(includes-2ary lessthan v1 v2)
		(includes-2ary lessthan v1 v3)
		(includes-2ary lessthan v1 v4)
		(includes-2ary lessthan v1 vmax)
		(includes-2ary lessthan v2 v3)
		(includes-2ary lessthan v2 v4)
		(includes-2ary lessthan v2 vmax)
		(includes-2ary lessthan v3 v4)
		(includes-2ary lessthan v3 vmax)
	)
	(:goal (and
		(assignment best i1)
	))
)
