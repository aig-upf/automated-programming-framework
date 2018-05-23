(define (problem p4c)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 c4 - columns  b1 b2 b3 b4 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( adjacent-columns c3 c4 )
	( handempty )
	( current-columns c1 )
	( goal-columns c3 )
	( ontable b1 )
	( on b3 b1 )
	( on b4 b3 )
	( on b2 b4 )
	( clear b2 ) )
  (:goal
	( and 
	( ontable b3 )
	( on b4 b3 )
	( clear b4 )
	( ontable b1 )
	( clear b1 )
	( ontable b2 )
	( clear b2 )
	)
  )
)