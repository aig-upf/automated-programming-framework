( DEFINE ( PROBLEM BINARY-NUMBER-V0 )
( :DOMAIN BINARY-ARITHMETICS )
( :OBJECTS
	I0 I1 - INDEX
)
( :INIT
	( AT I0 )
	( CURRENT-CONTENT V0 )
	( ADJACENT I0 I1 )
	( CONTENT I0 V0 )
	( CONTENT I1 EMPTY )
)
( :GOAL
	( AND
		( AT I1 )
	)
)
)
