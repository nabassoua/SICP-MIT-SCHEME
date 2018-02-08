;;;A more general version of accumulate

(define (filtered-accumulate combiner null-value  term a next b filter?)
  (if (> a b)
      null-value
      (if (filter? a)
	  (combiner (term a)
		    (recursive-accumulate combiner null-value term (next a) next b))
          (combiner (term a)
		    (recursive-accumulate combiner null-value term (next a) next b)))))

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


;;; Sum of squares of primes using 

(define (mysquare x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (identity x) x)
  

(filtered-accumulate + 0 identity 1 inc  9 prime?)

