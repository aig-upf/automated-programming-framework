(define (problem p7e)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n5 )
	( internal n5 )
	( right-child n3 n5 )
	( internal n3 )
	( right-child n7 n3 )
	( left-child n1 n3 )
	( internal n1 )
	( right-child n2 n1 )
	( left-child n6 n1 )
	( left-child n4 n5 ) )
  (:goal
	( and 
	( visited n5 )
	( visited n3 )
	( visited n7 )
	( visited n1 )
	( visited n2 )
	( visited n6 )
	( visited n4 )
	)
  )
)