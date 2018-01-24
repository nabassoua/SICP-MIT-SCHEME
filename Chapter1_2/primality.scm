;;;Tests whether a natural number n is prime


(define (divisor? a b)
  (= (remainder b a) 0))

(define (prime n)
  (= (smallest-divisor n) n)) 

(define (smallest-divisor n)
  (find-divisors n 2))

(define (find-divisors n test-divisors)
  (cond ((> (square test-divisors) n) n)
	((divisor? test-divisors n) test-divisors)
	(else (find-divisors n (+ test-divisors 1)))))

;;;Examples

;(prime 25)
;Value: #f

;(prime 4)
;Value: #f

;(prime 5)
;Value: #t