;;;Yet another version of fast exponentiation

(define (fast-exp2 b n)
  (fast-exp2-help b n 1))

(define (fast-exp2-help b n a)
  (cond ((= n 0) a)
	((even? n) (fast-exp2-help (square b) (/ n 2) a))
	(else (fast-exp2-help  b (- n 1) (* a b))))))
	    

(define (even? n)
  (= (remainder n 2) 0))