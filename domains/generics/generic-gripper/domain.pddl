(define (domain gripper)
   (:requirements :typing)
  (:types relation value variable)
  (:constants at-robby at carry is-hand is-room is-ball free - relation )

  (:predicates
	(includes-1ary ?rel - relation ?val1 )
	(includes-2ary ?rel - relation ?val1 ?val2 - value)
	(arity-1 ?rel - relation)
	(arity-2 ?rel - relation)
  )

   (:action move
       :parameters  ( ?r1 ?r2 - value )
       :precondition ( and (includes-1ary is-room ?r1)(includes-1ary is-room ?r2)(includes-1ary at-robby ?r1)(not (includes-1ary at-robby ?r2)) )
       :effect ( and  (not (includes-1ary at-robby ?r1))(includes-1ary at-robby ?r2) ) )

   (:action pick
	   :parameters ( ?h ?b ?r - value )
	   :precondition (and (includes-1ary is-hand ?h)(includes-1ary is-ball ?b)(includes-1ary is-room ?r)(includes-1ary free ?h)(includes-2ary at ?b ?r)(includes-1ary at-robby ?r)  )
	   :effect (and (includes-2ary carry ?b ?h)(not (includes-2ary at ?b ?r))(not (includes-1ary free ?h)) )
   )

   (:action drop
	   :parameters ( ?h ?b ?r - value )
	   :precondition (and (includes-1ary is-hand ?h)(includes-1ary is-ball ?b)(includes-1ary is-room ?r)(includes-2ary carry ?b ?h)(includes-1ary at-robby ?r)(includes-1ary at-robby ?r)  )
	   :effect (and (includes-1ary free ?h)(includes-2ary at ?b ?r)(not (includes-2ary carry ?b ?h)) )
   )
	
	;(:derived (balls-in-roomB)
	;	(and (forall (?b - ball) (and (at ?b roomB) ))))

	;(:derived (no-balls-in-roomA)
	;	(and (forall (?b - ball) (and (not (at ?b roomA)) ))))
)
