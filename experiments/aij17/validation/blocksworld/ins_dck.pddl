( DEFINE ( PROBLEM P100B )
( :DOMAIN BLOCKSWORLD )
( :OBJECTS
)
( :INIT
	( ADJACENT-COLUMNS C1 C2 )
	( ADJACENT-COLUMNS C2 C3 )
	( ADJACENT-COLUMNS C3 C4 )
	( ADJACENT-COLUMNS C4 C5 )
	( ADJACENT-COLUMNS C5 C6 )
	( ADJACENT-COLUMNS C6 C7 )
	( ADJACENT-COLUMNS C7 C8 )
	( ADJACENT-COLUMNS C8 C9 )
	( ADJACENT-COLUMNS C9 C10 )
	( ADJACENT-COLUMNS C10 C11 )
	( ADJACENT-COLUMNS C11 C12 )
	( ADJACENT-COLUMNS C12 C13 )
	( ADJACENT-COLUMNS C13 C14 )
	( ADJACENT-COLUMNS C14 C15 )
	( ADJACENT-COLUMNS C15 C16 )
	( ADJACENT-COLUMNS C16 C17 )
	( ADJACENT-COLUMNS C17 C18 )
	( ADJACENT-COLUMNS C18 C19 )
	( ADJACENT-COLUMNS C19 C20 )
	( ADJACENT-COLUMNS C20 C21 )
	( ADJACENT-COLUMNS C21 C22 )
	( ADJACENT-COLUMNS C22 C23 )
	( ADJACENT-COLUMNS C23 C24 )
	( ADJACENT-COLUMNS C24 C25 )
	( ADJACENT-COLUMNS C25 C26 )
	( ADJACENT-COLUMNS C26 C27 )
	( ADJACENT-COLUMNS C27 C28 )
	( ADJACENT-COLUMNS C28 C29 )
	( ADJACENT-COLUMNS C29 C30 )
	( ADJACENT-COLUMNS C30 C31 )
	( ADJACENT-COLUMNS C31 C32 )
	( ADJACENT-COLUMNS C32 C33 )
	( ADJACENT-COLUMNS C33 C34 )
	( ADJACENT-COLUMNS C34 C35 )
	( ADJACENT-COLUMNS C35 C36 )
	( ADJACENT-COLUMNS C36 C37 )
	( ADJACENT-COLUMNS C37 C38 )
	( ADJACENT-COLUMNS C38 C39 )
	( ADJACENT-COLUMNS C39 C40 )
	( ADJACENT-COLUMNS C40 C41 )
	( ADJACENT-COLUMNS C41 C42 )
	( ADJACENT-COLUMNS C42 C43 )
	( ADJACENT-COLUMNS C43 C44 )
	( ADJACENT-COLUMNS C44 C45 )
	( ADJACENT-COLUMNS C45 C46 )
	( ADJACENT-COLUMNS C46 C47 )
	( ADJACENT-COLUMNS C47 C48 )
	( ADJACENT-COLUMNS C48 C49 )
	( ADJACENT-COLUMNS C49 C50 )
	( ADJACENT-COLUMNS C50 C51 )
	( ADJACENT-COLUMNS C51 C52 )
	( ADJACENT-COLUMNS C52 C53 )
	( ADJACENT-COLUMNS C53 C54 )
	( ADJACENT-COLUMNS C54 C55 )
	( ADJACENT-COLUMNS C55 C56 )
	( ADJACENT-COLUMNS C56 C57 )
	( ADJACENT-COLUMNS C57 C58 )
	( ADJACENT-COLUMNS C58 C59 )
	( ADJACENT-COLUMNS C59 C60 )
	( ADJACENT-COLUMNS C60 C61 )
	( ADJACENT-COLUMNS C61 C62 )
	( ADJACENT-COLUMNS C62 C63 )
	( ADJACENT-COLUMNS C63 C64 )
	( ADJACENT-COLUMNS C64 C65 )
	( ADJACENT-COLUMNS C65 C66 )
	( ADJACENT-COLUMNS C66 C67 )
	( ADJACENT-COLUMNS C67 C68 )
	( ADJACENT-COLUMNS C68 C69 )
	( ADJACENT-COLUMNS C69 C70 )
	( ADJACENT-COLUMNS C70 C71 )
	( ADJACENT-COLUMNS C71 C72 )
	( ADJACENT-COLUMNS C72 C73 )
	( ADJACENT-COLUMNS C73 C74 )
	( ADJACENT-COLUMNS C74 C75 )
	( ADJACENT-COLUMNS C75 C76 )
	( ADJACENT-COLUMNS C76 C77 )
	( ADJACENT-COLUMNS C77 C78 )
	( ADJACENT-COLUMNS C78 C79 )
	( ADJACENT-COLUMNS C79 C80 )
	( ADJACENT-COLUMNS C80 C81 )
	( ADJACENT-COLUMNS C81 C82 )
	( ADJACENT-COLUMNS C82 C83 )
	( ADJACENT-COLUMNS C83 C84 )
	( ADJACENT-COLUMNS C84 C85 )
	( ADJACENT-COLUMNS C85 C86 )
	( ADJACENT-COLUMNS C86 C87 )
	( ADJACENT-COLUMNS C87 C88 )
	( ADJACENT-COLUMNS C88 C89 )
	( ADJACENT-COLUMNS C89 C90 )
	( ADJACENT-COLUMNS C90 C91 )
	( ADJACENT-COLUMNS C91 C92 )
	( ADJACENT-COLUMNS C92 C93 )
	( ADJACENT-COLUMNS C93 C94 )
	( ADJACENT-COLUMNS C94 C95 )
	( ADJACENT-COLUMNS C95 C96 )
	( ADJACENT-COLUMNS C96 C97 )
	( ADJACENT-COLUMNS C97 C98 )
	( ADJACENT-COLUMNS C98 C99 )
	( ADJACENT-COLUMNS C99 C100 )
	( HANDEMPTY )
	( CURRENT-COLUMNS C86 )
	( GOAL-COLUMNS C22 )
	( ONTABLE B77 )
	( ON B85 B77 )
	( ON B58 B85 )
	( ON B68 B58 )
	( ON B54 B68 )
	( ON B25 B54 )
	( ON B50 B25 )
	( ON B72 B50 )
	( ON B74 B72 )
	( ON B69 B74 )
	( ON B35 B69 )
	( ON B61 B35 )
	( ON B27 B61 )
	( ON B44 B27 )
	( CLEAR B44 )
	( ONTABLE B49 )
	( ON B22 B49 )
	( CLEAR B22 )
	( ONTABLE B31 )
	( CLEAR B31 )
	( ONTABLE B11 )
	( CLEAR B11 )
	( ONTABLE B18 )
	( CLEAR B18 )
	( ONTABLE B10 )
	( CLEAR B10 )
	( ONTABLE B59 )
	( CLEAR B59 )
	( ONTABLE B21 )
	( CLEAR B21 )
	( ONTABLE B40 )
	( CLEAR B40 )
	( ONTABLE B47 )
	( CLEAR B47 )
	( ONTABLE B38 )
	( CLEAR B38 )
	( ONTABLE B14 )
	( CLEAR B14 )
	( ONTABLE B84 )
	( CLEAR B84 )
	( ONTABLE B34 )
	( CLEAR B34 )
	( ONTABLE B8 )
	( CLEAR B8 )
	( ONTABLE B53 )
	( CLEAR B53 )
	( ONTABLE B67 )
	( CLEAR B67 )
	( ONTABLE B95 )
	( CLEAR B95 )
	( ONTABLE B79 )
	( CLEAR B79 )
	( ONTABLE B3 )
	( CLEAR B3 )
	( ONTABLE B82 )
	( CLEAR B82 )
	( ONTABLE B45 )
	( CLEAR B45 )
	( ONTABLE B100 )
	( CLEAR B100 )
	( ONTABLE B36 )
	( CLEAR B36 )
	( ONTABLE B55 )
	( CLEAR B55 )
	( ONTABLE B19 )
	( CLEAR B19 )
	( ONTABLE B46 )
	( CLEAR B46 )
	( ONTABLE B60 )
	( CLEAR B60 )
	( ONTABLE B33 )
	( CLEAR B33 )
	( ONTABLE B32 )
	( CLEAR B32 )
	( ONTABLE B51 )
	( CLEAR B51 )
	( ONTABLE B94 )
	( CLEAR B94 )
	( ONTABLE B15 )
	( CLEAR B15 )
	( ONTABLE B91 )
	( CLEAR B91 )
	( ONTABLE B92 )
	( CLEAR B92 )
	( ONTABLE B43 )
	( CLEAR B43 )
	( ONTABLE B97 )
	( CLEAR B97 )
	( ONTABLE B81 )
	( CLEAR B81 )
	( ONTABLE B98 )
	( CLEAR B98 )
	( ONTABLE B65 )
	( CLEAR B65 )
	( ONTABLE B20 )
	( CLEAR B20 )
	( ONTABLE B90 )
	( CLEAR B90 )
	( ONTABLE B12 )
	( CLEAR B12 )
	( ONTABLE B16 )
	( CLEAR B16 )
	( ONTABLE B37 )
	( CLEAR B37 )
	( ONTABLE B75 )
	( CLEAR B75 )
	( ONTABLE B41 )
	( CLEAR B41 )
	( ONTABLE B24 )
	( CLEAR B24 )
	( ONTABLE B66 )
	( CLEAR B66 )
	( ONTABLE B86 )
	( CLEAR B86 )
	( ONTABLE B4 )
	( CLEAR B4 )
	( ONTABLE B48 )
	( CLEAR B48 )
	( ONTABLE B71 )
	( CLEAR B71 )
	( ONTABLE B99 )
	( CLEAR B99 )
	( ONTABLE B52 )
	( CLEAR B52 )
	( ONTABLE B7 )
	( CLEAR B7 )
	( ONTABLE B73 )
	( CLEAR B73 )
	( ONTABLE B13 )
	( CLEAR B13 )
	( ONTABLE B29 )
	( CLEAR B29 )
	( ONTABLE B80 )
	( CLEAR B80 )
	( ONTABLE B78 )
	( CLEAR B78 )
	( ONTABLE B9 )
	( CLEAR B9 )
	( ONTABLE B1 )
	( CLEAR B1 )
	( ONTABLE B63 )
	( CLEAR B63 )
	( ONTABLE B76 )
	( CLEAR B76 )
	( ONTABLE B2 )
	( CLEAR B2 )
	( ONTABLE B89 )
	( CLEAR B89 )
	( ONTABLE B30 )
	( CLEAR B30 )
	( ONTABLE B39 )
	( CLEAR B39 )
	( ONTABLE B87 )
	( CLEAR B87 )
	( ONTABLE B83 )
	( CLEAR B83 )
	( ONTABLE B6 )
	( CLEAR B6 )
	( ONTABLE B26 )
	( CLEAR B26 )
	( ONTABLE B64 )
	( CLEAR B64 )
	( ONTABLE B56 )
	( CLEAR B56 )
	( ONTABLE B93 )
	( CLEAR B93 )
	( ONTABLE B17 )
	( CLEAR B17 )
	( ONTABLE B5 )
	( CLEAR B5 )
	( ONTABLE B88 )
	( CLEAR B88 )
	( ONTABLE B23 )
	( CLEAR B23 )
	( ONTABLE B70 )
	( CLEAR B70 )
	( ONTABLE B62 )
	( CLEAR B62 )
	( ONTABLE B28 )
	( CLEAR B28 )
	( ONTABLE B57 )
	( CLEAR B57 )
	( ONTABLE B42 )
	( CLEAR B42 )
	( ONTABLE B96 )
	( CLEAR B96 )
	( TEST-0 )
	( NEXT-STACK-ROW ROW-0 ROW-1 )
	( STACK-MAIN ROW-0 )
	( STACK-LINE-0 ROW-0 )
	( TOP-STACK ROW-0 )
	( INS-UNSTACK-0-0 )
	( INS-PUT-DOWN-0-1 )
	( GOTO-0-2-0 )
	( COND-ALL-CLEAR-0-2 )
	( INS-END-0-3 )
	( CALL-0-1-0 )
	( INS-PICK-UP-1 )
	( INS-STACK-2 )
	( GOTO-1-3-1 )
	( COND-GOAL-TOWERS-1-3 )
	( INS-END-4 )
)
( :GOAL
	( AND
		( DONE-PROGRAMMING )
	)
)
( :METRIC MINIMIZE ( TOTAL-COST ) )
)
