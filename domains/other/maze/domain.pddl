(define (domain maze)
	(:requirements :typing)
	(:types variable node)
	(:predicates
		; maze information
		(west-child ?child ?parent - node)
		(east-child ?child ?parent - node)
		(north-child ?child ?parent - node)
		(south-child ?child ?parent - node)
		(visited ?node - node)
		(wall ?node - node)

		; variables
		(assignment ?var - variable ?node - node)		
	)

	(:action copy-west
		:parameters (?var1 ?var2 - variable)
		:precondition ( and (not (wall ?var1) ) )
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))
		             (forall (?child ?parent - node)
		                     (when (and (assignment ?var1 ?parent) (west-child ?child ?parent))
		                           (and (assignment ?var2 ?child))))))

	(:action copy-east
		:parameters (?var1 ?var2 - variable)
		:precondition ( and (not (wall ?var1) ) ) 
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))
		             (forall (?child ?parent - node)
		                     (when (and (assignment ?var1 ?parent) (east-child ?child ?parent))
		                           (and (assignment ?var2 ?child))))))
	(:action copy-north
		:parameters (?var1 ?var2 - variable)
		:precondition ( and (not (wall ?var1) ) ) 
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))
		             (forall (?child ?parent - node)
		                     (when (and (assignment ?var1 ?parent) (north-child ?child ?parent))
		                           (and (assignment ?var2 ?child))))))
	(:action copy-south
		:parameters (?var1 ?var2 - variable)
		:precondition ( and (not (wall ?var1) ) ) 
		:effect (and (forall (?node - node) (not (assignment ?var2 ?node)))
		             (forall (?child ?parent - node)
		                     (when (and (assignment ?var1 ?parent) (south-child ?child ?parent))
		                           (and (assignment ?var2 ?child))))))

	(:action visit
		:parameters (?var - variable)
		:precondition ( and ) 
		:effect (and (forall (?node - node)
		                     (when (and (assignment ?var ?node))
		                           (and (visited ?node))))))

	

)
