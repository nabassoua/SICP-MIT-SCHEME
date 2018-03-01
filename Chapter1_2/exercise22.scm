;;;;Exercise 22: Runtime of prime numbers

(load "primality.scm")


(define (prime? n)
  (= n (smallest-divisor n)))


(define (even? n)
  (= (remainder  n 2) 0))


(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;;Checks the primality of odd integers in a given interval (a,b) 

(define (search-for-primes a b)
  (if (even? a)
      (search-for-primes (+ a 1) b)
      (timed-prime-test a)))