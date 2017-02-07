;if a train has a short closed car, then it's eastbound, otherwise westbound
(define (problem michalski-trains5)
	(:domain programming)
	(:objects
		has_car jagged infront shape load-type load-quantity wheels open closed long short double train - relation
		t1 c1 c2 c3 c4 
		none ushape trapezoid square rectangle rectangle2 circle triangle hexagon
		v0 v1 v2 v3 - value
	)
	(:init
		;;;;;;;; V1.0 OF MICHALSKI
		;(assignment direction unclassified)
		;;;;;;;; V2.0 OF MICHALSKI
		(assignment direction east)

		(ordinal-1ary open)
		(ordinal-1ary closed)
		(ordinal-1ary long)
		(ordinal-1ary short)
		(ordinal-1ary double)
		(ordinal-1ary jagged)
		(ordinal-1ary train)

		(ordinal-2ary has_car)
		(ordinal-2ary infront)
		(ordinal-2ary shape)
		(ordinal-2ary wheels)
		(ordinal-2ary load-type)
		(ordinal-2ary load-quantity)

		;(includes-1ary train t1)

		(includes-1ary short c1)
		(includes-1ary long c2)
		(includes-1ary short c3)

		(includes-1ary open c1)
		(includes-1ary closed c2)
		(includes-1ary closed c3)

		(includes-2ary has_car t1 c1)
		(includes-2ary has_car t1 c2)
		(includes-2ary has_car t1 c3)

		(includes-2ary infront t1 c1)
		(includes-2ary infront c1 c2)
		(includes-2ary infront c2 c3)
		
		(includes-2ary shape c1 rectangle2)
		(includes-2ary shape c2 rectangle)
		(includes-2ary shape c3 rectangle)

		(includes-2ary wheels c1 v2)
		(includes-2ary wheels c2 v3)
		(includes-2ary wheels c3 v2)

		(includes-2ary load-type c1 triangle)
		(includes-2ary load-quantity c1 v1)
		(includes-2ary load-type c2 rectangle)
		(includes-2ary load-quantity c2 v1)
		(includes-2ary load-type c3 circle)
		(includes-2ary load-quantity c3 v1)

	)
	(:goal (and
		(assignment direction east)
	))
)
