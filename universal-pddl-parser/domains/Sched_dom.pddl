(define (domain schedule)
  (:requirements :strips)

  (:constants cold hot cylindrical polisher roller lathe grinder punch drill-press
	      spray-painter immersion-painter polished rough smooth
		nowidth noorient undefined nopaint unwantedargs)

  (:predicates (part ?obj)
	       (temperature ?obj ?temp)
	       (busy ?machine) (idle ?machine)
	       (scheduled ?obj ?task) (unscheduled ?obj)
	       (surface-condition ?obj ?surface-cond)
	       (shape ?obj ?shape)
	       (painted ?obj ?colour)
	       (has-hole ?obj ?width ?orientation)
	       (has-bit ?machine ?width)
	       (can-orient ?machine ?orientation)
	       (has-paint ?machine ?colour)
		(lasthole ?x ?y ?z) (linked ?x ?y ?z ?a ?b) (ru ?r))

  (:action do-polish
	   :parameters (?x ?r ?oldsurface)
	   :precondition (and (ru ?r) (part ?x)
			      (idle polisher)
			      (unscheduled ?x)
			      (temperature ?x cold)
			      (surface-condition ?x ?oldsurface))
	   :effect (and (busy polisher) (not (idle polisher))
			(scheduled ?x polisher) (not (unscheduled ?x))
			(surface-condition ?x polished)
		    (not (surface-condition ?x ?oldsurface))))
				  

 (:action do-roll
	   :parameters (?x ?r ?oldsurface ?oldtemp ?oldshape ?oldpaint)
	   :precondition (and (ru ?r) (part ?x)
			      (idle roller)
			      (unscheduled ?x)
			      (surface-condition ?x ?oldsurface)
			      (temperature ?x ?oldtemp)
			      (shape ?x ?oldshape)
			      (painted ?x ?oldpaint)
			      (lasthole ?x nowidth noorient))
	   :effect (and
		    (busy roller) (not (idle roller))
		    (scheduled ?x roller) (not (unscheduled ?x))
		    (temperature ?x hot) (not (temperature ?x ?oldtemp))
		    (shape ?x cylindrical) (not (shape ?x ?oldshape))
			(not (painted ?x ?oldpaint)) (painted ?x nopaint)
			(surface-condition ?x rough) (not (surface-condition ?x ?oldsurface))
			      ))

  (:action do-lathe
	   :parameters (?x ?r ?oldshape ?oldpaint ?oldsurface) 
	   :precondition (and (ru ?r) (part ?x)
			      (idle lathe)
			      (unscheduled ?x)
			      (painted ?x ?oldpaint)
			      (shape ?x ?oldshape)
			      (surface-condition ?x ?oldsurface))
	   :effect (and 
		    (busy lathe) (not (idle lathe))
		    (scheduled ?x lathe) (not (unscheduled ?x))
		    (surface-condition ?x rough)
		    (shape ?x cylindrical) (not (shape ?x ?oldshape))
			    (not (surface-condition ?x ?oldsurface))
			    (painted ?x nopaint) (not (painted ?x ?oldpaint))
			    ))

  (:action do-grind
	   :parameters (?x ?r ?oldpaint ?oldsurface) 
	   :precondition (and (ru ?r) (part ?x)
			      (idle grinder)
			      (unscheduled ?x)
			      (surface-condition ?x ?oldsurface)
			      (painted ?x ?oldpaint))
	   :effect (and
		    (busy GRINDER) (not (idle grinder))
		    (scheduled ?x grinder) (not (unscheduled ?x))
		    (surface-condition ?x smooth) (not (surface-condition ?x ?oldsurface))
			  (painted ?x nopaint) (not (painted ?x ?oldpaint))))

  (:action do-punch
	   :parameters (?x ?width ?orient ?r ?oldsurface ?oldwidth ?oldorient) 
	   :precondition (and (ru ?r)
			  (part ?x)
			  (has-bit punch ?width)
			  (can-orient punch ?orient)
			  (temperature ?x cold)
			  (idle punch)
			  (unscheduled ?x)
			  (surface-condition ?x ?oldsurface)
; DON'T REALLY NEED THIS		  (not (has-hole ?x ?width ?orient))
				(lasthole ?x ?oldwidth ?oldorient))
	   :effect (and
		    (busy punch) (not (idle punch))
		    (scheduled ?x punch) (not (unscheduled ?x))
		    (has-hole ?x ?width ?orient)
		    (lasthole ?x ?width ?orient)
		    (linked ?x ?oldwidth ?oldorient ?width ?orient) (not (lasthole ?x ?oldwidth ?oldorient))
		    (surface-condition ?x rough) (not (surface-condition ?x ?oldsurface))))

  (:action do-drill-press
	   :parameters (?x ?width ?orient ?r ?oldwidth ?oldorient)
	   :precondition (and (ru ?r)
			  (part  ?x)
			  (has-bit drill-press ?width)
			  (can-orient drill-press ?orient)
			  (temperature ?x cold)
			  (idle drill-press)
			  (unscheduled ?x)
; DON'T REALLY NEED THIS			  (not (has-hole ?x ?width ?orient))
			(lasthole ?x ?oldwidth ?oldorient)
			  )
	   :effect (and
		    (busy drill-press) (not (idle drill-press))
		    (scheduled ?x drill-press) (not (unscheduled ?x))
		    (lasthole ?x ?width ?orient)
		    (linked ?x ?oldwidth ?oldorient ?width ?orient) (not (lasthole ?x ?oldwidth ?oldorient))
		    (has-hole ?x ?width ?orient)))

  (:action do-spray-paint
	   :parameters (?x ?newpaint ?r ?oldpaint ?oldsurface) 
	   :precondition (and
			  (part ?x) (ru ?r)
			  (has-paint spray-painter ?newpaint)
			  (idle spray-painter)
			  (unscheduled ?x)
			  (temperature ?x cold)
			  (painted ?x ?oldpaint)
			  (surface-condition ?x ?oldsurface))
	   :effect (and
		    (busy spray-painter) (not (idle spray-painter))
		    (scheduled ?x spray-painter) (not (unscheduled ?x))
		    (painted ?x ?newpaint) (not (painted ?x ?oldpaint))
			(surface-condition ?x undefined) (not (surface-condition ?x ?oldsurface))
		))

  (:action do-immersion-paint
           :parameters (?x ?newpaint ?r ?oldpaint) 
           :precondition (and
                          (part ?x) (ru ?r)
                          (has-paint immersion-painter ?newpaint)
                          (idle immersion-painter)
                          (unscheduled ?x)
                          (painted ?x ?oldpaint))
           :effect (and
                    (busy immersion-painter) (not (idle immersion-painter))
                    (scheduled ?x immersion-painter) (not (unscheduled ?x))
                    (painted ?x ?newpaint) (not (painted ?x ?oldpaint))
 		))
  
  (:action do-time-step
           :parameters (?r ?x ?t)
           :precondition (and (ru ?r) (busy ?t) (scheduled ?x ?t))
	 :effect (and
				(not (busy ?t)) (idle ?t) (not (scheduled ?x ?t))
				(unscheduled ?x)))
  (:action delete-strip-holes
  	:parameters (?x ?width ?orient ?oldwidth ?oldorient)
  	:precondition (and (linked ?x ?oldwidth ?oldorient ?width ?orient)
  					(lasthole ?x ?width ?orient) (has-hole ?x ?width ?orient))
  	:effect (and (not (linked ?x ?oldwidth ?oldorient ?width ?orient))
  			(not (lasthole ?x ?width ?orient)) (not (has-hole ?x ?width ?orient))
  			(lasthole ?x ?oldwidth ?oldorient))))



