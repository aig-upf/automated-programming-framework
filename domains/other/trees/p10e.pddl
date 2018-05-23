(define (problem p10e)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - node )
	
  (:init
	( assignment current n6 )
	( internal n6 )
	( right-child n3 n6 )
	( left-child n5 n6 )
	( internal n5 )
	( right-child n1 n5 )
	( left-child n4 n5 )
	( internal n4 )
	( right-child n10 n4 )
	( internal n10 )
	( left-child n8 n10 ) )
  (:goal
	( and 
	( visited n6 )
	( visited n3 )
	( visited n5 )
	( visited n1 )
	( visited n4 )
	( visited n10 )
	( visited n8 )
	)
  )
)