;;;;SICP Exercise 1.6




(define (sqrt-iter-improved g x)
		 (if(good-enough? g x)
		    g
		    (sqrt-iter-improved (improve-guess g x) x)))





(define (good-enough? g x)
		     (< (- g (guess-change g x)) 0.001))


(define (square x) (* x x))

(define (average m n)
	       (/ (+ m n) 2))


(define (improve-guess g x)
		     (average g (/ x g)))


(define (guess-change g x)
  (abs (- g (improve-guess g x))))

(define (sqroot-improved x)
  (sqrt-iter-improved 1.0 x))

;;;Testing our square root iteration by computing the square root of 2
	
;Unbound variable: sqroot-improved




