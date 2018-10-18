(define (problem when-test-1-p1)
(:domain when-test-1)

(:objects p1 p2 p3 - person)

(:init
    (happy p1)
    (sad p2)
    (angry p3)
)

(:goal
    (and
        (sad p1)
        (angry p2)
        (happy p3)
    )
)
)
