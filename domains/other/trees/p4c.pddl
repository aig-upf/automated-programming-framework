(define (problem p4c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 - node )
	
  (:init
	( assignment current n3 )
	( internal n3 )
	( right-child n4 n3 )
	( left-child n2 n3 ) )
  (:goal
	( and 
	( visited n3 )
	( visited n4 )
	( visited n2 )
	)
  )
)