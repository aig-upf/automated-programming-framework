(define (problem gripper-4)
    (:domain gripper)
  (:objects b1 b2 - ball)

  (:init 
     (at-robby roomA) 
     (free left) 
     (free right)  
     (at b1 roomA)
	 (succ-balls b1 b2)
     (next-ball b1))

  (:goal (and (at b1 roomB) )))
