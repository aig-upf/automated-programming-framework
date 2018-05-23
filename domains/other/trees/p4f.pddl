(define (problem p4f)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 - node )
	
  (:init
	( assignment current n4 )
	( internal n4 )
	( right-child n2 n4 )
	( internal n2 )
	( right-child n1 n2 )
	( left-child n3 n2 ) )
  (:goal
	( and 
	( visited n4 )
	( visited n2 )
	( visited n1 )
	( visited n3 )
	)
  )
)