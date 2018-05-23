(define (problem p3a)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( right-child n3 n1 )
	( internal n3 )
	( left-child n2 n3 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n3 )
	( visited n2 )
	)
  )
)