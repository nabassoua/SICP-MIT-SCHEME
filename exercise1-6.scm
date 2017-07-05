;;;;SICP Exercise 1.6


(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))




(define (sqrt-iter g x)
		 (new-if (good-enough? g x)
		    g
		    (sqrt-iter (improve-guess g x) x)))


(define (good-enough? g x)
		     (< (abs (- (square g) x)) 0.001))


(define (square x) (* x x))

(define (average m n)
	       (/ (+ m n) 2))


(define (improve-guess g x)
		     (average g (/ x g)))

(define (sqroot x)
  (sqrt-iter 1 x))

;;;Testing our square root iteration with new-if instead of if
;;;We get an unbound variable error because the predicate in this case does not evaluate
;;;to either true or false when the new-if procedure in called. For instance, under applicative-order
;;;which MIT/GNU Scheme uses the good-enough? procedure is evaluated first and it returns either a true or false value


;(new-if (= 1 1) 0 5)
;Value: 0

;Value: sqrt-iter

;(sqroot 2)
;Unbound variable: sqroot
;To continue, call RESTART with an option number:
; (RESTART 4) => Specify a value to use instead of sqroot.
; (RESTART 3) => Define sqroot to a given value.
; (RESTART 2) => Return to read-eval-print level 2.
; (RESTART 1) => Return to read-eval-print level 1.
;Start debugger? (y or n):n





