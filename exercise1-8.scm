
;;;;SICP Exercise 1.8: Newton's method for cube roots 



(define (cube-iter guess previous-guess x)
		 (if(good-enough? guess previous-guess)
		    guess
		    (cube-iter (improve-guess guess previous-guess) guess x)))


(define (improve-guess guess x)
		     (/ (+ (/ x
			      (square guess))
			   (* 2 guess))
			3))

(define (cube x)(* x x x))


(define (square x) (* x x))

(define (average m n)
	       (/ (+ m n) 2))


(define (good-enough? guess previous-guess)
		     (< (abs (-  guess previous-guess)) 0.001))

(define (cuberoot x)
  (cube-iter 1.0 2.0 x))

;;;Testing our cube root iteration by computing the cube root of 27 and 3
;;;There is a bug as the value returned are not correct


;(cuberoot 27)
;Value: 1

;(cuberoot 3)
;Value: 1

