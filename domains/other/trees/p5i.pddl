(define (problem p5i)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 - node )
	
  (:init
	( assignment current n4 )
	( internal n4 )
	( left-child n2 n4 ) )
  (:goal
	( and 
	( visited n4 )
	( visited n2 )
	)
  )
)