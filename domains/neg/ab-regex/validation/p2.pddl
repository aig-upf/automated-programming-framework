(define (problem ab-regex-2)
  (:domain regularExpressions)
  (:objects i0 i1 i2 - index)
  (:init (at i0)(current-content a)(adjacent i0 i1)(content i0 a)(adjacent i1 i2)(content i1 b)(content i2 empty ) )
  (:goal (and  (at i2) )))
