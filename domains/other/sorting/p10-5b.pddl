(define (problem p10x5b)
  (:domain sorting )
  (:objects 
	 i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 - index
	 v0 v1 v2 v3 v4 - value 
  )
  (:init
	( assignment i0 v1 )
	( assignment i1 v1 )
	( assignment i2 v3 )
	( assignment i3 v2 )
	( assignment i4 v2 )
	( assignment i5 v0 )
	( assignment i6 v0 )
	( assignment i7 v2 )
	( assignment i8 v4 )
	( assignment i9 v2 )
	( consec i0 i1 )
	( consec i1 i2 )
	( consec i2 i3 )
	( consec i3 i4 )
	( consec i4 i5 )
	( consec i5 i6 )
	( consec i6 i7 )
	( consec i7 i8 )
	( consec i8 i9 )
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
	( outerval v1)
	( iterator i0)
	( currentval v1)
	( itermax i9)
	( itermark i0)
	( valuemark v1) )
  (:goal
	( and 
	( assignment i0 v0 )
	( assignment i1 v0 )
	( assignment i2 v1 )
	( assignment i3 v1 )
	( assignment i4 v2 )
	( assignment i5 v2 )
	( assignment i6 v2 )
	( assignment i7 v2 )
	( assignment i8 v3 )
	( assignment i9 v4 )
	)
  )
)