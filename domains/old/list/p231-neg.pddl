(define (problem p231-neg)
  (:domain list)
  (:objects n1 n2 n3 - node )
  (:init  
	(at n2) 
	(adjacent n2 n3) 
	(adjacent n3 n1) 
	(goal n1) 
  )
  (:goal (and 
	(at n1) 
	(visited n2)
	(checked n2) 
	(visited n3)
	(checked n3) 
  ))
)