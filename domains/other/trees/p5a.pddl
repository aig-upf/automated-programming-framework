(define (problem p5a)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 - node )
	
  (:init
	( assignment current n3 )
	( internal n3 )
	( right-child n1 n3 )
	( left-child n4 n3 )
	( internal n4 )
	( right-child n2 n4 )
	( left-child n5 n4 ) )
  (:goal
	( and 
	( visited n3 )
	( visited n1 )
	( visited n4 )
	( visited n2 )
	( visited n5 )
	)
  )
)