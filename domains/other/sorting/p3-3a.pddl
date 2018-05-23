(define (problem p3x3a)
  (:domain sorting )
  (:objects 
	 i0 i1 i2 - index
	 v0 v1 v2 - value 
  )
  (:init
	( assignment i0 v1 )
	( assignment i1 v2 )
	( assignment i2 v0 )
	( consec i0 i1 )
	( consec i1 i2 )
	( lessthan v0 v1 )
	( lessthan v0 v2 )
	( lessthan v1 v2 )
	( outeriter i0)
	( outerval v1)
	( iterator i0)
	( currentval v1)
	( itermax i2)
	( itermark i0)
	( valuemark v1) )
  (:goal
	( and 
	( assignment i0 v0 )
	( assignment i1 v1 )
	( assignment i2 v2 )
	)
  )
)