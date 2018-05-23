(define (problem p7f)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n7 )
	( internal n7 )
	( right-child n5 n7 )
	( left-child n6 n7 )
	( internal n6 )
	( left-child n1 n6 )
	( internal n1 )
	( right-child n3 n1 )
	( internal n3 )
	( right-child n4 n3 )
	( left-child n2 n1 ) )
  (:goal
	( and 
	( visited n7 )
	( visited n5 )
	( visited n6 )
	( visited n1 )
	( visited n3 )
	( visited n4 )
	( visited n2 )
	)
  )
)