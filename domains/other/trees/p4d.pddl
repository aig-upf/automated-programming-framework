(define (problem p4d)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( left-child n2 n1 )
	( internal n2 )
	( right-child n3 n2 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n2 )
	( visited n3 )
	)
  )
)