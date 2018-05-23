(define (problem p10c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - node )
	
  (:init
	( assignment current n4 )
	( internal n4 )
	( right-child n10 n4 )
	( internal n10 )
	( right-child n5 n10 )
	( internal n5 )
	( right-child n1 n5 )
	( internal n1 )
	( left-child n3 n1 )
	( internal n3 )
	( right-child n2 n3 )
	( left-child n7 n3 )
	( left-child n9 n5 )
	( left-child n8 n4 )
	( internal n8 )
	( right-child n6 n8 ) )
  (:goal
	( and 
	( visited n4 )
	( visited n10 )
	( visited n5 )
	( visited n1 )
	( visited n3 )
	( visited n2 )
	( visited n7 )
	( visited n9 )
	( visited n8 )
	( visited n6 )
	)
  )
)