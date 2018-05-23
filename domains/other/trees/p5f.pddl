(define (problem p5f)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 - node )
	
  (:init
	( assignment current n1 )
	( internal n1 )
	( left-child n5 n1 )
	( internal n5 )
	( left-child n3 n5 ) )
  (:goal
	( and 
	( visited n1 )
	( visited n5 )
	( visited n3 )
	)
  )
)