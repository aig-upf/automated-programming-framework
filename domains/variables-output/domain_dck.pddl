(define (domain variables-output)
	(:requirements :typing)
	(:types variable value)
	(:constants a b c d - variable)
	(:predicates
		;; Variable assigment
		(assignment ?var - variable ?val - value)

		;; Static relations between values
		(next ?val1 ?val2 - value)

		;; Dynamic relations between values
		(output-two ?val1 ?val2 - value)
		(not-output-two ?val1 ?val2 - value)

		;; Derived relations between variables
		(equal-a-c)
		(equal-b-d)
		(diff-a-c)
		(diff-b-d)
	)


	;;
	;; Modifying Variable assigment
	;;	

	(:action inc-a
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment a ?val1) (next ?val1 ?val2))
		:effect (and (not (assignment a ?val1)) (assignment a ?val2)))

	(:action dec-a
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment a ?val2) (next ?val1 ?val2))
		:effect (and (not (assignment a ?val2)) (assignment a ?val1)))

	(:action inc-b
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment b ?val1) (next ?val1 ?val2))
		:effect (and (not (assignment b ?val1)) (assignment b ?val2)))

	(:action dec-b
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment b ?val2) (next ?val1 ?val2))
		:effect (and (not (assignment b ?val2)) (assignment b ?val1)))


	;;
	;; Modifying dynamic relations
	;;	
	(:action output-a-b
		:parameters (?val1 ?val2 - value)
		:precondition (and (assignment a ?val1) (assignment b ?val2))
		:effect (and (output-two ?val1 ?val2)(not (not-output-two ?val1 ?val2)) ))


	;;
	;; Checking derived relations
	;;

       (:derived (equal-a-c)
		 (exists (?val - value) (and (assignment a ?val) (assignment c ?val))))

       (:derived (diff-a-c)
		 (exists (?val - value) (and (assignment a ?val) (not (assignment c ?val)))))

       (:derived (equal-b-d)
		 (exists (?val - value) (and (assignment b ?val) (assignment d ?val))))

       (:derived (diff-b-d)
		 (exists (?val - value) (and (assignment b ?val) (not (assignment d ?val)))))
)
