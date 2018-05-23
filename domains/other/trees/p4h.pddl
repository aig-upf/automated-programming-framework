(define (problem p4h)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( right-child n2 n1 )
	( left-child n3 n1 )
	( internal n3 )
	( left-child n4 n3 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n2 )
	( visited n3 )
	( visited n4 )
	)
  )
)