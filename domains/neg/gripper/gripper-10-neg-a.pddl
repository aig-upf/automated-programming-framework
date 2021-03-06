(define (problem gripper10-neg-a)
  (:domain gripper)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - ball )
  (:init (at-robby roomA) (free left) (free right) ( next-ball b1 ) ( at b10 roomB ) 
     (succ-balls b1 b2)
     (succ-balls b2 b3)
     (succ-balls b3 b4)
     (succ-balls b4 b5)
     (succ-balls b5 b6)
     (succ-balls b6 b7)
     (succ-balls b7 b8)
     (succ-balls b8 b9)
     (succ-balls b9 b10)
     (at b1 roomA)
     (at b2 roomA)
     (at b3 roomB)
     (at b4 roomB)
     (at b5 roomA)
     (at b6 roomA)
     (at b7 roomB)
     (at b8 roomA)
     (at b9 roomA)
)
  (:goal (and 
      (at b1 roomB )
      (at b2 roomA )
      (at b3 roomA )
      (at b4 roomA )
      (at b5 roomA )
      (at b6 roomA )
      (at b7 roomA )
      (at b8 roomB )
      (at b9 roomA )
)))
