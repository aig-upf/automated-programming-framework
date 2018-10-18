( DEFINE ( DOMAIN PROGRAMMING )
( :REQUIREMENTS :ACTION-COSTS :CONDITIONAL-EFFECTS :TYPING )
( :TYPES
	RELATION - OBJECT
	VALUE - OBJECT
	VARIABLE - OBJECT
	STACKROW - OBJECT
	STACKSTATE - OBJECT
)
( :CONSTANTS
	LEFT-CHILD RIGHT-CHILD VISITED - RELATION
	N1 N10 N11 N12 N13 N14 N15 N16 N17 N18 N19 N2 N20 N3 N4 N5 N6 N7 N8 N9 - VALUE
	CHILD CURRENT - VARIABLE
	ROW-0 ROW-1 ROW-2 ROW-3 ROW-4 ROW-5 ROW-6 ROW-7 ROW-8 ROW-9 - STACKROW
	STATE-0 STATE-1 STATE-2 STATE-3 - STACKSTATE
)
( :PREDICATES
	( ASSIGNMENT ?VARIABLE0 - VARIABLE ?VALUE1 - VALUE ?STACKROW2 - STACKROW )
	( COPYABLE-2ARY ?RELATION0 - RELATION )
	( CONDITIONAL-1ARY ?RELATION0 - RELATION )
	( ACHIEVABLE-1ARY ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE )
	( INCLUDES-1ARY ?RELATION0 - RELATION ?VALUE1 - VALUE )
	( INCLUDES-2ARY ?RELATION0 - RELATION ?VALUE1 - VALUE ?VALUE2 - VALUE )
	( EQUAL ?VARIABLE0 - VARIABLE ?VARIABLE1 - VARIABLE )
	( SATISFIES-1ARY ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE )
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
	( TRUE-CALL-0-0 ?VARIABLE0 - VARIABLE ?STACKSTATE1 - STACKSTATE )
	( FALSE-CALL-0-0 ?VARIABLE0 - VARIABLE ?STACKSTATE1 - STACKSTATE )
	( ACCUMULATOR-0 ?STACKROW0 - STACKROW )
	( DONE-EVALUATING-0 ?STACKROW0 - STACKROW )
	( DONE-APPLYING-0 ?STACKROW0 - STACKROW )
	( DONE-PROGRAMMING )
	( AVAILABLE-STATE ?STACKSTATE0 - STACKSTATE )
	( NEXT-STATE ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE )
	( NCOND-0 ?STACKSTATE0 - STACKSTATE )
	( TRUE-GOTO-0 ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE )
	( FALSE-GOTO-0 ?STACKSTATE0 - STACKSTATE ?STACKSTATE1 - STACKSTATE )
	( COND-ASSIGNMENT-0 ?VARIABLE0 - VARIABLE ?VALUE1 - VALUE ?STACKSTATE2 - STACKSTATE )
	( COND-INCLUDES-1ARY-0 ?RELATION0 - RELATION ?VALUE1 - VALUE ?STACKSTATE2 - STACKSTATE )
	( COND-EQUAL-0 ?VARIABLE0 - VARIABLE ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE )
	( COND-SATISFIES-1ARY-0 ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE )
	( TRUE-COPY-2ARY-0 ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?VARIABLE2 - VARIABLE ?STACKSTATE3 - STACKSTATE )
	( FALSE-COPY-2ARY-0 ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?VARIABLE2 - VARIABLE ?STACKSTATE3 - STACKSTATE )
	( TRUE-ACHIEVE-1ARY-0 ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE )
	( FALSE-ACHIEVE-1ARY-0 ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE )
	( END-COND-0-0 )
	( END-COND-0-1 )
	( END-COND-0-2 )
	( END-COND-0-3 )
)
( :FUNCTIONS
	( TOTAL-COST )
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
( :ACTION REPEAT-TRUE-COPY-2ARY-0
  :PARAMETERS ( ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?VARIABLE2 - VARIABLE ?STACKSTATE3 - STACKSTATE ?STACKROW4 - STACKROW )
  :PRECONDITION
	( AND
		( COPYABLE-2ARY ?RELATION0 )
		( TOP-STACK ?STACKROW4 )
		( STACK-PROCEDURE-0 ?STACKROW4 )
		( STATE-STACK ?STACKSTATE3 ?STACKROW4 )
		( DONE-EVALUATING-0 ?STACKROW4 )
		( NOT ( DONE-APPLYING-0 ?STACKROW4 ) )
		( ACCUMULATOR-0 ?STACKROW4 )
		( TRUE-COPY-2ARY-0 ?RELATION0 ?VARIABLE1 ?VARIABLE2 ?STACKSTATE3 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?VALUE5 - VALUE )
			( NOT ( ASSIGNMENT ?VARIABLE1 ?VALUE5 ?STACKROW4 ) )
		)
		( FORALL
			( ?VALUE5 - VALUE ?VALUE6 - VALUE )
			( WHEN
				( AND
					( ASSIGNMENT ?VARIABLE2 ?VALUE5 ?STACKROW4 )
					( INCLUDES-2ARY ?RELATION0 ?VALUE5 ?VALUE6 )
				)
				( AND
					( ASSIGNMENT ?VARIABLE1 ?VALUE6 ?STACKROW4 )
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW4 )
	)
)
( :ACTION REPEAT-FALSE-COPY-2ARY-0
  :PARAMETERS ( ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?VARIABLE2 - VARIABLE ?STACKSTATE3 - STACKSTATE ?STACKROW4 - STACKROW )
  :PRECONDITION
	( AND
		( COPYABLE-2ARY ?RELATION0 )
		( TOP-STACK ?STACKROW4 )
		( STACK-PROCEDURE-0 ?STACKROW4 )
		( STATE-STACK ?STACKSTATE3 ?STACKROW4 )
		( DONE-EVALUATING-0 ?STACKROW4 )
		( NOT ( DONE-APPLYING-0 ?STACKROW4 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW4 ) )
		( FALSE-COPY-2ARY-0 ?RELATION0 ?VARIABLE1 ?VARIABLE2 ?STACKSTATE3 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?VALUE5 - VALUE )
			( NOT ( ASSIGNMENT ?VARIABLE1 ?VALUE5 ?STACKROW4 ) )
		)
		( FORALL
			( ?VALUE5 - VALUE ?VALUE6 - VALUE )
			( WHEN
				( AND
					( ASSIGNMENT ?VARIABLE2 ?VALUE5 ?STACKROW4 )
					( INCLUDES-2ARY ?RELATION0 ?VALUE5 ?VALUE6 )
				)
				( AND
					( ASSIGNMENT ?VARIABLE1 ?VALUE6 ?STACKROW4 )
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW4 )
	)
)
( :ACTION REPEAT-TRUE-ACHIEVE-1ARY-0
  :PARAMETERS ( ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( ACHIEVABLE-1ARY ?RELATION0 ?VARIABLE1 )
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( DONE-EVALUATING-0 ?STACKROW3 )
		( NOT ( DONE-APPLYING-0 ?STACKROW3 ) )
		( ACCUMULATOR-0 ?STACKROW3 )
		( TRUE-ACHIEVE-1ARY-0 ?RELATION0 ?VARIABLE1 ?STACKSTATE2 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?VALUE4 - VALUE )
			( WHEN
				( AND
					( ASSIGNMENT ?VARIABLE1 ?VALUE4 ?STACKROW3 )
				)
				( AND
					( INCLUDES-1ARY ?RELATION0 ?VALUE4 )
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW3 )
	)
)
( :ACTION REPEAT-FALSE-ACHIEVE-1ARY-0
  :PARAMETERS ( ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( ACHIEVABLE-1ARY ?RELATION0 ?VARIABLE1 )
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( DONE-EVALUATING-0 ?STACKROW3 )
		( NOT ( DONE-APPLYING-0 ?STACKROW3 ) )
		( NOT ( ACCUMULATOR-0 ?STACKROW3 ) )
		( FALSE-ACHIEVE-1ARY-0 ?RELATION0 ?VARIABLE1 ?STACKSTATE2 )
	)
  :EFFECT
	( AND
		( FORALL
			( ?VALUE4 - VALUE )
			( WHEN
				( AND
					( ASSIGNMENT ?VARIABLE1 ?VALUE4 ?STACKROW3 )
				)
				( AND
					( INCLUDES-1ARY ?RELATION0 ?VALUE4 )
				)
			)
		)
		( DONE-APPLYING-0 ?STACKROW3 )
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
( :ACTION EVAL-COND-ASSIGNMENT-0
  :PARAMETERS ( ?VARIABLE0 - VARIABLE ?VALUE1 - VALUE ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( COND-ASSIGNMENT-0 ?VARIABLE0 ?VALUE1 ?STACKSTATE2 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW3 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW3 )
		( WHEN
			( ASSIGNMENT ?VARIABLE0 ?VALUE1 ?STACKROW3 )
			( AND
				( ACCUMULATOR-0 ?STACKROW3 )
			)
		)
	)
)
( :ACTION EVAL-COND-INCLUDES-1ARY-0
  :PARAMETERS ( ?RELATION0 - RELATION ?VALUE1 - VALUE ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( COND-INCLUDES-1ARY-0 ?RELATION0 ?VALUE1 ?STACKSTATE2 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW3 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW3 )
		( WHEN
			( INCLUDES-1ARY ?RELATION0 ?VALUE1 )
			( AND
				( ACCUMULATOR-0 ?STACKROW3 )
			)
		)
	)
)
( :ACTION EVAL-COND-EQUAL-0
  :PARAMETERS ( ?VARIABLE0 - VARIABLE ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( COND-EQUAL-0 ?VARIABLE0 ?VARIABLE1 ?STACKSTATE2 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW3 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW3 )
		( FORALL
			( ?VALUE4 - VALUE )
			( WHEN
				( AND
					( ASSIGNMENT ?VARIABLE0 ?VALUE4 ?STACKROW3 )
					( ASSIGNMENT ?VARIABLE1 ?VALUE4 ?STACKROW3 )
				)
				( AND
					( ACCUMULATOR-0 ?STACKROW3 )
				)
			)
		)
	)
)
( :ACTION EVAL-COND-SATISFIES-1ARY-0
  :PARAMETERS ( ?RELATION0 - RELATION ?VARIABLE1 - VARIABLE ?STACKSTATE2 - STACKSTATE ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK ?STACKSTATE2 ?STACKROW3 )
		( COND-SATISFIES-1ARY-0 ?RELATION0 ?VARIABLE1 ?STACKSTATE2 )
		( NOT ( DONE-EVALUATING-0 ?STACKROW3 ) )
	)
  :EFFECT
	( AND
		( DONE-EVALUATING-0 ?STACKROW3 )
		( WHEN
			( AND
				( CONDITIONAL-1ARY ?RELATION0 )
				( EXISTS
					( ?VALUE4 - VALUE )
					( AND
						( ASSIGNMENT ?VARIABLE1 ?VALUE4 ?STACKROW3 )
						( INCLUDES-1ARY ?RELATION0 ?VALUE4 )
					)
				)
			)
			( AND
				( ACCUMULATOR-0 ?STACKROW3 )
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
		( INCLUDES-1ARY VISITED N1 )
		( INCLUDES-1ARY VISITED N2 )
		( INCLUDES-1ARY VISITED N3 )
		( INCLUDES-1ARY VISITED N4 )
		( INCLUDES-1ARY VISITED N5 )
		( INCLUDES-1ARY VISITED N6 )
		( INCLUDES-1ARY VISITED N7 )
		( INCLUDES-1ARY VISITED N8 )
		( INCLUDES-1ARY VISITED N9 )
		( INCLUDES-1ARY VISITED N10 )
		( INCLUDES-1ARY VISITED N11 )
		( INCLUDES-1ARY VISITED N12 )
		( INCLUDES-1ARY VISITED N13 )
		( INCLUDES-1ARY VISITED N14 )
		( INCLUDES-1ARY VISITED N15 )
		( INCLUDES-1ARY VISITED N16 )
		( INCLUDES-1ARY VISITED N17 )
		( INCLUDES-1ARY VISITED N18 )
		( INCLUDES-1ARY VISITED N19 )
		( INCLUDES-1ARY VISITED N20 )
	)
  :EFFECT
	( AND
		( DONE-PROGRAMMING )
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
		( INCLUDES-1ARY VISITED N1 )
		( INCLUDES-1ARY VISITED N2 )
		( INCLUDES-1ARY VISITED N3 )
		( INCLUDES-1ARY VISITED N4 )
		( INCLUDES-1ARY VISITED N5 )
		( INCLUDES-1ARY VISITED N6 )
		( INCLUDES-1ARY VISITED N7 )
		( INCLUDES-1ARY VISITED N8 )
		( INCLUDES-1ARY VISITED N9 )
		( INCLUDES-1ARY VISITED N10 )
		( INCLUDES-1ARY VISITED N11 )
		( INCLUDES-1ARY VISITED N12 )
		( INCLUDES-1ARY VISITED N13 )
		( INCLUDES-1ARY VISITED N14 )
		( INCLUDES-1ARY VISITED N15 )
		( INCLUDES-1ARY VISITED N16 )
		( INCLUDES-1ARY VISITED N17 )
		( INCLUDES-1ARY VISITED N18 )
		( INCLUDES-1ARY VISITED N19 )
		( INCLUDES-1ARY VISITED N20 )
	)
  :EFFECT
	( AND
		( DONE-PROGRAMMING )
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
		( INCLUDES-1ARY VISITED N1 )
		( INCLUDES-1ARY VISITED N2 )
		( INCLUDES-1ARY VISITED N3 )
		( INCLUDES-1ARY VISITED N4 )
		( INCLUDES-1ARY VISITED N5 )
		( INCLUDES-1ARY VISITED N6 )
		( INCLUDES-1ARY VISITED N7 )
		( INCLUDES-1ARY VISITED N8 )
		( INCLUDES-1ARY VISITED N9 )
		( INCLUDES-1ARY VISITED N10 )
		( INCLUDES-1ARY VISITED N11 )
		( INCLUDES-1ARY VISITED N12 )
		( INCLUDES-1ARY VISITED N13 )
		( INCLUDES-1ARY VISITED N14 )
		( INCLUDES-1ARY VISITED N15 )
		( INCLUDES-1ARY VISITED N16 )
		( INCLUDES-1ARY VISITED N17 )
		( INCLUDES-1ARY VISITED N18 )
		( INCLUDES-1ARY VISITED N19 )
		( INCLUDES-1ARY VISITED N20 )
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
		( FORALL
			( ?VARIABLE2 - VARIABLE ?VALUE3 - VALUE )
			( AND
				( NOT ( ASSIGNMENT ?VARIABLE2 ?VALUE3 ?STACKROW1 ) )
			)
		)
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
		( FORALL
			( ?VARIABLE2 - VARIABLE ?VALUE3 - VALUE )
			( AND
				( NOT ( ASSIGNMENT ?VARIABLE2 ?VALUE3 ?STACKROW1 ) )
			)
		)
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
		( FORALL
			( ?VARIABLE2 - VARIABLE ?VALUE3 - VALUE )
			( AND
				( NOT ( ASSIGNMENT ?VARIABLE2 ?VALUE3 ?STACKROW1 ) )
			)
		)
	)
)
( :ACTION REPEAT-TRUE-CALL-0-0
  :PARAMETERS ( ?VARIABLE0 - VARIABLE ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( ACCUMULATOR-0 ?STACKROW2 )
		( TRUE-CALL-0-0 ?VARIABLE0 ?STACKSTATE1 )
		( NEXT-STACK-ROW ?STACKROW2 ?STACKROW3 )
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( DONE-EVALUATING-0 ?STACKROW2 )
		( NOT ( DONE-APPLYING-0 ?STACKROW2 ) )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW2 ) )
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK STATE-0 ?STACKROW3 )
		( DONE-APPLYING-0 ?STACKROW2 )
		( FORALL
			( ?VALUE4 - VALUE )
			( WHEN
				( ASSIGNMENT ?VARIABLE0 ?VALUE4 ?STACKROW2 )
				( ASSIGNMENT CURRENT ?VALUE4 ?STACKROW3 )
			)
		)
	)
)
( :ACTION REPEAT-FALSE-CALL-0-0
  :PARAMETERS ( ?VARIABLE0 - VARIABLE ?STACKSTATE1 - STACKSTATE ?STACKROW2 - STACKROW ?STACKROW3 - STACKROW )
  :PRECONDITION
	( AND
		( NOT ( ACCUMULATOR-0 ?STACKROW2 ) )
		( FALSE-CALL-0-0 ?VARIABLE0 ?STACKSTATE1 )
		( NEXT-STACK-ROW ?STACKROW2 ?STACKROW3 )
		( TOP-STACK ?STACKROW2 )
		( STACK-PROCEDURE-0 ?STACKROW2 )
		( STATE-STACK ?STACKSTATE1 ?STACKROW2 )
		( DONE-EVALUATING-0 ?STACKROW2 )
		( NOT ( DONE-APPLYING-0 ?STACKROW2 ) )
	)
  :EFFECT
	( AND
		( NOT ( TOP-STACK ?STACKROW2 ) )
		( TOP-STACK ?STACKROW3 )
		( STACK-PROCEDURE-0 ?STACKROW3 )
		( STATE-STACK STATE-0 ?STACKROW3 )
		( DONE-APPLYING-0 ?STACKROW2 )
		( FORALL
			( ?VALUE4 - VALUE )
			( WHEN
				( ASSIGNMENT ?VARIABLE0 ?VALUE4 ?STACKROW2 )
				( ASSIGNMENT CURRENT ?VALUE4 ?STACKROW3 )
			)
		)
	)
)
)