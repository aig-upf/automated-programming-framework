(define (problem p10c)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - columns  b1 b2 b3 b4 b5 b6 b7 b8 b9 b10 - block )
	
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
	( handempty )
	( current-columns c7 )
	( goal-columns c3 )
	( ontable b2 )
	( on b6 b2 )
	( on b9 b6 )
	( clear b9 )
	( ontable b4 )
	( clear b4 )
	( ontable b1 )
	( clear b1 )
	( ontable b7 )
	( clear b7 )
	( ontable b3 )
	( on b8 b3 )
	( clear b8 )
	( ontable b10 )
	( clear b10 )
	( ontable b5 )
	( clear b5 ) )
  (:goal
	( and 
	( ontable b2 )
	( on b3 b2 )
	( on b9 b3 )
	( on b8 b9 )
	( on b1 b8 )
	( clear b1 )
	( ontable b10 )
	( on b6 b10 )
	( on b7 b6 )
	( clear b7 )
	( ontable b4 )
	( on b5 b4 )
	( clear b5 )
	)
  )
)