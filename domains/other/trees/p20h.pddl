(define (problem p20h)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 - node )
	
  (:init
	( assignment current n19 )
	( internal n19 )
	( left-child n12 n19 )
	( internal n12 )
	( right-child n1 n12 ) )
  (:goal
	( and 
	( visited n19 )
	( visited n12 )
	( visited n1 )
	)
  )
)