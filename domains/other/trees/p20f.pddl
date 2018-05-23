(define (problem p20f)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 n19 n20 - node )
	
  (:init
	( assignment current n1 ) )
  (:goal
	( and 
	( visited n1 )
	)
  )
)