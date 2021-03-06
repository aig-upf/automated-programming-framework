( DEFINE ( DOMAIN GRIPPER )
( :REQUIREMENTS :ACTION-COSTS :CONDITIONAL-EFFECTS :TYPING )
( :TYPES
	ROOM - OBJECT
	BALL - OBJECT
	GRIPPER - OBJECT
	STACKROW - OBJECT
	STACKSTATE - OBJECT
)
( :CONSTANTS
	ROOMA ROOMB - ROOM
	B1 B2 B3 B4 B5 B6 B7 - BALL
	LEFT RIGHT - GRIPPER
	ROW-0 - STACKROW
	STATE-0 STATE-1 STATE-2 STATE-3 - STACKSTATE
)
( :PREDICATES
	( AT-ROBBY ?ROOM0 - ROOM )
	( AT ?BALL0 - BALL ?ROOM1 - ROOM )
	( FREE ?GRIPPER0 - GRIPPER )
	( CARRY ?BALL0 - BALL ?GRIPPER1 - GRIPPER )
	( SUCC-BALLS ?BALL0 - BALL ?BALL1 - BALL )
	( NEXT-BALL ?BALL0 - BALL )
	( NO-BALLS-IN-ROOMA )
	( EMPTY-COND-STACK ?STACKSTATE0 - STACKSTATE )
	( EMPTY-TRUE-GOTO-STACK ?STACKSTATE0 - STACKSTATE )
	( EMPTY-FALSE-GOTO-STACK ?STACKSTATE0 - STACKSTATE )
	( EMPTY-TACT-STACK ?STACKSTATE0 - STACKSTATE )
	( EMPTY-FACT-STACK ?STACKSTATE0 - STACKSTATE )
	( TRUE-NO-ACT-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-NO-ACT-0 ?STACKSTATE0 - STACKSTATE )
	( STATE-STACK ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
	( NEXT-STACK-ROW ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
	( TOP-STACK ?STACKROW0 - STACKROW )
	( STACK-PROCEDURE-0 ?STACKROW0 - STACKROW )
	( TEST-0 )
	( TEST-1 )
	( TRUE-CALL-0-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-CALL-0-0 ?STACKSTATE0 - STACKSTATE )
	( ACCUMULATOR-0 ?STACKROW0 - STACKROW )
	( DONE-EVALUATING-0 ?STACKROW0 - STACKROW )
	( DONE-APPLYING-0 ?STACKROW0 - STACKROW )
	( DONE-PROGRAMMING )
	( AVAILABLE-STATE ?STACKSTATE0 - STACKSTATE )
	( NEXT-STATE ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE )
	( NCOND-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-GOTO-0 ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE )
	( FALSE-GOTO-0 ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE )
	( COND-AT-ROBBY-0 ?ROOM0 - ROOM ?STACKSTATE1 - STACKSTATE )
	( COND-AT-0 ?BALL0 - BALL ?ROOM1 - ROOM ?STACKSTATE2 - STACKSTATE )
	( COND-FREE-0 ?GRIPPER0 - GRIPPER ?STACKSTATE1 - STACKSTATE )
	( COND-CARRY-0 ?BALL0 - BALL ?GRIPPER1 - GRIPPER ?STACKSTATE2 - STACKSTATE )
	( COND-NEXT-BALL-0 ?BALL0 - BALL ?STACKSTATE1 - STACKSTATE )
	( COND-NO-BALLS-IN-ROOMA-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-MOVE-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-MOVE-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-PICK-LEFT-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-PICK-LEFT-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-PICK-RIGHT-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-PICK-RIGHT-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-DROP-LEFT-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-DROP-LEFT-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-DROP-RIGHT-0 ?STACKSTATE0 - STACKSTATE )
	( FALSE-DROP-RIGHT-0 ?STACKSTATE0 - STACKSTATE )
	( END-COND-0-0 )
	( END-COND-0-1 )
	( END-COND-0-2 )
	( END-COND-0-3 )
)
( :FUNCTIONS
	( TOTAL-COST )
)
( :ACTION PROGRAM-TRUE-NO-ACT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-NO-ACT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-NO-ACT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-NO-ACT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-TRUE-MOVE-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-MOVE-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-MOVE-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-MOVE-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-TRUE-PICK-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE LEFT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-PICK-LEFT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-PICK-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE LEFT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-PICK-LEFT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-TRUE-PICK-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE RIGHT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-PICK-RIGHT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-PICK-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE RIGHT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-PICK-RIGHT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-TRUE-DROP-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-DROP-LEFT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-DROP-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-DROP-LEFT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-TRUE-DROP-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-DROP-RIGHT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-DROP-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-DROP-RIGHT-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-END-3
  :PARAMETERS ( ?STACKROW0 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW0 )
		( STACK-PROCEDURE-0 ?STACKROW0 )
		( STATE-STACK STATE-3 ?STACKROW0 )
		( EMPTY-COND-STACK STATE-3 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK STATE-3 ) )
		( END-COND-0-3 )
		( INCREASE ( TOTAL-COST ) 1 )
	)
)
( :ACTION PROGRAM-NOCOND-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-COND-STACK ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE0 ) )
		( NCOND-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-COND-AT-ROBBY-0
  :PARAMETERS ( ?ROOM0 - ROOM ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( EMPTY-COND-STACK ?STACKSTATE1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE1 ) )
		( COND-AT-ROBBY-0 ?ROOM0 ?STACKSTATE1 )
	)
)
( :ACTION PROGRAM-COND-AT-0
  :PARAMETERS ( ?BALL0 - BALL ?ROOM1 - ROOM ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( EMPTY-COND-STACK ?STACKSTATE2 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE2 ) )
		( COND-AT-0 ?BALL0 ?ROOM1 ?STACKSTATE2 )
	)
)
( :ACTION PROGRAM-COND-FREE-0
  :PARAMETERS ( ?GRIPPER0 - GRIPPER ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( EMPTY-COND-STACK ?STACKSTATE1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE1 ) )
		( COND-FREE-0 ?GRIPPER0 ?STACKSTATE1 )
	)
)
( :ACTION PROGRAM-COND-CARRY-0
  :PARAMETERS ( ?BALL0 - BALL ?GRIPPER1 - GRIPPER ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( EMPTY-COND-STACK ?STACKSTATE2 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE2 ) )
		( COND-CARRY-0 ?BALL0 ?GRIPPER1 ?STACKSTATE2 )
	)
)
( :ACTION PROGRAM-COND-NEXT-BALL-0
  :PARAMETERS ( ?BALL0 - BALL ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( EMPTY-COND-STACK ?STACKSTATE1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE1 ) )
		( COND-NEXT-BALL-0 ?BALL0 ?STACKSTATE1 )
	)
)
( :ACTION PROGRAM-COND-NO-BALLS-IN-ROOMA-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-COND-STACK ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-COND-STACK ?STACKSTATE0 ) )
		( COND-NO-BALLS-IN-ROOMA-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-TRUE-GOTO-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( DONE-EVALUATING-0 ?STACKROW2 )
		( ACCUMULATOR-0 ?STACKROW2 )
		( DONE-APPLYING-0 ?STACKROW2 )
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW2 )
		( EMPTY-TRUE-GOTO-STACK ?STACKSTATE0 )
		( AVAILABLE-STATE ?STACKSTATE1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TRUE-GOTO-STACK ?STACKSTATE0 ) )
		( TRUE-GOTO-0 ?STACKSTATE0 ?STACKSTATE1 )
		( FORALL
			( ?STACKSTATE3 - STACKSTATE )
			( WHEN
				( NEXT-STATE ?STACKSTATE1 ?STACKSTATE3 )
				( AVAILABLE-STATE ?STACKSTATE3 )
			)
		)
	)
)
( :ACTION PROGRAM-FALSE-GOTO-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( DONE-EVALUATING-0 ?STACKROW2 )
		( NOT ( ACCUMULATOR-0 ?STACKROW2 ) )
		( DONE-APPLYING-0 ?STACKROW2 )
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW2 )
		( EMPTY-FALSE-GOTO-STACK ?STACKSTATE0 )
		( AVAILABLE-STATE ?STACKSTATE1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FALSE-GOTO-STACK ?STACKSTATE0 ) )
		( FALSE-GOTO-0 ?STACKSTATE0 ?STACKSTATE1 )
		( FORALL
			( ?STACKSTATE3 - STACKSTATE )
			( WHEN
				( NEXT-STATE ?STACKSTATE1 ?STACKSTATE3 )
				( AVAILABLE-STATE ?STACKSTATE3 )
			)
		)
	)
)
( :ACTION PROGRAM-TRUE-CALL-0-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-TACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-TACT-STACK ?STACKSTATE0 ) )
		( TRUE-CALL-0-0 ?STACKSTATE0 )
	)
)
( :ACTION PROGRAM-FALSE-CALL-0-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( EMPTY-FACT-STACK ?STACKSTATE0 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( EMPTY-FACT-STACK ?STACKSTATE0 ) )
		( FALSE-CALL-0-0 ?STACKSTATE0 )
	)
)
( :ACTION REPEAT-TRUE-NO-ACT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-NO-ACT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-NO-ACT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-NO-ACT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-TRUE-MOVE-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-MOVE-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( WHEN
			( AND
				( AT-ROBBY ROOMA )
			)
			( AND
				( AT-ROBBY ROOMB )
				( NOT ( AT-ROBBY ROOMA ) )
			)
		)
		( WHEN
			( AND
				( AT-ROBBY ROOMB )
			)
			( AND
				( AT-ROBBY ROOMA )
				( NOT ( AT-ROBBY ROOMB ) )
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-MOVE-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-MOVE-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( WHEN
			( AND
				( AT-ROBBY ROOMA )
			)
			( AND
				( AT-ROBBY ROOMB )
				( NOT ( AT-ROBBY ROOMA ) )
			)
		)
		( WHEN
			( AND
				( AT-ROBBY ROOMB )
			)
			( AND
				( AT-ROBBY ROOMA )
				( NOT ( AT-ROBBY ROOMB ) )
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-TRUE-PICK-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE LEFT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-PICK-LEFT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?BALL3 - BALL ?ROOM4 - ROOM )
			( AND
				( WHEN
					( AND
						( AT ?BALL2 ?ROOM4 )
						( AT-ROBBY ?ROOM4 )
						( NEXT-BALL ?BALL2 )
						( SUCC-BALLS ?BALL2 ?BALL3 )
					)
					( AND
						( CARRY ?BALL2 LEFT )
						( NOT ( AT ?BALL2 ?ROOM4 ) )
						( NOT ( FREE LEFT ) )
						( NOT ( NEXT-BALL ?BALL2 ) )
						( NEXT-BALL ?BALL3 )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-PICK-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE LEFT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-PICK-LEFT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?BALL3 - BALL ?ROOM4 - ROOM )
			( AND
				( WHEN
					( AND
						( AT ?BALL2 ?ROOM4 )
						( AT-ROBBY ?ROOM4 )
						( NEXT-BALL ?BALL2 )
						( SUCC-BALLS ?BALL2 ?BALL3 )
					)
					( AND
						( CARRY ?BALL2 LEFT )
						( NOT ( AT ?BALL2 ?ROOM4 ) )
						( NOT ( FREE LEFT ) )
						( NOT ( NEXT-BALL ?BALL2 ) )
						( NEXT-BALL ?BALL3 )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-TRUE-PICK-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE RIGHT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-PICK-RIGHT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?BALL3 - BALL ?ROOM4 - ROOM )
			( AND
				( WHEN
					( AND
						( AT ?BALL2 ?ROOM4 )
						( AT-ROBBY ?ROOM4 )
						( NEXT-BALL ?BALL2 )
						( SUCC-BALLS ?BALL2 ?BALL3 )
					)
					( AND
						( CARRY ?BALL2 RIGHT )
						( NOT ( AT ?BALL2 ?ROOM4 ) )
						( NOT ( FREE RIGHT ) )
						( NOT ( NEXT-BALL ?BALL2 ) )
						( NEXT-BALL ?BALL3 )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-PICK-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( FREE RIGHT )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-PICK-RIGHT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?BALL3 - BALL ?ROOM4 - ROOM )
			( AND
				( WHEN
					( AND
						( AT ?BALL2 ?ROOM4 )
						( AT-ROBBY ?ROOM4 )
						( NEXT-BALL ?BALL2 )
						( SUCC-BALLS ?BALL2 ?BALL3 )
					)
					( AND
						( CARRY ?BALL2 RIGHT )
						( NOT ( AT ?BALL2 ?ROOM4 ) )
						( NOT ( FREE RIGHT ) )
						( NOT ( NEXT-BALL ?BALL2 ) )
						( NEXT-BALL ?BALL3 )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-TRUE-DROP-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-DROP-LEFT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?ROOM3 - ROOM )
			( AND
				( WHEN
					( AND
						( CARRY ?BALL2 LEFT )
						( AT-ROBBY ?ROOM3 )
					)
					( AND
						( AT ?BALL2 ?ROOM3 )
						( FREE LEFT )
						( NOT ( CARRY ?BALL2 LEFT ) )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-DROP-LEFT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-DROP-LEFT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?ROOM3 - ROOM )
			( AND
				( WHEN
					( AND
						( CARRY ?BALL2 LEFT )
						( AT-ROBBY ?ROOM3 )
					)
					( AND
						( AT ?BALL2 ?ROOM3 )
						( FREE LEFT )
						( NOT ( CARRY ?BALL2 LEFT ) )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-TRUE-DROP-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-DROP-RIGHT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?ROOM3 - ROOM )
			( AND
				( WHEN
					( AND
						( CARRY ?BALL2 RIGHT )
						( AT-ROBBY ?ROOM3 )
					)
					( AND
						( AT ?BALL2 ?ROOM3 )
						( FREE RIGHT )
						( NOT ( CARRY ?BALL2 RIGHT ) )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-DROP-RIGHT-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-DROP-RIGHT-0 ?STACKSTATE0 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?BALL2 - BALL ?ROOM3 - ROOM )
			( AND
				( WHEN
					( AND
						( CARRY ?BALL2 RIGHT )
						( AT-ROBBY ?ROOM3 )
					)
					( AND
						( AT ?BALL2 ?ROOM3 )
						( FREE RIGHT )
						( NOT ( CARRY ?BALL2 RIGHT ) )
					)
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-TRUE-GOTO-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( TRUE-GOTO-0 ?STACKSTATE0 ?STACKSTATE1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW2 )
		( DONE-EVALUATING-0 ?STACKROW2 )
		( ACCUMULATOR-0 ?STACKROW2 )
		( DONE-APPLYING-0 ?STACKROW2 )
	)
  :EFFECT
	( AND
		( NOT ( DONE-EVALUATING-0 ?STACKROW2 ) )
		( NOT ( DONE-APPLYING-0 ?STACKROW2 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW2 ) )
		( NOT ( STATE-STACK ?STACKSTATE0 ?STACKROW2 ) )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
	)
)
( :ACTION REPEAT-FALSE-GOTO-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( FALSE-GOTO-0 ?STACKSTATE0 ?STACKSTATE1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW2 )
		( DONE-EVALUATING-0 ?STACKROW2 )
		( NOT ( ACCUMULATOR-0 ?STACKROW2 ) )
		( DONE-APPLYING-0 ?STACKROW2 )
	)
  :EFFECT
	( AND
		( NOT ( DONE-EVALUATING-0 ?STACKROW2 ) )
		( NOT ( DONE-APPLYING-0 ?STACKROW2 ) )
		( NOT ( STATE-STACK ?STACKSTATE0 ?STACKROW2 ) )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
	)
)
( :ACTION EVAL-NOCOND-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( NCOND-0 ?STACKSTATE0 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW1 )
		( ACCUMULATOR-0 ?STACKROW1 )
	)
)
( :ACTION EVAL-COND-AT-ROBBY-0
  :PARAMETERS ( ?ROOM0 - ROOM ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( COND-AT-ROBBY-0 ?ROOM0 ?STACKSTATE1 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW2 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW2 )
		( WHEN
			( AT-ROBBY ?ROOM0 )
			( AND
				( ACCUMULATOR-0 ?STACKROW2 )
			)
		)
	)
)
( :ACTION EVAL-COND-AT-0
  :PARAMETERS ( ?BALL0 - BALL ?ROOM1 - ROOM ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( COND-AT-0 ?BALL0 ?ROOM1 ?STACKSTATE2 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW3 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW3 )
		( WHEN
			( AT ?BALL0 ?ROOM1 )
			( AND
				( ACCUMULATOR-0 ?STACKROW3 )
			)
		)
	)
)
( :ACTION EVAL-COND-FREE-0
  :PARAMETERS ( ?GRIPPER0 - GRIPPER ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( COND-FREE-0 ?GRIPPER0 ?STACKSTATE1 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW2 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW2 )
		( WHEN
			( FREE ?GRIPPER0 )
			( AND
				( ACCUMULATOR-0 ?STACKROW2 )
			)
		)
	)
)
( :ACTION EVAL-COND-CARRY-0
  :PARAMETERS ( ?BALL0 - BALL ?GRIPPER1 - GRIPPER ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( COND-CARRY-0 ?BALL0 ?GRIPPER1 ?STACKSTATE2 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW3 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW3 )
		( WHEN
			( CARRY ?BALL0 ?GRIPPER1 )
			( AND
				( ACCUMULATOR-0 ?STACKROW3 )
			)
		)
	)
)
( :ACTION EVAL-COND-NEXT-BALL-0
  :PARAMETERS ( ?BALL0 - BALL ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( COND-NEXT-BALL-0 ?BALL0 ?STACKSTATE1 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW2 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW2 )
		( WHEN
			( NEXT-BALL ?BALL0 )
			( AND
				( ACCUMULATOR-0 ?STACKROW2 )
			)
		)
	)
)
( :ACTION EVAL-COND-NO-BALLS-IN-ROOMA-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( COND-NO-BALLS-IN-ROOMA-0 ?STACKSTATE0 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW1 )
		( WHEN
			( AND
				( FORALL
					( ?BALL2 - BALL )
					( AND
						( NOT ( AT ?BALL2 ROOMA ) )
					)
				)
			)
			( AND
				( ACCUMULATOR-0 ?STACKROW1 )
			)
		)
	)
)
( :ACTION REPEAT-END-MAIN-0-0-1
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( TEST-0 )
		( TOP-STACK ROW-0 )
		( STATE-STACK STATE-1 ROW-0 )
		( END-COND-0-1 )
		( AT B1 ROOMB )
		( AT B2 ROOMB )
		( AT B3 ROOMB )
		( AT B4 ROOMB )
		( AT B5 ROOMB )
		( AT B6 ROOMB )
	)
  :EFFECT
	( AND
		( NOT ( TEST-0 ) )
		( TEST-1 )
		( NOT ( STATE-STACK STATE-1 ROW-0 ) )
		( STATE-STACK STATE-0 ROW-0 )
		( FORALL
			( ?ROOM0 - ROOM )
			( NOT ( AT-ROBBY ?ROOM0 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?ROOM1 - ROOM )
			( NOT ( AT ?BALL0 ?ROOM1 ) )
		)
		( FORALL
			( ?GRIPPER0 - GRIPPER )
			( NOT ( FREE ?GRIPPER0 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?GRIPPER1 - GRIPPER )
			( NOT ( CARRY ?BALL0 ?GRIPPER1 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?BALL1 - BALL )
			( NOT ( SUCC-BALLS ?BALL0 ?BALL1 ) )
		)
		( FORALL
			( ?BALL0 - BALL )
			( NOT ( NEXT-BALL ?BALL0 ) )
		)
		( AT-ROBBY ROOMA )
		( FREE LEFT )
		( FREE RIGHT )
		( AT B1 ROOMA )
		( AT B2 ROOMA )
		( AT B3 ROOMB )
		( SUCC-BALLS B1 B2 )
		( SUCC-BALLS B2 B3 )
		( NEXT-BALL B1 )
	)
)
( :ACTION REPEAT-END-MAIN-0-0-2
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( TEST-0 )
		( TOP-STACK ROW-0 )
		( STATE-STACK STATE-2 ROW-0 )
		( END-COND-0-2 )
		( AT B1 ROOMB )
		( AT B2 ROOMB )
		( AT B3 ROOMB )
		( AT B4 ROOMB )
		( AT B5 ROOMB )
		( AT B6 ROOMB )
	)
  :EFFECT
	( AND
		( NOT ( TEST-0 ) )
		( TEST-1 )
		( NOT ( STATE-STACK STATE-2 ROW-0 ) )
		( STATE-STACK STATE-0 ROW-0 )
		( FORALL
			( ?ROOM0 - ROOM )
			( NOT ( AT-ROBBY ?ROOM0 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?ROOM1 - ROOM )
			( NOT ( AT ?BALL0 ?ROOM1 ) )
		)
		( FORALL
			( ?GRIPPER0 - GRIPPER )
			( NOT ( FREE ?GRIPPER0 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?GRIPPER1 - GRIPPER )
			( NOT ( CARRY ?BALL0 ?GRIPPER1 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?BALL1 - BALL )
			( NOT ( SUCC-BALLS ?BALL0 ?BALL1 ) )
		)
		( FORALL
			( ?BALL0 - BALL )
			( NOT ( NEXT-BALL ?BALL0 ) )
		)
		( AT-ROBBY ROOMA )
		( FREE LEFT )
		( FREE RIGHT )
		( AT B1 ROOMA )
		( AT B2 ROOMA )
		( AT B3 ROOMB )
		( SUCC-BALLS B1 B2 )
		( SUCC-BALLS B2 B3 )
		( NEXT-BALL B1 )
	)
)
( :ACTION REPEAT-END-MAIN-0-0-3
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( TEST-0 )
		( TOP-STACK ROW-0 )
		( STATE-STACK STATE-3 ROW-0 )
		( END-COND-0-3 )
		( AT B1 ROOMB )
		( AT B2 ROOMB )
		( AT B3 ROOMB )
		( AT B4 ROOMB )
		( AT B5 ROOMB )
		( AT B6 ROOMB )
	)
  :EFFECT
	( AND
		( NOT ( TEST-0 ) )
		( TEST-1 )
		( NOT ( STATE-STACK STATE-3 ROW-0 ) )
		( STATE-STACK STATE-0 ROW-0 )
		( FORALL
			( ?ROOM0 - ROOM )
			( NOT ( AT-ROBBY ?ROOM0 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?ROOM1 - ROOM )
			( NOT ( AT ?BALL0 ?ROOM1 ) )
		)
		( FORALL
			( ?GRIPPER0 - GRIPPER )
			( NOT ( FREE ?GRIPPER0 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?GRIPPER1 - GRIPPER )
			( NOT ( CARRY ?BALL0 ?GRIPPER1 ) )
		)
		( FORALL
			( ?BALL0 - BALL ?BALL1 - BALL )
			( NOT ( SUCC-BALLS ?BALL0 ?BALL1 ) )
		)
		( FORALL
			( ?BALL0 - BALL )
			( NOT ( NEXT-BALL ?BALL0 ) )
		)
		( AT-ROBBY ROOMA )
		( FREE LEFT )
		( FREE RIGHT )
		( AT B1 ROOMA )
		( AT B2 ROOMA )
		( AT B3 ROOMB )
		( SUCC-BALLS B1 B2 )
		( SUCC-BALLS B2 B3 )
		( NEXT-BALL B1 )
	)
)
( :ACTION REPEAT-END-MAIN-1-0-1
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( TEST-1 )
		( TOP-STACK ROW-0 )
		( STATE-STACK STATE-1 ROW-0 )
		( END-COND-0-1 )
		( AT B1 ROOMB )
		( AT B2 ROOMB )
	)
  :EFFECT
	( AND
		( DONE-PROGRAMMING )
	)
)
( :ACTION REPEAT-END-MAIN-1-0-2
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( TEST-1 )
		( TOP-STACK ROW-0 )
		( STATE-STACK STATE-2 ROW-0 )
		( END-COND-0-2 )
		( AT B1 ROOMB )
		( AT B2 ROOMB )
	)
  :EFFECT
	( AND
		( DONE-PROGRAMMING )
	)
)
( :ACTION REPEAT-END-MAIN-1-0-3
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( TEST-1 )
		( TOP-STACK ROW-0 )
		( STATE-STACK STATE-3 ROW-0 )
		( END-COND-0-3 )
		( AT B1 ROOMB )
		( AT B2 ROOMB )
	)
  :EFFECT
	( AND
		( DONE-PROGRAMMING )
	)
)
( :ACTION REPEAT-END-0-0-1
  :PARAMETERS ( ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TEST-0 )
		( NEXT-STACK-ROW ?STACKROW0 ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK STATE-1 ?STACKROW1 )
		( END-COND-0-1 )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW0 )
		( NOT ( STATE-STACK STATE-1 ?STACKROW1 ) )
		( NOT ( STACK-PROCEDURE-0 ?STACKROW1 ) )
	)
)
( :ACTION REPEAT-END-0-0-2
  :PARAMETERS ( ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TEST-0 )
		( NEXT-STACK-ROW ?STACKROW0 ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK STATE-2 ?STACKROW1 )
		( END-COND-0-2 )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW0 )
		( NOT ( STATE-STACK STATE-2 ?STACKROW1 ) )
		( NOT ( STACK-PROCEDURE-0 ?STACKROW1 ) )
	)
)
( :ACTION REPEAT-END-0-0-3
  :PARAMETERS ( ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TEST-0 )
		( NEXT-STACK-ROW ?STACKROW0 ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK STATE-3 ?STACKROW1 )
		( END-COND-0-3 )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW0 )
		( NOT ( STATE-STACK STATE-3 ?STACKROW1 ) )
		( NOT ( STACK-PROCEDURE-0 ?STACKROW1 ) )
	)
)
( :ACTION REPEAT-END-1-0-1
  :PARAMETERS ( ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TEST-1 )
		( NEXT-STACK-ROW ?STACKROW0 ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK STATE-1 ?STACKROW1 )
		( END-COND-0-1 )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW0 )
		( NOT ( STATE-STACK STATE-1 ?STACKROW1 ) )
		( NOT ( STACK-PROCEDURE-0 ?STACKROW1 ) )
	)
)
( :ACTION REPEAT-END-1-0-2
  :PARAMETERS ( ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TEST-1 )
		( NEXT-STACK-ROW ?STACKROW0 ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK STATE-2 ?STACKROW1 )
		( END-COND-0-2 )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW0 )
		( NOT ( STATE-STACK STATE-2 ?STACKROW1 ) )
		( NOT ( STACK-PROCEDURE-0 ?STACKROW1 ) )
	)
)
( :ACTION REPEAT-END-1-0-3
  :PARAMETERS ( ?STACKROW0 - STACKROW ?STACKROW1 - STACKROW )
  :PRECONDITION
	( AND
		( TEST-1 )
		( NEXT-STACK-ROW ?STACKROW0 ?STACKROW1 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK STATE-3 ?STACKROW1 )
		( END-COND-0-3 )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW0 )
		( NOT ( STATE-STACK STATE-3 ?STACKROW1 ) )
		( NOT ( STACK-PROCEDURE-0 ?STACKROW1 ) )
	)
)
( :ACTION REPEAT-TRUE-CALL-0-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( ACCUMULATOR-0 ?STACKROW1 )
		( TRUE-CALL-0-0 ?STACKSTATE0 )
		( NEXT-STACK-ROW ?STACKROW1 ?STACKROW2 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK STATE-0 ?STACKROW2 )
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
( :ACTION REPEAT-FALSE-CALL-0-0
  :PARAMETERS ( ?STACKSTATE0 - STACKSTATE ?STACKROW1 - STACKROW ?STACKROW2 - STACKROW )
  :PRECONDITION
	( AND
		( NOT ( ACCUMULATOR-0 ?STACKROW1 ) )
		( FALSE-CALL-0-0 ?STACKSTATE0 )
		( NEXT-STACK-ROW ?STACKROW1 ?STACKROW2 )
		( TOP-STACK ?STACKROW1 )
		( STACK-PROCEDURE-0 ?STACKROW1 )
		( STATE-STACK ?STACKSTATE0 ?STACKROW1 )
		( DONE-EVALUATING-0 ?STACKROW1 )
		( NOT ( DONE-APPLYING-0 ?STACKROW1 ) )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW1 ) )
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK STATE-0 ?STACKROW2 )
		( DONE-APPLYING-0 ?STACKROW1 )
	)
)
)
