(define (problem ab-regex-3)
  (:domain regularExpressions)
  (:objects i0 i1 i2 i3 - index)
  (:init (at i0)(current-content a)(adjacent i0 i1)(content i0 a)(adjacent i1 i2)(content i1 b)(adjacent i2 i3)(content i2 a)(content i3 empty ) )
  (:goal (and  (at i3) )))