(define (problem p20d)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 - node )
	
  (:init
	( assignment current n9 )
	( internal n9 )
	( left-child n4 n9 )
	( internal n4 )
	( left-child n10 n4 ) )
  (:goal
	( and 
	( visited n9 )
	( visited n4 )
	( visited n10 )
	)
  )
)