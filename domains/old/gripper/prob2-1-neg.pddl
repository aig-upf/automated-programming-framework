(define (problem gripper-2-1-neg)
    (:domain gripper)
  (:objects b1 b2 b3 - ball)

  (:init 
     (at-robby roomA) 
     (free left) 
     (free right)  
     (at b1 roomA)
     (at b2 roomA)
	 (at b3 roomB)
	
	 (succ-balls b1 b2)
	 (succ-balls b2 b3)
     (next-ball b1))
	(:goal (and (carry b1 right))))
