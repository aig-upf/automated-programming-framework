(define (problem p20c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 - node )
	
  (:init
	( assignment current n19 )
	( internal n19 )
	( left-child n2 n19 )
	( internal n2 )
	( right-child n7 n2 )
	( internal n7 )
	( right-child n3 n7 )
	( internal n3 )
	( right-child n8 n3 )
	( left-child n11 n7 )
	( left-child n13 n2 )
	( internal n13 )
	( right-child n10 n13 )
	( internal n10 )
	( right-child n16 n10 )
	( internal n16 )
	( right-child n4 n16 )
	( internal n4 )
	( right-child n18 n4 )
	( internal n18 )
	( right-child n12 n18 )
	( left-child n9 n18 )
	( left-child n5 n4 )
	( left-child n15 n16 )
	( left-child n6 n10 )
	( internal n6 )
	( right-child n20 n6 )
	( left-child n1 n6 )
	( internal n1 )
	( left-child n17 n1 )
	( left-child n14 n13 ) )
  (:goal
	( and 
	( visited n19 )
	( visited n2 )
	( visited n7 )
	( visited n3 )
	( visited n8 )
	( visited n11 )
	( visited n13 )
	( visited n10 )
	( visited n16 )
	( visited n4 )
	( visited n18 )
	( visited n12 )
	( visited n9 )
	( visited n5 )
	( visited n15 )
	( visited n6 )
	( visited n20 )
	( visited n1 )
	( visited n17 )
	( visited n14 )
	)
  )
)