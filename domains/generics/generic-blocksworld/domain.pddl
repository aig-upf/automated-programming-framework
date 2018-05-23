(define (domain generic-blocksworld)
	(:requirements :typing)
	(:types relation value variable)
	(:constants on ontable clear holding - relation );empty - value )
	(:predicates

		(includes-1ary ?rel - relation ?val - value)
		(includes-2ary ?rel - relation ?val1 ?val2 - value)
		(arity-1 ?rel - relation)
		(arity-2 ?rel - relation)
		(handempty)
	)

  	(:action pick-up
	     :parameters (?x - value)
		 :precondition (and 
				(includes-1ary clear ?x)
				(includes-1ary ontable ?x)
				(handempty))
	     :effect
			(and (not (includes-1ary clear ?x) ) 
				 (not (includes-1ary ontable ?x) ) 
				 (not (handempty))
				 (includes-1ary holding ?x) )
  	)

	(:action unstack
	     :parameters (?x ?y - value)
		 :precondition (and 
				(includes-1ary clear ?x)
				(includes-2ary on ?x ?y)
				(handempty))
	     :effect
			(and (not (includes-1ary clear ?x) ) 
				 (not (includes-2ary on ?x ?y) )  
				 (not (handempty))
				 (includes-1ary clear ?y)
				 (includes-1ary holding ?x) )
  	)

  	(:action put-down
	     :parameters (?x - value)
		 :precondition (and (includes-1ary holding ?x))
	     :effect
			(and 
				 (not (includes-1ary holding ?x)) 
				 (handempty)
				 (includes-1ary clear ?x) 
				 (includes-1ary ontable ?x) )
  	)

  	(:action stack
	     :parameters (?x ?y - value)
		 :precondition (and 
				(includes-1ary holding ?x)
				(includes-1ary clear ?y))
	     :effect
			(and 
				(handempty)
				(not (includes-1ary holding ?x) ) 
				(not (includes-1ary clear ?y) ) 
				(includes-1ary clear ?x) 
				(includes-2ary on ?x ?y) )
  	)

)
