(define (problem p3-09092015162748)
  (:domain blocks)
  (:objects b1 b2 b3 - block )
  (:init (clear b2) (ontable b1) (on b2 b3)(on b3 b1)(empty) (green b2))
  (:goal (and (obs-greenish)(empty))))