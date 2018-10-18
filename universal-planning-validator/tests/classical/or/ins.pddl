(define (problem exists-test-1-p1)
(:domain exists-test-1)

(:objects p1 p2 - person)

(:init
    (in-room p1)
    (in-room p2)
)

(:goal
    (and
        (out-room p1)
        (out-room p2)
    )
)
)
