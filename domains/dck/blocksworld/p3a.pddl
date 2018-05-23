(define (problem p3a)
  (:domain blocksworld)
  (:objects 
	 c1 c2 c3 - columns  b1 b2 b3 - block )
	
  (:init
	( adjacent-columns c1 c2 )
	( adjacent-columns c2 c3 )
	( handempty )
	( current-columns c2 )
	( goal-columns c1 )
	( ontable b3 )
	( clear b3 )
	( ontable b2 )
	( on b1 b2 )
	( clear b1 ) )
  (:goal
	( and 
	( ontable b2 )
	( on b3 b2 )
	( on b1 b3 )
	( clear b1 )
	)
  )
)