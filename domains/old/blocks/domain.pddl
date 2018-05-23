(define (domain blocks)
  (:requirements :typing)
  (:types block)
  (:predicates (on ?x ?y - block)
               (ontable ?x - block)
               (clear ?x - block)
               (hold ?x - block)
               (green ?x - block)
               (have ?x - block)
               (empty)(finished)
               (obs-greenish))

  (:action unstack
    :parameters (?x ?y - block)
    :precondition (and (not (finished)) (clear ?x) (empty))
    :effect (and 
				(when (and (on ?x ?y))
					(and (hold ?x) (clear ?y) (not (clear ?x)) (not (on ?x ?y)) (not (empty)) ) )
				(when (and (ontable ?x))
					(and (hold ?x) (not (clear ?x)) (not (ontable ?x)) (not (empty)) ) )
			)
  )

  (:action drop
    :parameters (?x - block)
    :precondition (and (not (finished)) (hold ?x))
    :effect (and (empty) (not (hold ?x)))
  )

  (:action collect
    :parameters (?x - block)
    :precondition (and (not (finished)) (hold ?x))
    :effect (and (have ?x) (empty) (finished) (not (hold ?x)))
  )

  (:derived (obs-greenish)
    (exists (?x - block) (and (clear ?x) (green ?x))))

)

