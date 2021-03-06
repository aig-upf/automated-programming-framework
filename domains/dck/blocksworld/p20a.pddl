(define (problem p20a)
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
	( current-columns c2 )
	( goal-columns c12 )
	( ontable b12 )
	( on b11 b12 )
	( on b13 b11 )
	( on b1 b13 )
	( on b2 b1 )
	( on b6 b2 )
	( on b4 b6 )
	( on b14 b4 )
	( on b18 b14 )
	( on b3 b18 )
	( on b5 b3 )
	( on b8 b5 )
	( on b17 b8 )
	( on b20 b17 )
	( on b10 b20 )
	( on b15 b10 )
	( on b9 b15 )
	( clear b9 )
	( ontable b7 )
	( on b16 b7 )
	( on b19 b16 )
	( clear b19 ) )
  (:goal
	( and 
	( ontable b19 )
	( clear b19 )
	( ontable b9 )
	( on b2 b9 )
	( on b10 b2 )
	( on b5 b10 )
	( on b13 b5 )
	( on b16 b13 )
	( clear b16 )
	( ontable b20 )
	( on b18 b20 )
	( clear b18 )
	( ontable b3 )
	( clear b3 )
	( ontable b1 )
	( clear b1 )
	( ontable b7 )
	( clear b7 )
	( ontable b12 )
	( on b4 b12 )
	( on b14 b4 )
	( clear b14 )
	( ontable b6 )
	( clear b6 )
	( ontable b15 )
	( clear b15 )
	( ontable b17 )
	( clear b17 )
	( ontable b8 )
	( clear b8 )
	( ontable b11 )
	( clear b11 )
	)
  )
)