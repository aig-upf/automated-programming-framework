(define (problem p7i)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n3 )
	( internal n3 )
	( right-child n6 n3 )
	( left-child n5 n3 )
	( internal n5 )
	( right-child n1 n5 )
	( internal n1 )
	( right-child n4 n1 )
	( internal n4 )
	( right-child n2 n4 )
	( left-child n7 n5 ) )
  (:goal
	( and 
	( visited n3 )
	( visited n6 )
	( visited n5 )
	( visited n1 )
	( visited n4 )
	( visited n2 )
	( visited n7 )
	)
  )
)