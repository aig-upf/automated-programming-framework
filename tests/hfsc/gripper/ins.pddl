( DEFINE ( PROBLEM GRIPPER-4 )
( :DOMAIN GRIPPER )
( :OBJECTS
)
( :INIT
	( AT-ROBBY ROOMA )
	( FREE LEFT )
	( FREE RIGHT )
	( AT B1 ROOMA )
	( AT B2 ROOMA )
	( AT B3 ROOMA )
	( AT B4 ROOMA )
	( AT B5 ROOMA )
	( AT B6 ROOMA )
	( AT B7 ROOMB )
	( SUCC-BALLS B1 B2 )
	( SUCC-BALLS B2 B3 )
	( SUCC-BALLS B3 B4 )
	( SUCC-BALLS B4 B5 )
	( SUCC-BALLS B5 B6 )
	( SUCC-BALLS B6 B7 )
	( NEXT-BALL B1 )
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
