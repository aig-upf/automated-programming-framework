(define (domain pointers)
	(:requirements :conditional-effects :typing)
	(:types variable value)
	(:constants a b c tail target - variable)
	(:predicates
		;; Assigments
		(assignment ?var - variable ?val - value)
		(vector-assignment ?val1 ?val2 - value)
		(content ?var - variable ?val - value)

		;; Static relations between values
		(next ?val1 ?val2 - value)
		(less ?val1 ?val2 - value)

		;; Derived relations between variables
		(istail-a)
		(found-a)
		(lessthan-b-a)
		(lessthan-content-a-b)
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

	(:action inc-c
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment c ?val1) (next ?val1 ?val2))
		                           (and (not (assignment c ?val1)) (assignment c ?val2))))))

	(:action assign-a-to-b
		:parameters ()
		:precondition ( and )
		:effect (and (forall (?val - value) (not (content b ?val)))
			     (forall (?val - value) (not (assignment b ?val)))
			     (forall (?val - value) (when (and (content a ?val)) (and (content b ?val))))
			     (forall (?val - value) (when (and (assignment a ?val)) (and (assignment b ?val))))))

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
       (:derived (istail-a)
		 (exists (?val - value) 
                        (and (assignment a ?val) (assignment tail ?val))))

	(:derived (found-a)
		(exists (?val - value)
		        (and (content a ?val) (assignment target ?val))))

	(:derived (lessthan-b-a)
		(exists (?val1 ?val2 - value)
		        (and (assignment b ?val1) (assignment a ?val2) (less ?val1 ?val2))))

	(:derived (lessthan-content-a-b)
		(exists (?val1 ?val2 - value)
		        (and (content a ?val1) (content b ?val2) (less ?val1 ?val2))))
)
