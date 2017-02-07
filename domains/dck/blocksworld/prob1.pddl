(define (problem prob1)
(:domain blocksworld)
(:objects b1 b2 b3 - block)
(:init
(handempty)
(on b3 b2)
(on b2 b1)
(ontable b1)
(clear b3)
)
(:goal
(and
(ontable b1)
(ontable b2)
(ontable b3)
(clear b1)
(clear b2)
(clear b3)
)
)
)


