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
  (sqrt-iter 1.0 x))

;;;Testing our square root iteration with new-if instead of if
;;;We get an infinite loop variablex




;(new-if (= 1 1) 0 5)
;Value: 0





;(sqroot 4.0)
;Aborting!: maximum recursion depth exceeded
;Start debugger? (y or n):



