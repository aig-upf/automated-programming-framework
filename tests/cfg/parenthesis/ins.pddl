( DEFINE ( PROBLEM P4A )
( :DOMAIN PARENTHESIS )
( :OBJECTS
)
( :INIT
	( AT I0 )
	( ADJACENT I0 I1 )
	( ADJACENT I1 I2 )
	( ADJACENT I2 I3 )
	( ADJACENT I3 I4 )
	( CONTENT I0 LPAR )
	( CONTENT I1 RPAR )
	( CONTENT I2 LPAR )
	( CONTENT I3 RPAR )
	( CURRENT-CONTENT LPAR )
	( CONTENT I4 EMPTY )
	( TEST-0 )
	( NEXT-STACK-ROW ROW-0 ROW-1 )
	( NEXT-STACK-ROW ROW-1 ROW-2 )
	( NEXT-STACK-ROW ROW-2 ROW-3 )
	( NEXT-STACK-ROW ROW-3 ROW-4 )
	( STACK-MAIN ROW-0 )
	( STACK-LINE-0 ROW-0 )
	( TOP-STACK ROW-0 )
	( INS-SELECT-PROGRAM-0 )
	( EMPTY-1 )
	( EMPTY-2 )
	( EMPTY-3 )
	( EMPTY-4 )
	( ALLOWED-LINE-0-1 )
	( ALLOWED-LINE-0-5 )
	( INS-END-5 )
)
( :GOAL
	( AND
		( DONE-PROGRAMMING )
	)
)
( :METRIC MINIMIZE ( TOTAL-COST ) )
)