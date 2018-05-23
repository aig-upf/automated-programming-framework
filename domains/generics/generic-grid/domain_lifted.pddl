(define (domain grid)
	(:requirements :typing)
	(:types relation value variable)
	(:constants 
		xpos ypos - variable
		consec visited notvisited - relation )
	(:predicates
		(assignment ?var - variable ?val - value)
		(includes-2ary ?rel - relation ?v1 ?v2 - value )
		(arity-2 ?rel - relation)
	)


	(:action move
		:parameters (?var - variable ?val1 ?val2 - value)
		:precondition (and (assignment ?var ?val1)(or (includes-2ary consec ?val1 ?val2)(includes-2ary consec ?val2 ?val1) ) )
		:effect (and
			(not (assignment ?var ?val1))
			(assignment ?var ?val2)
		)
	)

	(:action visit
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment xpos ?val1) (assignment ypos ?val2)(includes-2ary notvisited ?val1 ?val2) )
		:effect (and (includes-2ary visited ?val1 ?val2)(not (includes-2ary notvisited ?val1 ?val2))))


)
