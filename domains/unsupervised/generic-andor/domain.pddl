(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:constants y x1 x2 - variable v0 v1 - value)
	;(:constants y - variable zero one - relation x1 x2 v0 v1 - value)
	;(:constants y - variable v0 v1 - value)
	(:predicates
		(assignment ?var - variable ?val - value)
		;(all-one)
		;(ordinal-1ary ?rel - relation)
		;(includes-1ary ?rel - relation ?val - value)
	)
	
	(:action boolean-or-function-x1-x2
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x1 v1)(assignment x2 v1))
				(and (assignment x1 v1)(not (assignment x1 v0))))
			(when (and (assignment x1 v0)(assignment x2 v0))
				(and (assignment x1 v0)(not (assignment x1 v1))))
		)
	)

	(:action boolean-or-function-x1-y
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x1 v1)(assignment y v1))
				(and (assignment x1 v1)(not (assignment x1 v0))))
			(when (and (assignment x1 v0)(assignment y v0))
				(and (assignment x1 v0)(not (assignment x1 v1))))
		)
	)

	(:action boolean-or-function-x2-x1
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x2 v1)(assignment x1 v1))
				(and (assignment x2 v1)(not (assignment x2 v0))))
			(when (and (assignment x2 v0)(assignment x1 v0))
				(and (assignment x2 v0)(not (assignment x2 v1))))
		)
	)
	
	(:action boolean-or-function-x2-y
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x2 v1)(assignment y v1))
				(and (assignment x2 v1)(not (assignment x2 v0))))
			(when (and (assignment x2 v0)(assignment y v0))
				(and (assignment x2 v0)(not (assignment x2 v1))))
		)
	)

	(:action boolean-or-function-y-x1
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment y v1)(assignment x1 v1))
				(and (assignment y v1)(not (assignment y v0))))
			(when (and (assignment y v0)(assignment x1 v0))
				(and (assignment y v0)(not (assignment y v1))))
		)
	)

	(:action boolean-or-function-y-x2
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment y v1)(assignment x2 v1))
				(and (assignment y v1)(not (assignment y v0))))
			(when (and (assignment y v0)(assignment x2 v0))
				(and (assignment y v0)(not (assignment y v1))))
		)
	)

	(:action boolean-not-function-x1
		:parameters()
		:precondition()
		:effect(and
			(when (and (assignment x1 v1))
				(and (assignment x1 v0)(not (assignment x1 v1))))
			(when (and (assignment x1 v0))
				(and (not (assignment x1 v0))(assignment x1 v1)))
		)
	)
	(:action boolean-not-function-x2
		:parameters()
		:precondition()
		:effect(and
			(when (and (assignment x2 v1))
				(and (assignment x2 v0)(not (assignment x2 v1))))
			(when (and (assignment x2 v0))
				(and (not (assignment x2 v0))(assignment x2 v1)))
		)
	)
	(:action boolean-not-function-y
		:parameters()
		:precondition()
		:effect(and
			(when (and (assignment y v1))
				(and (assignment y v0)(not (assignment y v1))))
			(when (and (assignment y v0))
				(and (not (assignment y v0))(assignment y v1)))
		)
	)

	(:action boolean-and-function-x1-x2
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x1 v0)(assignment x2 v0))
				(and (assignment x1 v0)(not (assignment x1 v1))))
			(when (and (assignment x1 v1)(assignment x2 v1))
				(and (assignment x1 v1)(not (assignment x1 v0))))
		)
	)

	(:action boolean-and-function-x1-y
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x1 v0)(assignment y v0))
				(and (assignment x1 v0)(not (assignment x1 v1))))
			(when (and (assignment x1 v1)(assignment y v1))
				(and (assignment x1 v1)(not (assignment x1 v0))))
		)
	)

	(:action boolean-and-function-x2-x1
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x1 v0)(assignment x2 v0))
				(and (assignment x2 v0)(not (assignment x2 v1))))
			(when (and (assignment x1 v1)(assignment x2 v1))
				(and (assignment x2 v1)(not (assignment x2 v0))))
		)
	)
	
	(:action boolean-and-function-x2-y
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment x2 v0)(assignment y v0))
				(and (assignment x2 v0)(not (assignment x2 v1))))
			(when (and (assignment x2 v1)(assignment y v1))
				(and (assignment x2 v1)(not (assignment x2 v0))))
		)
	)

	(:action boolean-and-function-y-x1
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment y v0)(assignment x1 v0))
				(and (assignment y v0)(not (assignment y v1))))
			(when (and (assignment y v1)(assignment x1 v1))
				(and (assignment y v1)(not (assignment y v0))))
		)
	)

	(:action boolean-and-function-y-x2
		:parameters()
		:precondition()
		:effect(and
			(when (or (assignment y v0)(assignment x2 v0))
				(and (assignment y v0)(not (assignment y v1))))
			(when (and (assignment y v1)(assignment x2 v1))
				(and (assignment y v1)(not (assignment y v0))))
		)
	)
	;(:action boolean-and-function-set-v1
	;	:parameters ()
	;	:precondition( and (includes-1ary one x1)(includes-1ary one x2) )
	;	:effect(and (assignment y v1) ) )

	;(:action boolean-and-function-set-v0
	;	:parameters ()
	;	:precondition( and (or (includes-1ary zero x1)(includes-1ary zero x2)) )
	;	:effect(and (assignment y v0) ) )

	;(:action boolean-nand-function-set-v1
	;	:parameters ()
	;	:precondition( and (or (includes-1ary zero x1)(includes-1ary zero x2)) )
	;	:effect(and (assignment y v1) ) )

	;(:action boolean-nand-function-set-v0
	;	:parameters ()
	;	:precondition( and (includes-1ary one x1)(includes-1ary one x2) )
	;	:effect(and (assignment y v0) ) )


	;(:action boolean-and-function-set-v1
	;	:parameters ()
	;	:precondition( and ( not (assignment y v0 ) )( not (assignment y v1 ) )(assignment x1 v1)(assignment x2 v1) )
	;	:effect(and (assignment y v1) ) )

	;(:action boolean-and-function-set-v0
	;	:parameters ()
	;	:precondition( and ( not (assignment y v0 ) )( not (assignment y v1 ) )(or (assignment x1 v0)(assignment x2 v0)) )
	;	:effect(and (assignment y v0) ) )
	
	;(:action boolean-nand-function-set-v1
	;	:parameters ()
	;	:precondition( and ( not (assignment y v0 ) )( not (assignment y v1 ) )(or (assignment x1 v0)(assignment x2 v0)) )
	;	:effect(and (assignment y v1) ) )

	;(:action boolean-nand-function-set-v0
	;	:parameters ()
	;	:precondition( and ( not (assignment y v0 ) )( not (assignment y v1 ) )(assignment x1 v1)(assignment x2 v1) )
	;	:effect(and (assignment y v0) ) )

	;(:derived (all-one)
	;	(exists () (and (assignment x1 v1)(assignment x2 v1))	)
	;)

	;(:action boolean-or-function-set-v1
	;	:parameters ()
	;	:precondition( and ( not ( assignment y v1 ) ) ( not ( assignment y v0 ) )(or (includes-1ary one x1)(includes-1ary one x2)) )
	;	:effect(and (assignment y v1) ) )

	;(:action boolean-or-function-set-v0
	;	:parameters ()
	;	:precondition( and ( not ( assignment y v1 ) ) ( not ( assignment y v0 ) )(includes-1ary zero x1)(includes-1ary zero x2) )
	;	:effect(and (assignment y v0) ) )

	;(:action boolean-xor-function-set-v0
	;	:parameters ()
	;	:precondition( and ( not ( assignment y v1 ) ) ( not ( assignment y v0 ) )
	;					(or (and (includes-1ary zero x1)(includes-1ary zero x2))(and (includes-1ary one x1)(includes-1ary one x2)) ) )
	;	:effect(and (assignment y v0) ) )

	;(:action boolean-xor-function-set-v1
	;	:parameters ()
	;	:precondition( and ( not ( assignment y v1 ) ) ( not ( assignment y v0 ) )
	;					(or (and (includes-1ary zero x1)(includes-1ary one x2))(and (includes-1ary one x1)(includes-1ary zero x2)) ) )
	;	:effect(and (assignment y v1) ) )

	;;;;; WITH PRECONDITIONS (CAN'T SWAP)
	;(:action set-y-v0
	;	:parameters ()
	;	:precondition (and (not (assignment y v1) ) )
	;	:effect (and (assignment y v0) )			
	;)

	;(:action set-y-v1
	;	:parameters ()
	;	:precondition (and (not (assignment y v0) ) )
	;	:effect (and (assignment y v1) )			
	;)

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
