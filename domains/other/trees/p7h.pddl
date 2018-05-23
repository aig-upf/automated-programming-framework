(define (problem p7h)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n4 )
	( internal n4 )
	( right-child n5 n4 )
	( internal n5 )
	( right-child n3 n5 )
	( internal n3 )
	( right-child n6 n3 )
	( left-child n7 n5 )
	( left-child n1 n4 )
	( internal n1 )
	( right-child n2 n1 ) )
  (:goal
	( and 
	( visited n4 )
	( visited n5 )
	( visited n3 )
	( visited n6 )
	( visited n7 )
	( visited n1 )
	( visited n2 )
	)
  )
)