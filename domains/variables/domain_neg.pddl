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

	(:action inc
		:parameters ( ?var - variable )
		:precondition ( and )
		:effect ( and (forall ( ?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val1) (sum v1 ?val1 ?val2))
		                           (and (not (assignment ?var ?val1)) (assignment ?var ?val2))))))

	(:action dec
		:parameters ( ?var - variable )
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 - value)
		                     (when (and (assignment ?var ?val2) (sum v1 ?val1 ?val2))
		                           (and (not (assignment ?var ?val2)) (assignment ?var ?val1))))))

	(:action add
		:parameters ( ?var1 ?var2 - variable )
		:precondition ( and )
		:effect (and (forall (?val1 ?val2 ?val3 - value)
		                     (when (and (assignment ?var1 ?val1) (assignment ?var2 ?val2) (sum ?val1 ?val2 ?val3))
		                           (and (not (assignment ?var1 ?val1)) (assignment ?var2 ?val3))))))


	(:action assign
		:parameters ( ?var1 ?var2 - variable )
		:precondition ( and )
		:effect (and (forall (?v1 ?v2 - value)
			     	     (when (and (assignment ?var1 ?v1) (assignment ?var2 ?v2))
				     	   (and (not (assignment ?var2 ?v2)) (assignment ?var2 ?v1))))))
)
