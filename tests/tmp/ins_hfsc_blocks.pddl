( DEFINE ( PROBLEM P2-09092015162521 )
( :DOMAIN BLOCKS )
( :OBJECTS
)
( :INIT
	( CLEAR B1 )
	( ONTABLE B2 )
	( ON B1 B2 )
	( EMPTY )
	( GREEN B2 )
	( TEST-0 )
	( STATE-STACK STATE-0 ROW-0 )
	( STACK-PROCEDURE-0 ROW-0 )
	( TOP-STACK ROW-0 )
	( EMPTY-COND-STACK STATE-0 )
	( EMPTY-TRUE-GOTO-STACK STATE-0 )
	( EMPTY-FALSE-GOTO-STACK STATE-0 )
	( EMPTY-TACT-STACK STATE-0 )
	( EMPTY-FACT-STACK STATE-0 )
	( EMPTY-COND-STACK STATE-1 )
	( EMPTY-TRUE-GOTO-STACK STATE-1 )
	( EMPTY-FALSE-GOTO-STACK STATE-1 )
	( EMPTY-TACT-STACK STATE-1 )
	( EMPTY-FACT-STACK STATE-1 )
	( EMPTY-COND-STACK STATE-2 )
	( EMPTY-TRUE-GOTO-STACK STATE-2 )
	( EMPTY-FALSE-GOTO-STACK STATE-2 )
	( EMPTY-TACT-STACK STATE-2 )
	( EMPTY-FACT-STACK STATE-2 )
	( EMPTY-COND-STACK STATE-3 )
	( AVAILABLE-STATE STATE-0 )
	( AVAILABLE-STATE STATE-1 )
	( NEXT-STATE STATE-0 STATE-1 )
	( NEXT-STATE STATE-1 STATE-2 )
	( NEXT-STATE STATE-2 STATE-3 )
)
( :GOAL
	( AND
		( DONE-PROGRAMMING )
	)
)
( :METRIC MINIMIZE ( TOTAL-COST ) )
)