(define (problem p001-c2)
	(:domain SerialBinaryAdder)
	(:objects i0 i1 last - index  )
	(:init 
		(at i0)
		(next i0 i1)
		(next i1 last)

		(zero c1 i0 )
		(zero c1 i1 )

		(zero c2 i0 )
		(zero c2 i1 )

		(carry)
	)
	(:goal (and 
		(one res i0 )
	))
)
