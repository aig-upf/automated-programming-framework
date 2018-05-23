(define (problem p7g)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( left-child n4 n1 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n4 )
	)
  )
)