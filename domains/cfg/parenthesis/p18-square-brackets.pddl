(define (problem p18-square-brackets)
  (:domain parenthesis)
  (:objects i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 i10 i11 i12 i13 i14 i15 i16 i17 i18 - index )
  (:init  
	(at i0)
	(adjacent i0 i1)
	(adjacent i1 i2)
	(adjacent i2 i3)
	(adjacent i3 i4)
	(adjacent i4 i5)
	(adjacent i5 i6)
	(adjacent i6 i7)
	(adjacent i7 i8)
	(adjacent i8 i9)
	(adjacent i9 i10)
	(adjacent i10 i11)
	(adjacent i11 i12)
	(adjacent i12 i13)
	(adjacent i13 i14)
	(adjacent i14 i15)
	(adjacent i15 i16)
	(adjacent i16 i17)
	(adjacent i17 i18)
	(content i0 lsqbra)
	(content i1 lsqbra)
	(content i2 lsqbra)
	(content i3 rsqbra)
	(content i4 lsqbra)
	(content i5 rsqbra)
	(content i6 rsqbra)
	(content i7 lsqbra)
	(content i8 lsqbra)
	(content i9 lsqbra)
	(content i10 lsqbra)
	(content i11 lsqbra)
	(content i12 rsqbra)
	(content i13 rsqbra)
	(content i14 rsqbra)
	(content i15 rsqbra)
	(content i16 rsqbra)
	(content i17 rsqbra)
  )
  (:goal (and 
	(at i18)
  ))
)
