(define (problem p01A)
	(:domain SerialBinaryAdder)
	(:objects i0 i1 last - index  )
	(:init 
		(at i0)
		(next i0 i1)
		(next i1 last)

		(zero first i0 )
		(zero first i1 )

		(one second i0 )
		(zero second i1 )
	)
	(:goal (and 
		(one res i0 )
		(zero res i1 )
	))
)
