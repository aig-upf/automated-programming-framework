(define (problem prob3)
(:domain blocksworld)
(:objects b1 b2 b3 - block)
(:init
(handempty)
(on b1 b3)
(on b3 b2)
(ontable b2)
(clear b1)
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


