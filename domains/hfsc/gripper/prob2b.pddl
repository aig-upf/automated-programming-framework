(define (problem gripper-4)
    (:domain gripper)
  (:objects b1 b2 b3 - ball)

  (:init 
     (at-robby roomA) 
     (free left) 
     (free right)  
     (at b1 roomA)
     (at b2 roomA)
	 (succ-balls b1 b2)
	 (succ-balls b2 b3)
     (next-ball b1))

  (:goal (and (at-robby roomB) (carry b1 left) (carry b2 right) )))
