(define (problem p10h)
  (:domain trees_alt )
  (:objects 
	 current childs - variable
	 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - node )
	
  (:init
	( assignment current n1 ) )
  (:goal
	( and 
	( visited n1 )
	)
  )
)