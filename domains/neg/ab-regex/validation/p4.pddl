(define (problem ab-regex-4)
  (:domain regularExpressions)
  (:objects i0 i1 i2 i3 i4 - index)
  (:init (at i0)(current-content a)(adjacent i0 i1)(content i0 a)(adjacent i1 i2)(content i1 b)(adjacent i2 i3)(content i2 a)(adjacent i3 i4)(content i3 b)(content i4 empty ) )
  (:goal (and  (at i4) )))