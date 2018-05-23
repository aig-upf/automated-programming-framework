(define (problem p7a)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n6 )
	( internal n6 )
	( right-child n3 n6 )
	( internal n3 )
	( right-child n4 n3 )
	( left-child n5 n6 ) )
  (:goal
	( and 
	( visited n6 )
	( visited n3 )
	( visited n4 )
	( visited n5 )
	)
  )
)