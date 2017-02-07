;if a train has a short closed car, then it's eastbound, otherwise westbound
(define (problem michalski-trains6)
	(:domain michalski)
	(:objects
		infront none-load one-load two-load three-load jagged two-wheels three-wheels open closed long short double ushape trapezoid square rectangle rectangle2 circle hexagon triangle-load diamond-load rectangle-load circle-load hexagon-load wagons-v2 wagons-v3 wagons-v4 - relation
		c1 c2 c3 c4 - value
	)
	(:init
		(east)

		(ordinal-1ary none-load)
		(ordinal-1ary one-load)
		(ordinal-1ary two-load)
		(ordinal-1ary three-load)
		(ordinal-1ary jagged)
		(ordinal-1ary two-wheels)
		(ordinal-1ary three-wheels)
		(ordinal-1ary open)
		(ordinal-1ary closed)
		(ordinal-1ary long)
		(ordinal-1ary short)
		(ordinal-1ary double)
		(ordinal-1ary ushape)
		(ordinal-1ary trapezoid)
		(ordinal-1ary square)
		(ordinal-1ary rectangle)
		(ordinal-1ary rectangle2)
		(ordinal-1ary circle)
		(ordinal-1ary hexagon)
		(ordinal-1ary triangle-load)
		(ordinal-1ary diamond-load)
		(ordinal-1ary rectangle-load)
		(ordinal-1ary circle-load)
		(ordinal-1ary hexagon-load)
		(ordinal-1ary wagons-v2)
		(ordinal-1ary wagons-v3)
		(ordinal-1ary wagons-v4)
		(ordinal-2ary infront)

		(includes-1ary wagons-v2 c1)
		(includes-1ary wagons-v2 c2)

		(includes-1ary long c1)
		(includes-1ary short c2)

		(includes-1ary closed c1)
		(includes-1ary open c2)

		(includes-2ary infront c1 c2)
		
		(includes-1ary rectangle c1)
		(includes-1ary rectangle c2)

		(includes-1ary two-wheels c1)
		(includes-1ary two-wheels c2)

		(includes-1ary circle-load c1 )
		(includes-1ary three-load c1)
		(includes-1ary triangle-load c2)
		(includes-1ary one-load c2)


	)
	(:goal (and
		(west)
	))
)
