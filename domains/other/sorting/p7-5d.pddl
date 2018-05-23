(define (problem p7x5d)
  (:domain sorting )
  (:objects 
	 i0 i1 i2 i3 i4 i5 i6 - index
	 v0 v1 v2 v3 v4 - value 
  )
  (:init
	( assignment i0 v3 )
	( assignment i1 v4 )
	( assignment i2 v2 )
	( assignment i3 v4 )
	( assignment i4 v0 )
	( assignment i5 v1 )
	( assignment i6 v0 )
	( consec i0 i1 )
	( consec i1 i2 )
	( consec i2 i3 )
	( consec i3 i4 )
	( consec i4 i5 )
	( consec i5 i6 )
	( lessthan v0 v1 )
	( lessthan v0 v2 )
	( lessthan v0 v3 )
	( lessthan v0 v4 )
	( lessthan v1 v2 )
	( lessthan v1 v3 )
	( lessthan v1 v4 )
	( lessthan v2 v3 )
	( lessthan v2 v4 )
	( lessthan v3 v4 )
	( outeriter i0)
	( outerval v3)
	( iterator i0)
	( currentval v3)
	( itermax i6)
	( itermark i0)
	( valuemark v3) )
  (:goal
	( and 
	( assignment i0 v0 )
	( assignment i1 v0 )
	( assignment i2 v1 )
	( assignment i3 v2 )
	( assignment i4 v3 )
	( assignment i5 v4 )
	( assignment i6 v4 )
	)
  )
)