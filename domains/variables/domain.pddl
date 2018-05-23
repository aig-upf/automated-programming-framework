(define (domain variables)
	(:requirements :conditional-effects :typing)
	(:types variable value)
	(:constants a b c d - variable v0 v1 - value)
	(:predicates
		;; Variable assigment
		(assignment ?var - variable ?val - value)

		;; Static relations between values
		(sum ?val1 ?val2 ?val3 - value)
	)

	;;
	;; Modifying variable assigment
	;;	

	(:action inc-a
		:parameters ()
		:precondition ( and )
		:effect ( and (forall (?val1 ?val2 - value)
		                     (when (and (assignment a ?val1) (sum v1 ?val1 ?val2))
		                           (and (not (assignment a ?val1)) (assignment a ?val2))))))

	(:action dec-a
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment a ?val2) (sum v1 ?val1 ?val2))
		                           (and (not (assignment a ?val2)) (assignment a ?val1))))))

	(:action inc-b
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment b ?val1) (sum v1 ?val1 ?val2))
		                           (and (not (assignment b ?val1)) (assignment b ?val2))))))

	(:action dec-b
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment b ?val2) (sum v1 ?val1 ?val2))
		                           (and (not (assignment b ?val2)) (assignment b ?val1))))))

	(:action add-a-b
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 ?val3 - value)
		                     (when (and (assignment a ?val1) (assignment b ?val2) (sum ?val1 ?val2 ?val3))
		                           (and (not (assignment a ?val1)) (assignment a ?val3))))))

	(:action add-a-d
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 ?val3 - value)
		                     (when (and (assignment a ?val1) (assignment d ?val2) (sum ?val1 ?val2 ?val3))
		                           (and (not (assignment a ?val1)) (assignment a ?val3))))))

	(:action assign-c-to-d
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?v1 ?v2 - value)
			     	     (when (and (assignment c ?v1) (assignment d ?v2))
				     	   (and (not (assignment d ?v2)) (assignment d ?v1))))))

	(:action assign-a-to-c
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?v1 ?v2 - value)
			     	     (when (and (assignment a ?v1) (assignment c ?v2))
				     	   (and (not (assignment c ?v2)) (assignment c ?v1))))))
)
