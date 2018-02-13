;;;General procedures


;;;Fixed Point

(define tolerance 0.00001)

(define (fixed-point f initial-guess)
  (define (good-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
      (let ((next (f guess)))
	(if (good-enough? guess next)
	    next
	    (try  next)))) 
  (try initial-guess))
	
  
;;;Test cases

;(fixed-point (lambda (y) (+ (cos y) (sin y))) 1.0)
;Value: 1.2587315962971173

(define (average x y)
  (/ (+ x y) 2.0))




(define (mysqrt x)
  (fixed-point (lambda (y) (average y (/ x y))) 1.0))

;(mysqrt 5.0)
;Value: 2.236067977499978