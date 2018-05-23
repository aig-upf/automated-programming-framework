(define (problem gripper-2c)
    (:domain gripper)
  (:objects b1 b2 b3 - ball)

  (:init 
     (at-robby roomB)
	 (carry b1 left)
	 (carry b2 right)
	 (succ-balls b1 b2)
	 (succ-balls b2 b3)
     (next-ball b3))

  (:goal (and (at-robby roomA) (free left) (free right) )))
