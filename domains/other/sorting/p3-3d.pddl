(define (problem p3x3d)
  (:domain sorting )
  (:objects 
	 i0 i1 i2 - index
	 v0 v1 v2 - value 
  )
  (:init
	( assignment i0 v0 )
	( assignment i1 v0 )
	( assignment i2 v1 )
	( consec i0 i1 )
	( consec i1 i2 )
	( lessthan v0 v1 )
	( lessthan v0 v2 )
	( lessthan v1 v2 )
	( outeriter i0)
	( outerval v0)
	( iterator i0)
	( currentval v0)
	( itermax i2)
	( itermark i0)
	( valuemark v0) )
  (:goal
	( and 
	( assignment i0 v0 )
	( assignment i1 v0 )
	( assignment i2 v1 )
	)
  )
)