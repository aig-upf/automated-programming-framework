(define (problem list16-neg-c)
  (:domain list)
  (:objects  n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 - node )
  (:init ( at n15) ( not-visited n4 ) ( tail n4)( adjacent n15 n5)( not-visited n15 )( adjacent n5 n10)( not-visited n5 )( adjacent n10 n14)( not-visited n10 )( adjacent n14 n11)( not-visited n14 )( adjacent n11 n12)( not-visited n11 )( adjacent n12 n3)( not-visited n12 )( adjacent n3 n6)( not-visited n3 )( adjacent n6 n16)( not-visited n6 )( adjacent n16 n2)( not-visited n16 )( adjacent n2 n13)( not-visited n2 )( adjacent n13 n8)( not-visited n13 )( adjacent n8 n9)( not-visited n8 )( adjacent n9 n1)( not-visited n9 )( adjacent n1 n7)( not-visited n1 )( adjacent n7 n4)( not-visited n7 ) )
  (:goal (and ( not-visited n15 )( visited n5 )( visited n10 )( visited n14 )( visited n11 )( visited n12 )( not-visited n3 )( visited n6 )( not-visited n16 )( not-visited n2 )( not-visited n13 )( visited n8 )( visited n9 )( visited n1 )( visited n7 )( not-visited n4 ))))
