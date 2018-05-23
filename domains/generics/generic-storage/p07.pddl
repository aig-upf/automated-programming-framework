; Map of the Depots:         
; 000    
; *00    
;----    
; 0: depot0 area
; *: Depot access point
; =: Transit area

(define (problem storage-7)
(:domain Storage-Propositional)
(:objects
	depot0-1-1 depot0-1-2 depot0-1-3 depot0-2-1 depot0-2-2 depot0-2-3 container-0-0 container-0-1 container-0-2 - storearea
	hoist0 - hoist
	crate0 crate1 crate2 - crate
	container0 - container
	depot0 - depot
	loadarea - transitarea
	gin - relation )

(:init
	(includes-2ary connected depot0-1-1 depot0-2-1)
	(includes-2ary connected depot0-1-1 depot0-1-2)
	(includes-2ary connected depot0-1-2 depot0-2-2)
	(includes-2ary connected depot0-1-2 depot0-1-3)
	(includes-2ary connected depot0-1-2 depot0-1-1)
	(includes-2ary connected depot0-1-3 depot0-2-3)
	(includes-2ary connected depot0-1-3 depot0-1-2)
	(includes-2ary connected depot0-2-1 depot0-1-1)
	(includes-2ary connected depot0-2-1 depot0-2-2)
	(includes-2ary connected depot0-2-2 depot0-1-2)
	(includes-2ary connected depot0-2-2 depot0-2-3)
	(includes-2ary connected depot0-2-2 depot0-2-1)
	(includes-2ary connected depot0-2-3 depot0-1-3)
	(includes-2ary connected depot0-2-3 depot0-2-2)
	(includes-2ary in depot0-1-1 depot0)
	(includes-2ary in depot0-1-2 depot0)
	(includes-2ary in depot0-1-3 depot0)
	(includes-2ary in depot0-2-1 depot0)
	(includes-2ary in depot0-2-2 depot0)
	(includes-2ary in depot0-2-3 depot0)
	(includes-2ary on crate0 container-0-0)
	(includes-2ary on crate1 container-0-1)
	(includes-2ary on crate2 container-0-2)
	(includes-2ary in crate0 container0)
	(includes-2ary in crate1 container0)
	(includes-2ary in crate2 container0)
	(includes-2ary in container-0-0 container0)
	(includes-2ary in container-0-1 container0)
	(includes-2ary in container-0-2 container0)
	(includes-2ary connected loadarea container-0-0) 
	(includes-2ary connected container-0-0 loadarea)
	(includes-2ary connected loadarea container-0-1) 
	(includes-2ary connected container-0-1 loadarea)
	(includes-2ary connected loadarea container-0-2) 
	(includes-2ary connected container-0-2 loadarea)  
	(includes-2ary connected depot0-2-1 loadarea)
	(includes-2ary connected loadarea depot0-2-1)  
	(includes-1ary clear depot0-1-1)
	(includes-1ary clear depot0-1-2)
	(includes-1ary clear depot0-2-3)
	(includes-1ary clear depot0-2-1)
	(includes-1ary clear depot0-2-2)  
	(includes-2ary at hoist0 depot0-1-3)
	(includes-1ary available hoist0)

	(arity-1 available)
	(arity-1 clear)
	(arity-2 in)
	(arity-2 on)
	(arity-2 connected)
	(arity-2 at)
	(arity-2 lifting)

	(arity-2 gin)

	(includes-2ary gin crate0 depot0)
	(includes-2ary gin crate1 depot0)
	(includes-2ary gin crate2 depot0)

)

(:goal (and
	(includes-2ary in crate0 depot0)
	(includes-2ary in crate1 depot0)
	(includes-2ary in crate2 depot0)))
)
