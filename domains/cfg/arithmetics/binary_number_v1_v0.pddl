( DEFINE ( PROBLEM BINARY-NUMBER-V1-V0 )
( :DOMAIN BINARY-ARITHMETICS )
( :OBJECTS
	I0 I1 I2 I3 I4 I5 I6 I7 - INDEX
)
( :INIT
	( AT I0 )
	( CURRENT-CONTENT V1 )
	( ADJACENT I0 I1 )
	( ADJACENT I1 I2 )
	( ADJACENT I2 I3 )
	( ADJACENT I3 I4 )
	( ADJACENT I4 I5 )
	( ADJACENT I5 I6 )
	( ADJACENT I6 I7 )
	( CONTENT I0 V1 )
	( CONTENT I1 V1 )
	( CONTENT I2 V0 )
	( CONTENT I3 V1 )
	( CONTENT I4 V1 )
	( CONTENT I5 V0 )
	( CONTENT I6 V0 )
	( CONTENT I7 EMPTY )
)
( :GOAL
	( AND
		( AT I7 )
	)
)
)
