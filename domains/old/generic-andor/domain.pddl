(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:constants y - variable v0 v1 - value)
	(:predicates
		(assignment ?var - variable ?val - value)
		(ordinal-1ary ?rel - relation)
		(includes-1ary ?rel - relation ?val - value)
	)

	;;;;; WITH PRECONDITIONS (CAN'T SWAP)
	(:action set-y-v0
		:parameters ()
		:precondition (and (not (assignment y v1) ) )
		:effect (and (assignment y v0) )			
	)

	(:action set-y-v1
		:parameters ()
		:precondition (and (not (assignment y v0) ) )
		:effect (and (assignment y v1) )			
	)

	;;;;; WITHOUT PRECONDITIONS (SWAP VALUES)
	;(:action set-y-v0
	;	:parameters ()
	;	:precondition ( )
	;	:effect (and (assignment y v0) (not (assignment y v1) ))			
	;)

	;(:action set-y-v1
	;	:parameters ()
	;	:precondition ()
	;	:effect (and (assignment y v1) (not (assignment y v0) ) )			
	;)

)
