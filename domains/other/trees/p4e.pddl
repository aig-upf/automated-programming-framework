(define (problem p4e)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( right-child n4 n1 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n4 )
	)
  )
)