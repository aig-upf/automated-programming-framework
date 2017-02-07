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
		:parameters (?val1 ?val2 ?val - value)
		:precondition (and (assignment a ?val1) (next ?val1 ?val2) (vector-assignment ?val2 ?val))
		:effect (and (forall (?v - value) (not (content a ?v)))
			     (not (assignment a ?val1)) (assignment a ?val2) (content a ?val)))

	(:action dec-pointer-b
		:parameters (?val1 ?val2 ?val - value)
		:precondition (and (assignment b ?val1) (next ?val2 ?val1) (vector-assignment ?val2 ?val))
		:effect (and (forall (?val - value) (not (content b ?val)))
			     (not (assignment b ?val1)) (assignment b ?val2) (content b ?val)))

	(:action inc-c
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment c ?val1) (next ?val1 ?val2))
		:effect (and (not (assignment c ?val1)) (assignment c ?val2)))	

	(:action assign-a-to-b
		:parameters (?val - value)
		:precondition (and (content a ?val)(assignment a ?val))
		:effect (and (forall (?val - value) (not (content b ?val)))
			     (forall (?val - value) (not (assignment b ?val)))
			     (content b ?val)(assignment b ?val)))

	(:action swap-a-b
		:parameters (?v1 ?v2 ?v3 ?v4 - value)
		:precondition (and 
				(assignment a ?v1) (vector-assignment ?v1 ?v2)
				(assignment b ?v3) (vector-assignment ?v3 ?v4))
		:effect (and 
			(not (vector-assignment ?v1 ?v2)) (not (content a ?v2))
			(not (vector-assignment ?v3 ?v4)) (not (content b ?v4))
			(vector-assignment ?v1 ?v4)(content a ?v4)
			(vector-assignment ?v3 ?v2)(content b ?v2)))
 

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
