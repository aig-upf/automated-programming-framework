( DEFINE ( DOMAIN LIST )
( :REQUIREMENTS :TYPING )
( :TYPES
	NODE - OBJECT
)
( :PREDICATES
	( AT ?NODE0 - NODE )
	( VISITED ?NODE0 - NODE )
	( NOT-VISITED ?NODE0 - NODE )
	( ADJACENT ?NODE0 - NODE ?NODE1 - NODE )
	( TAIL ?NODE0 - NODE )
	( IS-TAIL )
)
( :ACTION MOVE-NEXT
  :PARAMETERS ( )
  :PRECONDITION
	( AND
	)
  :EFFECT
	( AND
		( FORALL
			( ?NODE0 - NODE ?NODE1 - NODE )
			( AND
				( WHEN
					( AND
						( ADJACENT ?NODE0 ?NODE1 )
						( AT ?NODE0 )
					)
					( AND
						( NOT ( AT ?NODE0 ) )
						( AT ?NODE1 )
					)
				)
			)
		)
	)
)
	( :ACTION VISIT-NODE
  		:PARAMETERS ( )
  		:PRECONDITION
		( AND
		)
  		:EFFECT
		( AND
		( FORALL
			( ?NODE0 - NODE )
			( AND
				( WHEN
					( AND
							( AT ?NODE0 )
							( NOT ( VISITED ?NODE0 ) )
						)
						( AND
							( VISITED ?NODE0 )
							( NOT ( NOT-VISITED ?NODE0 ) )
							)
					)
				)
			)
		)
	)

	(:derived (is-tail)
		(exists (?n - node) 
			(and (at ?n)(tail ?n))
		)
	)

)
