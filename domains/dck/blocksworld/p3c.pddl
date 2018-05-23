(define (problem p3c)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 - columns  b1 b2 b3 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( handempty )
	( current-columns c1 )
	( goal-columns c3 )
	( ontable b3 )
	( on b1 b3 )
	( on b2 b1 )
	( clear b2 ) )
  (:goal
	( and 
	( ontable b3 )
	( clear b3 )
	( ontable b2 )
	( clear b2 )
	( ontable b1 )
	( clear b1 )
	)
  )
)