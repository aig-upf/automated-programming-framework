(define (problem p1)
	(:domain SerialBinaryAdder)
	(:objects i0 i1 i2 i3 i4 i5 i6 i7 last - index  )
	(:init 
		(at i0)
		(next i0 i1)
		(next i1 i2)
		(next i2 i3)
		(next i3 i4)
		(next i4 i5)
		(next i5 i6)
		(next i6 i7)
		(next i7 last)

		(one c1 i0 )
		(zero c1 i1 )
		(one c1 i2 )
		(one c1 i3 )
		(one c1 i4 )
		(one c1 i5 )
		(zero c1 i6 )
		(zero c1 i7 )

		(zero c2 i0 )
		(zero c2 i1 )
		(one c2 i2 )
		(zero c2 i3 )
		(one c2 i4 )
		(zero c2 i5 )
		(one c2 i6 )
		(zero c2 i7 )
	)
	(:goal (and 
		(one res i0 )
		(zero res i1 )
		(zero res i2 )
		(zero res i3 )
		(one res i4 )
		(zero res i5 )
		(zero res i6 )
		(one res i7 )
	))
)
