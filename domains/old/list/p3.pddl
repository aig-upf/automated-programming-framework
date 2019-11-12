(define (problem p3)
  (:domain variables-output )
  (:objects  n1 n2 n3 - node 
  )
  (:init
	( at n1) ( goal n3)
	( adjacent n1 n2)
	( adjacent n2 n3) )
  (:goal
	( and
	( at n3) ( visited n3)
	( visited n1 ) ( checked n1 )
	( visited n2 ) ( checked n2 )
	)
  )
)