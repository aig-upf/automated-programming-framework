(define (problem p5h)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 - node )
	
  (:init
	( assignment current n4 )
	( internal n4 )
	( right-child n2 n4 )
	( internal n2 )
	( right-child n3 n2 )
	( left-child n5 n2 )
	( left-child n1 n4 ) )
  (:goal
	( and 
	( visited n4 )
	( visited n2 )
	( visited n3 )
	( visited n5 )
	( visited n1 )
	)
  )
)