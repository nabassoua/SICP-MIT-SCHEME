;;;;This version of the Newton square root procedure highlights
;;;;the use of procedure without parameters. Namely, 2 levels of 
;;;;nesting are used. First, the sqrt-iter procedure is internal to sqroot
;;;;Second, the good-enough? and improve-guess procedures are internal to sqrt-iter 

(define (average x y)
  (/ (+ x y) 2))


(define (sqroot x)
  (define (sqrt-iter g)
    (define (good-enough?)
		     (< (abs (- (square g) x)) 0.001))
    (define (improve-guess)
		     (average g (/ x g)))
    (if(good-enough?)
       g
       (sqrt-iter (improve-guess))))
  (sqrt-iter 1.0 ))

;;;Testing our sqroot procedure



(sqroot 5)
;Value: 2.2360688956433634

(sqroot 4)
;Value: 2.0000000929222947
