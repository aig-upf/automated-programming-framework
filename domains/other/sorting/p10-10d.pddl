(define (problem p10x10d)
  (:domain sorting )
  (:objects 
	 i0 i1 i2 i3 i4 i5 i6 i7 i8 i9 - index
	 v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 - value 
  )
  (:init
	( assignment i0 v0 )
	( assignment i1 v7 )
	( assignment i2 v9 )
	( assignment i3 v1 )
	( assignment i4 v5 )
	( assignment i5 v3 )
	( assignment i6 v2 )
	( assignment i7 v7 )
	( assignment i8 v6 )
	( assignment i9 v4 )
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
	( lessthan v0 v5 )
	( lessthan v0 v6 )
	( lessthan v0 v7 )
	( lessthan v0 v8 )
	( lessthan v0 v9 )
	( lessthan v1 v2 )
	( lessthan v1 v3 )
	( lessthan v1 v4 )
	( lessthan v1 v5 )
	( lessthan v1 v6 )
	( lessthan v1 v7 )
	( lessthan v1 v8 )
	( lessthan v1 v9 )
	( lessthan v2 v3 )
	( lessthan v2 v4 )
	( lessthan v2 v5 )
	( lessthan v2 v6 )
	( lessthan v2 v7 )
	( lessthan v2 v8 )
	( lessthan v2 v9 )
	( lessthan v3 v4 )
	( lessthan v3 v5 )
	( lessthan v3 v6 )
	( lessthan v3 v7 )
	( lessthan v3 v8 )
	( lessthan v3 v9 )
	( lessthan v4 v5 )
	( lessthan v4 v6 )
	( lessthan v4 v7 )
	( lessthan v4 v8 )
	( lessthan v4 v9 )
	( lessthan v5 v6 )
	( lessthan v5 v7 )
	( lessthan v5 v8 )
	( lessthan v5 v9 )
	( lessthan v6 v7 )
	( lessthan v6 v8 )
	( lessthan v6 v9 )
	( lessthan v7 v8 )
	( lessthan v7 v9 )
	( lessthan v8 v9 )
	( outeriter i0)
	( outerval v0)
	( iterator i0)
	( currentval v0)
	( itermax i9)
	( itermark i0)
	( valuemark v0) )
  (:goal
	( and 
	( assignment i0 v0 )
	( assignment i1 v1 )
	( assignment i2 v2 )
	( assignment i3 v3 )
	( assignment i4 v4 )
	( assignment i5 v5 )
	( assignment i6 v6 )
	( assignment i7 v7 )
	( assignment i8 v7 )
	( assignment i9 v9 )
	)
  )
)