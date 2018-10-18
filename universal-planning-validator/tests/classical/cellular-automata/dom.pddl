
(define (domain cellular-automata)
	(:requirements :typing :conditional-effects)

	(:types
		valid - coord
		coord value
	)

	(:predicates
		(next ?c1 ?c2 - coord)

		(assigna ?c1 ?c2 - coord ?v - value)

		(update-rule ?v1 ?v2 ?v3 ?v4 ?v5 - value)

		(program-phase)
		(execute-phase)

		(active ?c1 ?c2 - coord)  ; for making copies
		(current ?c1 ?c2 - coord) ; for iterating over cells
	)

	(:constants
		c0 cnp1 - coord
		c1 cn - valid
		v0 v1 - value
	)

	(:action program-rule
		:parameters (?v1 ?v2 ?v3 ?v4 ?v5 - value)
		:precondition (and
			(program-phase)
		)
		:effect (and
			(update-rule ?v1 ?v2 ?v3 ?v4 ?v5)
		)
	)

	(:action switch-phases
		:parameters ()
		:precondition (and
			(program-phase)
		)
		:effect (and
			(not (program-phase))
			(execute-phase)
		)
	)

	(:action execute-first
		:parameters (?c - coord ?v1 ?v2 ?v3 ?v4 ?v5 - value)
		:precondition (and
			(next c1 ?c)
			(assigna c0 c1 ?v1)
			(assigna c1 c0 ?v2)
			(assigna c1 c1 ?v3)
			(assigna c1 ?c ?v4)
			(assigna ?c c1 ?v5)
			(execute-phase)
		)
		:effect (and
			(when
				(update-rule ?v1 ?v2 ?v3 ?v4 ?v5)
				(active c1 c1)
			)
			(not (execute-phase))
			(current c1 c1)
		)
	)

	(:action execute-row
		:parameters (?c1 ?c2 ?c3 ?c4 ?c5 ?c6 - coord ?v1 ?v2 ?v3 ?v4 ?v5 - value)
		:precondition (and
			(next ?c1 ?c2)
			(next ?c2 ?c3)
			(next ?c4 ?c5)
			(next ?c5 ?c6)
			(assigna ?c1 ?c5 ?v1)
			(assigna ?c2 ?c4 ?v2)
			(assigna ?c2 ?c5 ?v3)
			(assigna ?c2 ?c6 ?v4)
			(assigna ?c3 ?c5 ?v5)
			(current ?c2 ?c4)
		)
		:effect (and
			(when
				(update-rule ?v1 ?v2 ?v3 ?v4 ?v5)
				(active ?c2 ?c5)
			)
			(not (current ?c2 ?c4))
			(current ?c2 ?c5)
		)
	)

	(:action execute-col
		:parameters (?c1 ?c2 ?c3 ?c6 - coord ?v1 ?v2 ?v3 ?v4 ?v5 - value)
		:precondition (and
			(next ?c1 ?c2)
			(next ?c2 ?c3)
			(next  c1 ?c6)
			(assigna ?c1  c1 ?v1)
			(assigna ?c2  c0 ?v2)
			(assigna ?c2  c1 ?v3)
			(assigna ?c2 ?c6 ?v4)
			(assigna ?c3  c1 ?v5)
			(current ?c1 cn)
		)
		:effect (and
			(when
				(update-rule ?v1 ?v2 ?v3 ?v4 ?v5)
				(active ?c2 c1)
			)
			(not (current ?c1 cn))
			(current ?c2 c1)
		)
	)

	(:action stop-executing
		:parameters ()
		:precondition (and
			(current cn cn)
		)
		:effect (and
			(forall (?c1 ?c2 - valid)
				(when
					(active ?c1 ?c2)
					(and (not (assigna ?c1 ?c2 v0)) (assigna ?c1 ?c2 v1) (not (active ?c1 ?c2)))
				)
			)
			(forall (?c1 ?c2 - valid)
				(when
					(not (active ?c1 ?c2))
					(and (assigna ?c1 ?c2 v0) (not (assigna ?c1 ?c2 v1)))
				)
			)
			(not (current cn cn))
			(execute-phase)
		)
	)
)
