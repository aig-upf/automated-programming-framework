(define (problem p20c)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 - columns  b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 b11 b12 b13 b14 b15 b16 b17 b18 b19 b20 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( adjacent-columns c3 c4 )
	( adjacent-columns c4 c5 )
	( adjacent-columns c5 c6 )
	( adjacent-columns c6 c7 )
	( adjacent-columns c7 c8 )
	( adjacent-columns c8 c9 )
	( adjacent-columns c9 c10 )
	( adjacent-columns c10 c11 )
	( adjacent-columns c11 c12 )
	( adjacent-columns c12 c13 )
	( adjacent-columns c13 c14 )
	( adjacent-columns c14 c15 )
	( adjacent-columns c15 c16 )
	( adjacent-columns c16 c17 )
	( adjacent-columns c17 c18 )
	( adjacent-columns c18 c19 )
	( adjacent-columns c19 c20 )
	( handempty )
	( current-columns c19 )
	( goal-columns c15 )
	( ontable b4 )
	( on b6 b4 )
	( clear b6 )
	( ontable b3 )
	( clear b3 )
	( ontable b18 )
	( clear b18 )
	( ontable b19 )
	( clear b19 )
	( ontable b12 )
	( clear b12 )
	( ontable b11 )
	( clear b11 )
	( ontable b1 )
	( clear b1 )
	( ontable b14 )
	( clear b14 )
	( ontable b2 )
	( clear b2 )
	( ontable b16 )
	( clear b16 )
	( ontable b20 )
	( clear b20 )
	( ontable b13 )
	( clear b13 )
	( ontable b8 )
	( clear b8 )
	( ontable b17 )
	( clear b17 )
	( ontable b7 )
	( clear b7 )
	( ontable b15 )
	( clear b15 )
	( ontable b5 )
	( clear b5 )
	( ontable b9 )
	( clear b9 )
	( ontable b10 )
	( clear b10 ) )
  (:goal
	( and 
	( ontable b17 )
	( on b16 b17 )
	( on b3 b16 )
	( on b15 b3 )
	( on b18 b15 )
	( clear b18 )
	( ontable b10 )
	( clear b10 )
	( ontable b11 )
	( on b6 b11 )
	( clear b6 )
	( ontable b7 )
	( clear b7 )
	( ontable b2 )
	( clear b2 )
	( ontable b12 )
	( clear b12 )
	( ontable b8 )
	( clear b8 )
	( ontable b4 )
	( clear b4 )
	( ontable b1 )
	( clear b1 )
	( ontable b9 )
	( clear b9 )
	( ontable b5 )
	( clear b5 )
	( ontable b14 )
	( clear b14 )
	( ontable b13 )
	( clear b13 )
	( ontable b20 )
	( clear b20 )
	( ontable b19 )
	( clear b19 )
	)
  )
)