(define (problem gripper-4-neg)
    (:domain gripper)
  (:objects b1 b2 b3 b4 b7 - ball)

  (:init 
     (at-robby roomA) 
     (free left) 
     (free right)  
     (at b1 roomA)
     (at b2 roomA)
	 (at b3 roomA)
     (at b4 roomA)
	 (at b7 roomB)

	 (succ-balls b1 b2)
	 (succ-balls b2 b3)
	 (succ-balls b3 b4)
	 (succ-balls b4 b7)
     (next-ball b1))
	(:goal (and (at b1 roomB)(at b2 roomA)(at b3 roomB)(at b4 roomB) )))
