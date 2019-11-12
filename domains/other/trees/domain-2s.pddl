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
		(all-visited)
	)

	(:action copy-left
		:parameters (?var1 ?var2 - variable)
		:precondition ()
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))
		             (forall (?child ?parent - node)
		                     (when (and (assignment ?var1 ?parent) (left-child ?child ?parent))
		                           (and (assignment ?var2 ?child))))))

	(:action copy-right
		:parameters (?var1 ?var2 - variable)
		:precondition () 
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))
		             (forall (?child ?parent - node)
		                     (when (and (assignment ?var1 ?parent) (right-child ?child ?parent))
		                           (and (assignment ?var2 ?child))))))

	(:action visit
		:parameters (?var - variable)
		:precondition () 
		:effect (and (forall (?node - node)
		                     (when (and (assignment ?var ?node))
		                           (and (visited ?node))))))

	(:derived (isinternal ?var - variable)
		(exists (?node - node) (and (assignment ?var ?node) (internal ?node))))
	(:derived (all-visited)
		(forall (?node - node) (and (visited ?node) )))

)
