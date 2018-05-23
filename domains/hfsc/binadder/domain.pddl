(define (domain SerialBinaryAdder)
	(:requirements :typing)
	(:types index containers)
 	(:constants c1 c2 res - containers)
	(:predicates
		(at ?i - index)
		(next ?i1 ?i2 - index)

		(zero ?c - containers ?i - index)
		(one ?c - containers ?i - index)

		(carry)

		(current-c1-zero)
		(current-c1-one)
		(current-c2-zero)
		(current-c2-one)
	)

	(:action add-00-carry
		:parameters ()
		:precondition (and (carry))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(zero c1 ?i1)(zero c2 ?i1))
					(and (not (at ?i1))(at ?i2)(one res ?i1)(not (carry)))
				)
			)
		)
	)
	(:action add-01-carry
		:parameters ()
		:precondition (and (carry))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(one c1 ?i1)(zero c2 ?i1))
					(and (not (at ?i1))(at ?i2)(zero res ?i1))
				)
			)
		)
	)
	(:action add-10-carry
		:parameters ()
		:precondition (and (carry))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(zero c1 ?i1)(one c2 ?i1))
					(and (not (at ?i1))(at ?i2)(zero res ?i1))
				)
			)
		)
	)
	(:action add-11-carry
		:parameters ()
		:precondition (and (carry))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(one c1 ?i1)(one c2 ?i1))
					(and (not (at ?i1))(at ?i2)(one res ?i1))
				)
			)
		)
	)
	(:action add-00-no-carry
		:parameters ()
		:precondition (and (not (carry)))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(zero c1 ?i1)(zero c2 ?i1))
					(and (not (at ?i1))(at ?i2)(zero res ?i1))
				)
			)
		)
	)
	(:action add-01-no-carry
		:parameters ()
		:precondition (and (not (carry)))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(one c1 ?i1)(zero c2 ?i1))
					(and (not (at ?i1))(at ?i2)(one res ?i1))
				)
			)
		)
	)
	(:action add-10-no-carry
		:parameters ()
		:precondition (and (not (carry)))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(zero c1 ?i1)(one c2 ?i1))
					(and (not (at ?i1))(at ?i2)(one res ?i1))
				)
			)
		)
	)
	
	(:action add-11-no-carry
		:parameters ()
		:precondition (and (not (carry)))
		:effect (and
			(forall (?i1 ?i2 - index)
				(when
					(and (at ?i1)(next ?i1 ?i2)(one c1 ?i1)(one c2 ?i1))
					(and (not (at ?i1))(at ?i2)(zero res ?i1)(carry))
				)
			)
		)
	)

	(:derived (current-c1-zero)
		(exists (?i - index) (and (at ?i)(zero c1 ?i) ))
	)

	(:derived (current-c1-one)
		(exists (?i - index) (and (at ?i)(one c1 ?i) ))
	)
	(:derived (current-c2-zero)
		(exists (?i - index) (and (at ?i)(zero c2 ?i) ))
	)

	(:derived (current-c2-one)
		(exists (?i - index) (and (at ?i)(one c2 ?i) ))
	)
)
