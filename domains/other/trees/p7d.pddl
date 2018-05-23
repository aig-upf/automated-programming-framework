(define (problem p7d)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 - node )
	
  (:init
	( assignment current n3 ) )
  (:goal
	( and 
	( visited n3 )
	)
  )
)