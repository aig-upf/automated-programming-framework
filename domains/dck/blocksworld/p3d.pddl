(define (problem p3d)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 - columns  b1 b2 b3 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( handempty )
	( current-columns c1 )
	( goal-columns c1 )
	( ontable b1 )
	( on b2 b1 )
	( on b3 b2 )
	( clear b3 ) )
  (:goal
	( and 
	( ontable b3 )
	( on b2 b3 )
	( on b1 b2 )
	( clear b1 )
	)
  )
)