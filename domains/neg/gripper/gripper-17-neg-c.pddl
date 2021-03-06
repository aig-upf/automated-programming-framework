(define (problem gripper17-neg-c)
  (:domain gripper)
  (:objects b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 - ball )
  (:init (at-robby roomA) (free left) (free right) ( next-ball b1 ) ( at b17 roomB ) 
     (succ-balls b1 b2)
     (succ-balls b2 b3)
     (succ-balls b3 b4)
     (succ-balls b4 b5)
     (succ-balls b5 b6)
     (succ-balls b6 b7)
     (succ-balls b7 b8)
     (succ-balls b8 b9)
     (succ-balls b9 b10)
     (succ-balls b10 b11)
     (succ-balls b11 b12)
     (succ-balls b12 b13)
     (succ-balls b13 b14)
     (succ-balls b14 b15)
     (succ-balls b15 b16)
     (succ-balls b16 b17)
     (at b1 roomB)
     (at b2 roomB)
     (at b3 roomB)
     (at b4 roomB)
     (at b5 roomB)
     (at b6 roomB)
     (at b7 roomA)
     (at b8 roomB)
     (at b9 roomB)
     (at b10 roomB)
     (at b11 roomB)
     (at b12 roomA)
     (at b13 roomA)
     (at b14 roomB)
     (at b15 roomB)
     (at b16 roomA)
)
  (:goal (and 
      (at b1 roomA )
      (at b2 roomB )
      (at b3 roomA )
      (at b4 roomA )
      (at b5 roomA )
      (at b6 roomB )
      (at b7 roomB )
      (at b8 roomB )
      (at b9 roomA )
      (at b10 roomA )
      (at b11 roomB )
      (at b12 roomA )
      (at b13 roomB )
      (at b14 roomA )
      (at b15 roomA )
      (at b16 roomA )
)))
