(define (domain trees_alt)
	(:requirements :typing)
	(:types variable node)
	(:predicates
		; tree information
		(left-child ?child ?parent - node)
		(right-child ?child ?parent - node)
		(internal ?node - node)
		(visited ?node - node)

		; variables
		(assignment ?var - variable ?node - node)
		(isinternal ?var - variable)
	)

	(:action copy-left
		:parameters (?var1 ?var2 - variable ?child ?parent - node )
		:precondition (and (assignment ?var1 ?parent)(left-child ?child ?parent) )
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))(assignment ?var2 ?child)))

	(:action copy-right
		:parameters (?var1 ?var2 - variable ?child ?parent - node )
		:precondition (and (assignment ?var1 ?parent)(right-child ?child ?parent) )
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))(assignment ?var2 ?child)))

	(:action visit
		:parameters (?var - variable ?node - node)
		:precondition (and (assignment ?var ?node)) 
		:effect (and (visited ?node)))

	(:derived (isinternal ?var - variable)
		(exists (?node - node) (and (assignment ?var ?node) (internal ?node))))

)
