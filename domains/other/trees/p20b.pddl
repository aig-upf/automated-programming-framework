(define (problem p20b)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 - node )
	
  (:init
	( assignment current n6 )
	( internal n6 )
	( left-child n16 n6 )
	( internal n16 )
	( left-child n3 n16 )
	( internal n3 )
	( right-child n11 n3 )
	( internal n11 )
	( right-child n2 n11 )
	( internal n2 )
	( left-child n17 n2 )
	( left-child n14 n11 )
	( internal n14 )
	( right-child n15 n14 )
	( left-child n12 n14 )
	( internal n12 )
	( right-child n10 n12 )
	( internal n10 )
	( right-child n1 n10 )
	( internal n1 )
	( right-child n20 n1 )
	( left-child n19 n10 )
	( internal n19 )
	( left-child n18 n19 )
	( internal n18 )
	( right-child n9 n18 )
	( internal n9 )
	( right-child n5 n9 )
	( internal n5 )
	( left-child n8 n5 )
	( left-child n7 n9 )
	( left-child n4 n18 )
	( left-child n13 n12 ) )
  (:goal
	( and 
	( visited n6 )
	( visited n16 )
	( visited n3 )
	( visited n11 )
	( visited n2 )
	( visited n17 )
	( visited n14 )
	( visited n15 )
	( visited n12 )
	( visited n10 )
	( visited n1 )
	( visited n20 )
	( visited n19 )
	( visited n18 )
	( visited n9 )
	( visited n5 )
	( visited n8 )
	( visited n7 )
	( visited n4 )
	( visited n13 )
	)
  )
)