(define (problem gb4-neg-d)
  (:domain blocks)
  (:objects b1 b2 b3 b4 - block )
  (:init (clear b1) (ontable b4)       ( on b1 b2 )
      ( on b2 b3 )
      ( on b3 b4 )
(empty) (green b4) ) 
  (:goal (and (have b3))))