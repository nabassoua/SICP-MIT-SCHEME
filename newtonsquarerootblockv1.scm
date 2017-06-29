;;;;This version of the Newton following procedure implements the procedures
;;;;good-enough?, improve-guess and sqrt-iter as internal procedures to sqroot

(define (average x y)
  (/ (+ x y) 2))


(define (sqroot x)
  (define (good-enough? g)
		     (< (abs (- (square g) x)) 0.001))
  (define (improve-guess g)
		     (average g (/ x g)))

  (define (sqrt-iter g)
		 (if(good-enough? g)
		    g
		    (sqrt-iter (improve-guess g))))
  (sqrt-iter 1.0 ))

;;;Testing our sqroot procedure


;(sqroot 4)
;Value: 2.0000000929222947

