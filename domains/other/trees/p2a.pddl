(define (problem p2a)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 - node )
	
  (:init
	( assignment current n2 ) )
  (:goal
	( and 
	( visited n2 )
	)
  )
)