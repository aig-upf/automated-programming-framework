(define (problem p2a)
  (:domain blocksworld)
  (:objects 
	 c1 c2 - columns  b1 b2 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( handempty )
	( current-columns c1 )
	( goal-columns c2 )
	( ontable b1 )
	( on b2 b1 )
	( clear b2 ) )
  (:goal
	( and 
	( ontable b1 )
	( clear b1 )
	( ontable b2 )
	( clear b2 )
	)
  )
)