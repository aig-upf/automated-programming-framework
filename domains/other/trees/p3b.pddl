(define (problem p3b)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 - node )
	
  (:init
	( assignment current n3 )
	( internal n3 )
	( right-child n1 n3 )
	( left-child n2 n3 ) )
  (:goal
	( and 
	( visited n3 )
	( visited n1 )
	( visited n2 )
	)
  )
)