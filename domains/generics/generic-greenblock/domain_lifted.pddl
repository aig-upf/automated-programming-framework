(define (domain blocks)
  (:requirements :typing)
  (:types relation value variable)
  (:constants on ontable clear hold green have havent - relation )

  (:predicates
	;(assignment ?var - variable ?val - value)
	(includes-1ary ?rel - relation ?val1 )
	(includes-2ary ?rel - relation ?val1 ?val2 - value)
	(arity-1 ?rel - relation)
	(arity-2 ?rel - relation)
    (handempty)
  )

  (:action unstack
    :parameters (?x ?y - value)
    :precondition (and (includes-1ary clear ?x) (handempty)(or (includes-2ary on ?x ?y)(includes-1ary ontable ?x)) )
    :effect (and 
				(when (and )
					(and (includes-1ary hold ?x) (includes-1ary clear ?y) (not (includes-1ary clear ?x)) (not (includes-2ary on ?x ?y)) (not (handempty)) ) )
				(when (and (includes-1ary ontable ?x))
					(and (includes-1ary hold ?x) (not (includes-1ary clear ?x)) (not (includes-1ary ontable ?x)) (not (handempty)) ) )
			)
  )

  (:action drop
    :parameters (?x - value)
    :precondition (and (includes-1ary hold ?x))
    :effect (and (handempty)(includes-1ary havent ?x) (not (includes-1ary hold ?x)))
  )

  (:action collect
    :parameters (?x - value)
    :precondition (and (includes-1ary hold ?x)(includes-1ary green ?x))
    :effect (and (includes-1ary have ?x)(handempty) (not (includes-1ary hold ?x)))
  )

  ;(:derived (obs-greenish)
  ;  (exists (?x - block) (and (includes-1ary clear ?x) (includes-1ary green ?x))))

)

