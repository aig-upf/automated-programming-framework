(define (domain gripper)
 (:requirements :typing)
 (:types balls room)
 (:predicates (ballsA ?b - balls)
	      (ballsB ?b - balls)
	      (ballsR ?b - balls)
	      (at-robby ?r - room)
	      (succR ?b1 ?b2 - balls)
	      (succAB ?b1 ?b2 - balls)
	      (goalB ?b - balls)
	      (equal-B-GoalB))

   (:constants roomA roomB - room b0 b2 - balls )

   (:action move
       :parameters  ()
       :precondition ()
       :effect (and  (when (and (at-robby roomA))
       	       	     	   (and (at-robby roomB) (not (at-robby roomA))))
		     (when (and (at-robby roomB))
       	       	     	   (and (at-robby roomA) (not (at-robby roomB))))))
   (:action pick
       :parameters  ()
       :precondition ()
       :effect (and (forall (?b1 ?b2 - balls)
       	       	    	 (and
       	       	    	    (when (and (not (ballsA b0)) (at-robby roomA) (ballsR ?b1) (succR ?b1 ?b2))
			    	  (and (not (ballsR ?b1)) (ballsR ?b2)))
       	       	    	    (when (and (not (ballsB b0)) (at-robby roomB) (ballsR ?b1) (succR ?b1 ?b2))
			    	  (and (not (ballsR ?b1)) (ballsR ?b2)))

       	       	    	    (when (and (not (ballsR b2)) (at-robby roomA) (ballsA ?b1) (succAB ?b2 ?b1))
			    	  (and (not (ballsA ?b1)) (ballsA ?b2)))
       	       	    	    (when (and (not (ballsR b2)) (at-robby roomB) (ballsB ?b1) (succAB ?b2 ?b1))
			    	  (and (not (ballsB ?b1)) (ballsB ?b2)))))))

   (:action drop
       :parameters  ()
       :precondition ()
       :effect (and (forall (?b1 ?b2 - balls)
       	       	    	 (and
       	       	    	    (when (and (at-robby roomA) (ballsR ?b1) (succR ?b2 ?b1))
			    	  (and (not (ballsR ?b1)) (ballsR ?b2)))
       	       	    	    (when (and (at-robby roomB) (ballsR ?b1) (succR ?b2 ?b1))
			    	  (and (not (ballsR ?b1)) (ballsR ?b2)))

       	       	    	    (when (and (not (ballsR b0)) (at-robby roomA) (ballsA ?b1) (succAB ?b1 ?b2))
			    	  (and (not (ballsA ?b1)) (ballsA ?b2)))
       	       	    	    (when (and (not (ballsR b0)) (at-robby roomB) (ballsB ?b1) (succAB ?b1 ?b2))
			    	  (and (not (ballsB ?b1)) (ballsB ?b2)))))))

(:derived (equal-B-GoalB)
	(and (exists (?b - balls) (and (ballsB ?b) (goalB ?b)))))
)
