(define (problem p312)
  (:domain list)
  (:objects n1 n2 n3 - node )
  (:init  (at n3) (adjacent n3 n1) (adjacent n1 n2) (goal n2) )
  (:goal (and (at n2) (visited n1) (visited n2) (visited n3)  ))
)