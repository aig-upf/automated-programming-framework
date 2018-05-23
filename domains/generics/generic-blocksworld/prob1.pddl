(define (problem prob1)
	(:domain generic-blocksworld)
	(:objects
        b1 b2 b3 - value		
	)
	(:init
		(includes-2ary on b3 b2)
		(includes-2ary on b2 b1)
		(includes-1ary ontable b1)
		(includes-1ary clear b3)
		(includes-1ary holding empty)
		(arity-2 on)
		(arity-1 ontable)
		(arity-1 clear)
		(arity-1 holding)
	)
	(:goal (and
		(includes-1ary ontable b1)
		(includes-1ary ontable b2)
		(includes-1ary ontable b3)
		(includes-1ary clear b1)
		(includes-1ary clear b2)
		(includes-1ary clear b3)
	))
)


