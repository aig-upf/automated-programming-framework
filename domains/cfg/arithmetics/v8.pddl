( DEFINE ( PROBLEM V8 )
( :DOMAIN ARITHMETICS )
( :OBJECTS
	I0 I1 - INDEX
)
( :INIT
	( AT I0 )
	( CURRENT-CONTENT V8 )
	( ADJACENT I0 I1 )
	( CONTENT I0 V8 )
	( CONTENT I1 EMPTY )
)
( :GOAL
	( AND
		( AT I1 )
	)
)
)
