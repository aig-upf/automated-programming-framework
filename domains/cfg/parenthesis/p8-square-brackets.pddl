(define (problem p8-square-brackets)
  (:domain complex-parenthesis)
  (:objects i0 i1 i2 i3 i4 i5 i6 i7 i8 - index )
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
	(content i0 lsqbra)
	(content i1 lsqbra)
	(content i2 lsqbra)
	(content i3 lsqbra)
	(content i4 rsqbra)
	(content i5 rsqbra)
	(content i6 rsqbra)
	(content i7 rsqbra)
	(current-content lsqbra)
	(content i8 empty)
  )
  (:goal (and 
	(at i8)
  ))
)
