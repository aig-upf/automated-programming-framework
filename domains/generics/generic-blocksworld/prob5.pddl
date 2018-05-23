(define (problem prob5)
	(:domain generic-blocksworld)
	(:objects
		b1 b2 b3 b4 - value
		;gon gclear gholding gontable - relation
		;gon gclear gontable - relation
		gon gontable - relation
	)
	(:init
		(includes-1ary clear b4)
		(includes-2ary on b4 b3)
		(includes-2ary on b3 b1)
		(includes-2ary on b1 b2)
		(includes-1ary ontable b2)
		
		;(includes-1ary gclear b1)
		(includes-2ary gon b1 b2)
		(includes-2ary gon b2 b3)
		(includes-1ary gontable b3)
		;(includes-1ary gclear b4)
		(includes-1ary gontable b4)

		(arity-2 on)
		(arity-1 ontable)
		(arity-1 clear)
		(arity-1 holding)

		(arity-2 gon)
		(arity-1 gontable)
		;(arity-1 gclear)
		;(arity-1 gholding)

		(handempty)
	)
	(:goal (and
		(includes-1ary clear b1)
		(includes-2ary on b1 b2)
		(includes-2ary on b2 b3)
		(includes-1ary ontable b3)
		(includes-1ary clear b4)
		(includes-1ary ontable b4)
	) )
)
