(define (problem p20e)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 - node )
	
  (:init
	( assignment current n14 )
	( internal n14 )
	( right-child n5 n14 )
	( left-child n4 n14 ) )
  (:goal
	( and 
	( visited n14 )
	( visited n5 )
	( visited n4 )
	)
  )
)