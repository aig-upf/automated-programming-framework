(define (problem gripper-4)
    (:domain gripper)
  (:objects b1 b2 b3 b4 b5 - ball)

  (:init 
     (at-robby roomB)
	 (carry b1 left)
	 (carry b2 right)
	 (at b3 roomA)
     (at b4 roomA)
	 (succ-balls b1 b2)
	 (succ-balls b2 b3)
	 (succ-balls b3 b4)
	 (succ-balls b4 b5)
     (next-ball b3))

  (:goal (and (at-robby roomA) (free left) (free right) )))
