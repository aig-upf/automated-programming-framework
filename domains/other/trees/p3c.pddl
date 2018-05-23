(define (problem p3c)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 - node )
	
  (:init
	( assignment current n2 )
	( internal n2 )
	( right-child n3 n2 )
	( left-child n1 n2 ) )
  (:goal
	( and 
	( visited n2 )
	( visited n3 )
	( visited n1 )
	)
  )
)