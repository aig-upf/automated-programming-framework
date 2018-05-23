(define (domain programming)
	(:requirements :typing)
	(:types relation value variable)
	(:constants 
		next sum - relation
		fn fn1 fn2 iter - variable )
	(:predicates
		(assignment ?var - variable ?val - value)

		(includes-2ary ?rel - relation ?val1 ?val2 - value)
		(includes-3ary ?rel - relation ?val1 ?val2 ?val3 - value)

		(arity-2 ?rel - relation)
		(arity-3 ?rel - relation)
	)

	(:action decrement-2ary
		:parameters (?var - variable ?v1 ?v2 - value)
		:precondition (and (assignment ?var ?v2) (includes-2ary next ?v1 ?v2) )
		:effect (and (not (assignment ?var ?v2)) (assignment ?var ?v1)))

	(:action increment-2ary
		:parameters (?var - variable ?v1 ?v2 - value)
		:precondition (and (assignment ?var ?v1) (includes-2ary next ?v1 ?v2) )
		:effect (and (not (assignment ?var ?v1)) (assignment ?var ?v2)))

	(:action increment-3ary
		:parameters (?var1 ?var2 - variable ?v1 ?v2 ?v3 - value)
		:precondition (and (assignment ?var1 ?v1) (assignment ?var2 ?v2) (includes-3ary sum ?v1 ?v2 ?v3) )
		:effect (and (not (assignment ?var1 ?v1)) (assignment ?var1 ?v3)))

	(:action copy-2ary
		:parameters (?var1 ?var2 - variable ?v1 ?v2 - value)
		:precondition (and (assignment ?var1 ?v1)(assignment ?var2 ?v2) )
		:effect (and (not (assignment ?var1 ?v1))(assignment ?var1 ?v2) ))

)
