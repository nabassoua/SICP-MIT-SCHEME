;;;Computes the GCD of 2 numbers a and b using Euclid's algorithm


(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


;Value: gcd

;(gcd 2 2)
;Value: 2

;(gcd 16 2)
;Value: 2

;(gcd 125 5)
;Value: 5

;(gcd 1243 234)
;Value: 1