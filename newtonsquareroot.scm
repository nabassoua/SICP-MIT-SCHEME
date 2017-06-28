;;;;The following procedures implement the computation of
;;;;a square root of a number by the Newton square root method

(define (sqrt-iter g x)
		 (if(good-enough? g x)
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

;;;Testing our square root iteration by computing the square root of 2


;(sqroot 2)
;Value: 577/408