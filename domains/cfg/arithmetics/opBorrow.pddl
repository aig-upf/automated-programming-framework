( DEFINE ( PROBLEM OPBORROW )
( :DOMAIN ARITHMETICS )
( :OBJECTS
	I0 I1 - INDEX
)
( :INIT
	( AT I0 )
	( CURRENT-CONTENT BORROW )
	( ADJACENT I0 I1 )
	( CONTENT I0 BORROW )
	( CONTENT I1 EMPTY )
)
( :GOAL
	( AND
		( AT I1 )
	)
)
)
