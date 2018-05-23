(define (problem p6f)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 - node )
	
  (:init
	( assignment current n3 )
	( internal n3 )
	( right-child n1 n3 )
	( internal n1 )
	( right-child n4 n1 )
	( left-child n6 n1 )
	( internal n6 )
	( right-child n2 n6 )
	( left-child n5 n3 ) )
  (:goal
	( and 
	( visited n3 )
	( visited n1 )
	( visited n4 )
	( visited n6 )
	( visited n2 )
	( visited n5 )
	)
  )
)