
;;;;SICP Exercise 1.8: Newton's method for cube roots 



(define (cube-iter g x)
		 (if(good-enough? g x)
		    g
		    (cube-iter (improve-guess g x) x)))


(define (improve-guess g x)
		     (/ (+ (/ x
			      (square g))
			   (* 2 g))
			3))

(define (cube x)(* x x x))


(define (square x) (* x x))

(define (average m n)
	       (/ (+ m n) 2))


(define (good-enough? g x)
		     (< (abs (- (cube g) x)) 0.001))

(define (cuberoot x)
  (cube-iter 1.0 x))

;;;Testing our cube root iteration by computing the cube root of 27 and 3
;;;There is a bug as the value returned are not correct


(cuberoot 27)
;Value: 1

;(cuberoot 3)
;Value: 1

