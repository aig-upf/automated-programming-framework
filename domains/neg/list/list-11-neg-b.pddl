(define (problem list11-neg-b)
  (:domain list)
  (:objects  n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 - node )
  (:init ( at n5) ( not-visited n2 ) ( tail n2)( adjacent n5 n3)( not-visited n5 )( adjacent n3 n7)( not-visited n3 )( adjacent n7 n4)( not-visited n7 )( adjacent n4 n8)( not-visited n4 )( adjacent n8 n10)( not-visited n8 )( adjacent n10 n1)( not-visited n10 )( adjacent n1 n9)( not-visited n1 )( adjacent n9 n6)( not-visited n9 )( adjacent n6 n11)( not-visited n6 )( adjacent n11 n2)( not-visited n11 ) )
  (:goal (and ( not-visited n5 )( not-visited n3 )( visited n7 )( visited n4 )( visited n8 )( not-visited n10 )( not-visited n1 )( visited n9 )( not-visited n6 )( not-visited n11 )( not-visited n2 ))))