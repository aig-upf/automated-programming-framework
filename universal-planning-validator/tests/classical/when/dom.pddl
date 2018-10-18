(define (domain when-test-1)
    (:requirements :typing :universal-preconditions :negative-preconditions)
    (:types person - object)
    (:predicates
        (happy ?p - person)
        (angry ?p - person)
        (sad ?p - person)
    )
    (:action change-mood
        :parameters (?p - person)
        :precondition ()
        :effect (and
            (when (happy ?p) (and (not (happy ?p)) (angry ?p)))
            (when (angry ?p) (and (not (angry ?p)) (sad ?p)))
            (when (sad ?p) (and (not (sad ?p)) (happy ?p)))
        )
    )
)
