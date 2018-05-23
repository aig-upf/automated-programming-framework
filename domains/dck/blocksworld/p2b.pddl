(define (problem p2b)
  (:domain blocksworld)
  (:objects 
	 c1 c2 - columns  b1 b2 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( handempty )
	( current-columns c1 )
	( goal-columns c1 )
	( ontable b2 )
	( on b1 b2 )
	( clear b1 ) )
  (:goal
	( and 
	( ontable b1 )
	( on b2 b1 )
	( clear b2 )
	)
  )
)