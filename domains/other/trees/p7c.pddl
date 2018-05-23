(define (problem p7c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n3 )
	( internal n3 )
	( right-child n6 n3 )
	( internal n6 )
	( right-child n2 n6 )
	( internal n2 )
	( right-child n4 n2 )
	( left-child n7 n2 )
	( left-child n1 n6 )
	( left-child n5 n3 ) )
  (:goal
	( and 
	( visited n3 )
	( visited n6 )
	( visited n2 )
	( visited n4 )
	( visited n7 )
	( visited n1 )
	( visited n5 )
	)
  )
)