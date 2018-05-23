(define (domain pointers)
	(:requirements :conditional-effects :typing)
	(:types variable value)
	;(:constants a b c tail target - variable)
	(:constants a b - variable)
	(:predicates
		;; Assigments
		(assignment ?var - variable ?val - value)
		(vector-assignment ?val1 ?val2 - value)
		(content ?var - variable ?val - value)

		;; Static relations between values
		(next ?val1 ?val2 - value)
		(less ?val1 ?val2 - value)

		;; Derived relations between variables
		(lessthan-b-a)
	)


	;;
	;; Modifying Variable assigment
	;;	

	(:action inc-pointer-a
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val - value) (not (content a ?val)))
			     (forall (?val1 ?val2 ?val - value)
		                     (when (and (assignment a ?val1) (next ?val1 ?val2) (vector-assignment ?val2 ?val))
		                           (and (not (assignment a ?val1)) (assignment a ?val2) (content a ?val))))))

	(:action dec-pointer-b
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val - value) (not (content b ?val)))
			     (forall (?val1 ?val2 ?val - value)
		                     (when (and (assignment b ?val1) (next ?val2 ?val1) (vector-assignment ?val2 ?val))
		                           (and (not (assignment b ?val1)) (assignment b ?val2) (content b ?val))))))

	(:action swap-a-b
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment a ?val1) (vector-assignment ?val1 ?val2))
				     	   (and (not (vector-assignment ?val1 ?val2)) (not (content a ?val2)))))
			     (forall (?val1 ?val2 - value)
		                     (when (and (assignment b ?val1) (vector-assignment ?val1 ?val2))
				     	   (and (not (vector-assignment ?val1 ?val2)) (not (content b ?val2)))))
			     (forall (?val1 ?val2 - value)
		                     (when (and (assignment a ?val1) (content b ?val2))
				     	   (and (vector-assignment ?val1 ?val2) (content a ?val2))))
			     (forall (?val1 ?val2 - value)
		                     (when (and (assignment b ?val1) (content a ?val2))
				     	   (and (vector-assignment ?val1 ?val2) (content b ?val2))))))

	;;
	;; Checking derived relations
	;;

	(:derived (lessthan-b-a)
		(exists (?val1 ?val2 - value)
		        (and (assignment b ?val1) (assignment a ?val2) (less ?val1 ?val2))))

)
