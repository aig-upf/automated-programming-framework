(define (problem gb5-neg-d)
  (:domain blocks)
  (:objects b1 b2 b3 b4 b5 - block )
  (:init (clear b1) (ontable b5)       ( on b1 b2 )
      ( on b2 b3 )
      ( on b3 b4 )
      ( on b4 b5 )
(empty) (green b5) ) 
  (:goal (and (have b4))))