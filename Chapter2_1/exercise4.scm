;;;;Exercise 4

(define (cons x y)
  (lambda(m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))


(define example (cons 2 3))

;(car (cons 2 3))
;Value: 2 

(define (cdr z)
  (z (lambda (p q) q)))

;(cdr (cons 2 3))
;Value: 3