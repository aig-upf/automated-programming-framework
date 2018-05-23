(define (problem p7b)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n6 )
	( internal n6 )
	( right-child n2 n6 )
	( left-child n1 n6 )
	( internal n1 )
	( right-child n5 n1 )
	( internal n5 )
	( right-child n7 n5 )
	( internal n7 )
	( left-child n3 n7 )
	( left-child n4 n1 ) )
  (:goal
	( and 
	( visited n6 )
	( visited n2 )
	( visited n1 )
	( visited n5 )
	( visited n7 )
	( visited n3 )
	( visited n4 )
	)
  )
)