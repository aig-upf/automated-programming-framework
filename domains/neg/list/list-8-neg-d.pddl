(define (problem list8-neg-d)
  (:domain list)
  (:objects  n1 n2 n3 n4 n5 n6 n7 n8 - node )
  (:init ( at n1) ( not-visited n6 ) ( tail n6)( adjacent n1 n8)( not-visited n1 )( adjacent n8 n4)( not-visited n8 )( adjacent n4 n7)( not-visited n4 )( adjacent n7 n2)( not-visited n7 )( adjacent n2 n5)( not-visited n2 )( adjacent n5 n3)( not-visited n5 )( adjacent n3 n6)( not-visited n3 ) )
  (:goal (and ( not-visited n1 )( not-visited n8 )( not-visited n4 )( visited n7 )( not-visited n2 )( not-visited n5 )( not-visited n3 )( visited n6 ))))
