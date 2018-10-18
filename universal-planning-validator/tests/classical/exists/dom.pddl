(define (domain exists-test-1)
    (:requirements :typing)
    (:types person door - object)
    (:predicates
        (opened ?d - door)
        (out-room ?p - person)
        (in-room ?p - person)
    )
    (:action open-door
        :parameters (?p - person ?d - door)
        :precondition (and (in-room ?p) (not (opened ?d)))
        :effect (opened ?d)
    )
    (:action escape-from-room
        :parameters (?p - person)
        :precondition (exists (?d - door) (opened ?d))
        :effect (and (out-room ?p) (not (in-room ?p)))
    )
)
