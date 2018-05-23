(define (problem p5g)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 - node )
	
  (:init
	( assignment current n5 )
	( internal n5 )
	( right-child n2 n5 )
	( internal n2 )
	( right-child n3 n2 )
	( internal n3 )
	( right-child n4 n3 )
	( internal n4 )
	( left-child n1 n4 ) )
  (:goal
	( and 
	( visited n5 )
	( visited n2 )
	( visited n3 )
	( visited n4 )
	( visited n1 )
	)
  )
)