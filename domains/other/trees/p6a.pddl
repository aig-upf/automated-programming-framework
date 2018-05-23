(define (problem p6a)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 - node )
	
  (:init
	( assignment current n6 ) )
  (:goal
	( and 
	( visited n6 )
	)
  )
)