(define (problem p2-17112015201330)
  (:domain gripper)
  (:objects b1 - balls )
  (:init (at-robby roomA) (ballsR b0) (ballsA b2) (ballsB b0) (goalB b2) (succAB b0 b1) (succAB b1 b2) (succR b0 b1) (succR b1 b2))
  (:goal (and (ballsB b2))))