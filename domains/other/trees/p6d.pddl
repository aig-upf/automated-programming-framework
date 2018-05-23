(define (problem p6d)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( right-child n5 n1 )
	( internal n5 )
	( right-child n2 n5 )
	( left-child n3 n1 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n5 )
	( visited n2 )
	( visited n3 )
	)
  )
)