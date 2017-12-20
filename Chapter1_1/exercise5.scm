;;;Exercise 5: Applicative vs normal order

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;(test 0 (p))
;;;; Interpreter hangs....
;;;; Applicative order: Infinite loop. The evaluation of the expression (p)
;;;; results in (p) because the body of the procedure p is (p)
;;;; Therefore, the other 2 expressions, namely the oprand 0 and the operator test are never evaluated.
;;;; Normal order: the answer should be 0. Based on the evalation order for if, the predicate evaluates to
;;;; to true and; as a result, the consequent 0 is returned as the value