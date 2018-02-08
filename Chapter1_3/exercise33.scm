;;;A more general version of accumulate

(define (filtered-accumulate combiner null-value  term a next b filter?)
  (if (> a b)
      null-value
      (if (filter? a)
	  (combiner (term a)
		    (filtered-accumulate combiner null-value term (next a) next b filter?))
	  (filtered-accumulate combiner null-value term (next a) next b filter?))))

;;;Tests whether a natural number n is prime


(define (divisor? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= (smallest-divisor n) n)) 

(define (smallest-divisor n)
  (find-divisors n 2))

(define (find-divisors n test-divisors)
  (cond ((> (square test-divisors) n) n)
	((divisor? test-divisors n) test-divisors)
	(else (find-divisors n (+ test-divisors 1)))))


;;; Sum of squares of primes using 

(define (mysquare x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (identity x) x)
  

;(filtered-accumulate + 0 mysquare 1 inc  5 prime?)
;Value: 39

;product of integers relatively prime to n


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (relatively-prime? a b)
  (= (gcd a b) 1))

(define (product-of-relatively-prime n)
  (define (relatively-prime? i)
    (= (gcd i n) 1))

  (filtered-accumulate * 1  identity 1 inc  (- n 1) relatively-prime?)) 


;(product-of-relatively-prime 10)
;Value: 189