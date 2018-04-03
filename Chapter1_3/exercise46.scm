;;;;Exercise 46

(define (iterative-improve good-enough? improve-guess)
  (define (iter guess) 
    (if (good-enough? guess)
     guess
     (iter (improve-guess guess))))
  iter)


;;;Rewrite fixed point

(define tolerance 0.00001)

(define (new-fixed-point f initial-guess)
  ((iterative-improve (lambda (guess)
			(< (abs (- (f guess) guess)) tolerance))
		      (lambda (guess)
			(f guess)))
   initial-guess))
			
;;;Test case

;x(new-fixed-point (lambda(x) (+ 1 (/ 1 x))) 2.0)
;Value: 1.6180371352785146



	                                     