;;x;Testing primality of the Carmichael numbers 561,1105,1729,2465,2821,6601

(define (even? x)
  (= (remainder x 2) 0))

;;;Computes (b^exp)mod(m)

(define (expmod b exp m)
  (cond ((= exp 0) 1)
	((even? exp)(remainder (square (expmod b (/ exp 2) m)) m))
	(else (remainder (* b (expmod b (- exp 1) m)) m))))


;;;Fermat test

(define (fermat n)
  (define (try-it a)
    (= (expmod a n n) a)
  )
  (try-it (+ 1 (random (- n 1)))))

;;;Primality test using Fermat test

(define (fast-prime? n times)
  ( cond ((= times 0) true)
	 ((fermat n) (fast-prime? n (- times 1)))
	 (else false)))
#|		     
(fast-prime? 561 20)
;Value: #t

(fast-prime? 1105  20)
;Value: #t

(fast-prime? 1729  20)
;Value: #t

(fast-prime? 2465 20)
;Value: #t

(fast-prime? 2821 20)
;Value: #t

(fast-prime? 6601 20)
;Value: #t

|#