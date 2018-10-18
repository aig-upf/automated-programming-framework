(define (problem gripper-2-neg-4)
    (:domain gripper)
  (:objects b1 b2 b3 - ball)

  (:init 
     (at-robby roomA) 
     (free left) 
     (free right)  
     (at b1 roomA)
     (at b2 roomA)
	 (at b3 roomB)
	 (succ-balls b2 b1)
	 (succ-balls b1 b3)
     (next-ball b2))

  (:goal (and (at b2 roomB)(at b1 roomA) )))
