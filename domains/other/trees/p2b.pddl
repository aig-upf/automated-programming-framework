(define (problem p2b)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 - node )
	
  (:init
	( assignment current n2 )
	( internal n2 )
	( right-child n1 n2 ) )
  (:goal
	( and 
	( visited n2 )
	( visited n1 )
	)
  )
)