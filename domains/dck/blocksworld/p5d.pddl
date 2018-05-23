(define (problem p5d)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 c4 c5 - columns  b1 b2 b3 b4 b5 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( adjacent-columns c3 c4 )
	( adjacent-columns c4 c5 )
	( handempty )
	( current-columns c4 )
	( goal-columns c3 )
	( ontable b1 )
	( on b3 b1 )
	( clear b3 )
	( ontable b2 )
	( clear b2 )
	( ontable b5 )
	( clear b5 )
	( ontable b4 )
	( clear b4 ) )
  (:goal
	( and 
	( ontable b4 )
	( clear b4 )
	( ontable b2 )
	( clear b2 )
	( ontable b3 )
	( on b5 b3 )
	( on b1 b5 )
	( clear b1 )
	)
  )
)