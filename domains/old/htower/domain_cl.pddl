(define (domain htower)
	(:requirements :typing)
	(:types value)
	(:predicates
		(consecA ?v1 ?v2 - value)
		(consecB ?v1 ?v2 - value)
		(consecC ?v1 ?v2 - value)
		(clearA ?v - value)
		(clearB ?v - value)
		(clearC ?v - value)
		(greater-than ?v1 ?v2 - value)
		(handempty)
		(holding ?v)
		(done)
		(odd)
		(goal-consecC ?v1 ?v2 - value)
	)

	(:action pick-from-A
		:parameters ()
		:precondition () 
		:effect (and (forall (?v1 ?v2)
		                     (when (and (handempty) (clearA ?v2) (consecA ?v1 ?v2))
		                           (and (not (handempty)) (not (clearA ?v2)) (not (consecA ?v1 ?v2)) (clearA ?v1) (holding ?v2))))))
	(:action pick-from-B
		:parameters ()
		:precondition () 
		:effect (and (forall (?v1 ?v2)
		                     (when (and (handempty) (clearB ?v2) (consecB ?v1 ?v2))
		                           (and (not (handempty)) (not (clearB ?v2)) (not (consecB ?v1 ?v2)) (clearB ?v1) (holding ?v2))))))
	(:action pick-from-C
		:parameters ()
		:precondition () 
		:effect (and (forall (?v1 ?v2)
		                     (when (and (handempty) (clearC ?v2) (consecC ?v1 ?v2))
		                           (and (not (handempty)) (not (clearC ?v2)) (not (consecC ?v1 ?v2)) (clearC ?v1) (holding ?v2))))))


	(:action drop-to-A
		:parameters ()
		:precondition () 
		:effect (and (forall (?v1 ?v2 - value)
		                     (when (and (holding ?v1) (clearA ?v2) (greater-than ?v2 ?v1))
		                           (and (not (holding ?v1)) (not (clearA ?v2)) (clearA ?v1) (consecA ?v2 ?v1) (handempty))))))

	(:action drop-to-B
		:parameters ()
		:precondition () 
		:effect (and (forall (?v1 ?v2 - value)
		                     (when (and (holding ?v1) (clearB ?v2) (greater-than ?v2 ?v1))
		                           (and (not (holding ?v1)) (not (clearB ?v2)) (clearB ?v1) (consecB ?v2 ?v1) (handempty))))))

	(:action drop-to-C
		:parameters ()
		:precondition () 
		:effect (and (forall (?v1 ?v2 - value)
		                     (when (and (holding ?v1) (clearC ?v2) (greater-than ?v2 ?v1))
		                           (and (not (holding ?v1)) (not (clearC ?v2)) (clearC ?v1) (consecC ?v2 ?v1) (handempty))))))

	(:derived (done)
		(forall (?v1 ?v2 - value)
		        (or (not (goal-consecC ?v2 ?v1)) (consecC ?v2 ?v1))))

	(:derived (legalAB)
		(exists (?v1 ?v2 - value)
			(and (clearA ?v1) (clearB ?v2) (greater-than ?v2 ?v1))))

	(:derived (legalAC)
		(exists (?v1 ?v2 - value)
			(and (clearA ?v1) (clearC ?v2) (greater-than ?v2 ?v1))))

	(:derived (legalBC)
		(exists (?v1 ?v2 - value) 
			(and (clearB ?v1) (clearC ?v2) (greater-than ?v2 ?v1))))
)
