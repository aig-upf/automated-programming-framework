(define (problem fibo3-neg-d)
  (:domain variables)
  (:objects v2 v3 - value)
  (:init (assignment a v1) (assignment b v2) (assignment c v2) (assignment d v3) (sum v0 v0 v0))
  (:goal (and  (assignment a v0) (assignment b v1) (assignment c v3) (assignment d v1))))