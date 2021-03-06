( DEFINE ( PROBLEM TREES5 )
( :DOMAIN PROGRAMMING )
( :OBJECTS
)
( :INIT
	( ASSIGNMENT CURRENT N1 ROW-0 )
	( COPYABLE-2ARY LEFT-CHILD )
	( COPYABLE-2ARY RIGHT-CHILD )
	( ACHIEVABLE-1ARY VISITED CHILD )
	( ACHIEVABLE-1ARY VISITED CURRENT )
	( INCLUDES-2ARY LEFT-CHILD N1 N2 )
	( INCLUDES-2ARY RIGHT-CHILD N1 N3 )
	( INCLUDES-2ARY LEFT-CHILD N2 N4 )
	( INCLUDES-2ARY RIGHT-CHILD N2 N5 )
	( CONDITIONAL-1ARY VISITED )
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
	( NEXT-STACK-ROW ROW-0 ROW-1 )
	( NEXT-STACK-ROW ROW-1 ROW-2 )
	( NEXT-STACK-ROW ROW-2 ROW-3 )
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
