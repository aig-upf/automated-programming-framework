(define (domain variables)
	(:requirements :conditional-effects :typing)
	(:types variable value line)
	(:constants a b c d - variable v0 v1 - value l0 l1 l2 l3 l4 l5 - line )
	(:predicates
		;; Variable assigment
		(assignment ?var - variable ?val - value)

		;; Static relations between values
		(sum ?val1 ?val2 ?val3 - value)
		(current-line ?l - line )
		(done)
	)

	;;
	;; Modifying variable assigment
	;;	

	(:action dec-b
		:parameters ()
		:precondition ( and (current-line l0) )
		:effect (and (not (current-line l0)) (current-line l1) (forall (?val1 ?val2 - value)
		                     (when (and (assignment b ?val2) (sum v1 ?val1 ?val2))
		                           (and (not (assignment b ?val2)) (assignment b ?val1))))))

	(:action add-a-d
		:parameters ()
		:precondition ( and (current-line l3))
		:effect (and (not (current-line l3))(current-line l4)(forall (?val1 ?val2 ?val3 - value)
		                     (when (and (assignment a ?val1) (assignment d ?val2) (sum ?val1 ?val2 ?val3))
		                           (and (not (assignment a ?val1)) (assignment a ?val3))))))

	(:action assign-c-to-d
		:parameters ()
		:precondition ( and (current-line l1) )
		:effect (and (not (current-line l1))(current-line l2)(forall (?v1 ?v2 - value)
			     	     (when (and (assignment c ?v1) (assignment d ?v2))
				     	   (and (not (assignment d ?v2)) (assignment d ?v1))))))

	(:action assign-a-to-c
		:parameters ()
		:precondition ( and (current-line l2))
		:effect (and (not (current-line l2))(current-line l3)(forall (?v1 ?v2 - value)
			     	     (when (and (assignment a ?v1) (assignment c ?v2))
				     	   (and (not (assignment c ?v2)) (assignment c ?v1))))))

	(:action goto-4-0-0
		:parameters ()
		:precondition( and (current-line l4) )
		:effect( and (current-line l0)(not (current-line l4)) )
	)(:action goto-4-0-5
		:parameters ()
		:precondition( and (current-line l4) )
		:effect( and (current-line l5)(not (current-line l4)) )
	)
	(:action end-5
		:parameters()
		;:precondition( and (current-line l5)(assignment a v3) (assignment b v0) (assignment c v2) (assignment d v1) ) ; v3
		:precondition( and (current-line l5)(assignment a v8) (assignment b v0) (assignment c v5) (assignment d v3)) ; v5
		;:precondition( and (current-line l5)(assignment a v13) (assignment b v0) (assignment c v8) (assignment d v5) ) ; v6
		:effect( and (done) )
	)
)
