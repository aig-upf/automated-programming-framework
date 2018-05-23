; IPC5 Domain: Storage Propositional
; Authors: Alfonso Gerevini and Alessandro Saetti 

(define (domain Storage-Propositional)
(:requirements :typing)
(:types relation value - object 
	hoist surface place area - value
	container depot - place
	storearea transitarea - area
	area crate - surface)

(:constants clear in available lifting at on connected - relation )

(:predicates
	(includes-1ary ?rel - relation ?val - value)
	(includes-2ary ?rel - relation ?val1 ?val2 - value)
	(arity-1 ?rel - relation)
	(arity-2 ?rel - relation)
)

(:action lift
 :parameters (?h - hoist ?c - crate ?a1 - storearea ?a2 - area ?p - place)
 :precondition (and 
			(includes-2ary connected ?a1 ?a2) 
			(includes-2ary at ?h ?a2) 
			(includes-1ary available ?h) 
		    (includes-2ary on ?c ?a1) 
			(includes-2ary in ?a1 ?p))
 :effect (and 
			(not (includes-2ary on ?c ?a1)) 
			(includes-1ary clear ?a1)
			(not (includes-1ary available ?h)) 
			(includes-2ary lifting ?h ?c) 
			(not (includes-2ary in ?c ?p))
))
				
(:action drop
 :parameters (?h - hoist ?c - crate ?a1 - storearea ?a2 - area ?p - place)
 :precondition (and 
			(includes-2ary connected ?a1 ?a2) 
			(includes-2ary at ?h ?a2) 
			(includes-2ary lifting ?h ?c) 
		    (includes-1ary clear ?a1) 
			(includes-2ary in ?a1 ?p))
 :effect (and 
			(not (includes-2ary lifting ?h ?c)) 
			(includes-1ary available ?h)
	      	(not (includes-1ary clear ?a1)) 
			(includes-2ary on ?c ?a1) 
			(includes-2ary in ?c ?p)))

(:action move
 :parameters (?h - hoist ?from ?to - storearea)
 :precondition (and 
			(includes-2ary at ?h ?from) 
			(includes-1ary clear ?to) 
			(includes-2ary connected ?from ?to))
 :effect (and 
			(not (includes-2ary at ?h ?from)) 
			(includes-2ary at ?h ?to) 
			(not (includes-1ary clear ?to)) 
			(includes-1ary clear ?from)))

(:action go-out
 :parameters (?h - hoist ?from - storearea ?to - transitarea)
 :precondition (and 
			(includes-2ary at ?h ?from) 
			(includes-2ary connected ?from ?to))
 :effect (and 
			(not (includes-2ary at ?h ?from)) 
			(includes-2ary at ?h ?to) 
			(includes-1ary clear ?from)))

(:action go-in
 :parameters (?h - hoist ?from - transitarea ?to - storearea)
 :precondition (and 
			(includes-2ary at ?h ?from) 
			(includes-2ary connected ?from ?to) 
			(includes-1ary clear ?to))
 :effect (and 
			(not (includes-2ary at ?h ?from)) 
			(includes-2ary at ?h ?to) 
			(not (includes-1ary clear ?to))))
)

