( DEFINE ( PROBLEM SORT15 )
( :DOMAIN SORTING )
( :OBJECTS
)
( :INIT
	( OUTERITER I0 )
	( OUTERVAL V10 )
	( ITERATOR I0 )
	( CURRENTVAL V10 )
	( ITERMAX I15 )
	( ITERMARK I0 )
	( VALUEMARK V10 )
	( ASSIGNMENT I0 V10 )
	( ASSIGNMENT I1 V9 )
	( ASSIGNMENT I2 V8 )
	( ASSIGNMENT I3 V7 )
	( ASSIGNMENT I4 V6 )
	( ASSIGNMENT I5 V5 )
	( ASSIGNMENT I6 V4 )
	( ASSIGNMENT I7 V3 )
	( ASSIGNMENT I8 V2 )
	( ASSIGNMENT I9 V1 )
	( ASSIGNMENT I10 V10 )
	( ASSIGNMENT I11 V9 )
	( ASSIGNMENT I12 V8 )
	( ASSIGNMENT I13 V7 )
	( ASSIGNMENT I14 V6 )
	( ASSIGNMENT I15 V5 )
	( CONSEC I0 I1 )
	( CONSEC I1 I2 )
	( CONSEC I2 I3 )
	( CONSEC I3 I4 )
	( CONSEC I4 I5 )
	( CONSEC I5 I6 )
	( CONSEC I6 I7 )
	( CONSEC I7 I8 )
	( CONSEC I8 I9 )
	( CONSEC I9 I10 )
	( CONSEC I10 I11 )
	( CONSEC I11 I12 )
	( CONSEC I12 I13 )
	( CONSEC I13 I14 )
	( CONSEC I14 I15 )
	( LESSTHAN V0 V1 )
	( LESSTHAN V0 V2 )
	( LESSTHAN V0 V3 )
	( LESSTHAN V0 V4 )
	( LESSTHAN V0 V5 )
	( LESSTHAN V0 V6 )
	( LESSTHAN V0 V7 )
	( LESSTHAN V0 V8 )
	( LESSTHAN V0 V9 )
	( LESSTHAN V0 V10 )
	( LESSTHAN V1 V2 )
	( LESSTHAN V1 V3 )
	( LESSTHAN V1 V4 )
	( LESSTHAN V1 V5 )
	( LESSTHAN V1 V6 )
	( LESSTHAN V1 V7 )
	( LESSTHAN V1 V8 )
	( LESSTHAN V1 V9 )
	( LESSTHAN V1 V10 )
	( LESSTHAN V2 V3 )
	( LESSTHAN V2 V4 )
	( LESSTHAN V2 V5 )
	( LESSTHAN V2 V6 )
	( LESSTHAN V2 V7 )
	( LESSTHAN V2 V8 )
	( LESSTHAN V2 V9 )
	( LESSTHAN V2 V10 )
	( LESSTHAN V3 V4 )
	( LESSTHAN V3 V5 )
	( LESSTHAN V3 V6 )
	( LESSTHAN V3 V7 )
	( LESSTHAN V3 V8 )
	( LESSTHAN V3 V9 )
	( LESSTHAN V3 V10 )
	( LESSTHAN V4 V5 )
	( LESSTHAN V4 V6 )
	( LESSTHAN V4 V7 )
	( LESSTHAN V4 V8 )
	( LESSTHAN V4 V9 )
	( LESSTHAN V4 V10 )
	( LESSTHAN V5 V6 )
	( LESSTHAN V5 V7 )
	( LESSTHAN V5 V8 )
	( LESSTHAN V5 V9 )
	( LESSTHAN V5 V10 )
	( LESSTHAN V6 V7 )
	( LESSTHAN V6 V8 )
	( LESSTHAN V6 V9 )
	( LESSTHAN V6 V10 )
	( LESSTHAN V7 V8 )
	( LESSTHAN V7 V9 )
	( LESSTHAN V7 V10 )
	( LESSTHAN V8 V9 )
	( LESSTHAN V8 V10 )
	( LESSTHAN V9 V10 )
	( TEST-0 )
	( NEXT-STACK-ROW ROW-0 ROW-1 )
	( STACK-MAIN ROW-0 )
	( STACK-LINE-0 ROW-0 )
	( TOP-STACK ROW-0 )
	( INS-ITERINC-0-0 )
	( GOTO-0-1-3 )
	( COND-LESSTHAN-ASSIGNMENT-MARK-0-1 )
	( INS-MARK-ITERATOR-VALUE-0-2 )
	( GOTO-0-3-0 )
	( COND-EQUAL-ITERATOR-MAX-0-3 )
	( INS-END-0-4 )
	( CALL-0-1-0 )
	( INS-SWAP-1 )
	( INS-OUTERITERINC-2 )
	( GOTO-1-3-0 )
	( COND-EQUAL-ITERATOR-MAX-1-3 )
	( INS-END-4 )
)
( :GOAL
	( AND
		( DONE-PROGRAMMING )
	)
)
( :METRIC MINIMIZE ( TOTAL-COST ) )
)