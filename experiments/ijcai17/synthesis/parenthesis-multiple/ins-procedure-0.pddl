( DEFINE ( PROBLEM P8-PAR )
( :DOMAIN COMPLEX-PARENTHESIS )
( :OBJECTS
)
( :INIT
	( AT I0 )
	( ADJACENT I0 I1 )
	( ADJACENT I1 I2 )
	( ADJACENT I2 I3 )
	( ADJACENT I3 I4 )
	( ADJACENT I4 I5 )
	( ADJACENT I5 I6 )
	( ADJACENT I6 I7 )
	( ADJACENT I7 I8 )
	( CONTENT I0 LPAR )
	( CONTENT I1 LPAR )
	( CONTENT I2 LPAR )
	( CONTENT I3 LPAR )
	( CONTENT I4 RPAR )
	( CONTENT I5 RPAR )
	( CONTENT I6 RPAR )
	( CONTENT I7 RPAR )
	( CURRENT-CONTENT LPAR )
	( CONTENT I8 EMPTY )
	( TEST-0 )
	( NEXT-STACK-ROW ROW-0 ROW-1 )
	( NEXT-STACK-ROW ROW-1 ROW-2 )
	( NEXT-STACK-ROW ROW-2 ROW-3 )
	( NEXT-STACK-ROW ROW-3 ROW-4 )
	( NEXT-STACK-ROW ROW-4 ROW-5 )
	( NEXT-STACK-ROW ROW-5 ROW-6 )
	( NEXT-STACK-ROW ROW-6 ROW-7 )
	( NEXT-STACK-ROW ROW-7 ROW-8 )
	( NEXT-STACK-ROW ROW-8 ROW-9 )
	( NEXT-STACK-ROW ROW-9 ROW-10 )
	( NEXT-STACK-ROW ROW-10 ROW-11 )
	( NEXT-STACK-ROW ROW-11 ROW-12 )
	( STACK-MAIN ROW-0 )
	( STACK-LINE-0 ROW-0 )
	( TOP-STACK ROW-0 )
	( INS-SELECT-PROGRAM-0 )
	( EMPTY-1 )
	( EMPTY-2 )
	( EMPTY-3 )
	( EMPTY-4 )
	( EMPTY-5 )
	( EMPTY-6 )
	( EMPTY-7 )
	( EMPTY-8 )
	( EMPTY-9 )
	( EMPTY-10 )
	( EMPTY-11 )
	( ALLOWED-LINE-0-1 )
	( ALLOWED-LINE-0-12 )
	( INS-END-12 )
)
( :GOAL
	( AND
		( DONE-PROGRAMMING )
	)
)
( :METRIC MINIMIZE ( TOTAL-COST ) )
)
