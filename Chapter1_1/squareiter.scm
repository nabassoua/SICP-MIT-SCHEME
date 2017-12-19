;;;;Compute square root via Newton's method


;;;Computes average of 2 numbers

(define (average x y)
  (/ (+ x y) 2))

;;;Squares 2 numbers

(define (mysq x)
  (* x x))


;;;Square root procedure

(define (mysquare x)
  (mysquare-iter 1.0 x))

;;; Square iteration via newton's method

(define (mysquare-iter guess x)
  (if (good-enough? guess x)
      guess
      (mysquare-iter (improve-guess guess x) x)))

;;; Finds whether the guess is a good approximation

(define (good-enough? guess x)
  (< (abs (- (mysq guess) x)) 0.001))

;;; Improves the guess

(define (improve-guess guess x)
  (average guess (/ x guess)))


;;; Some examples

;(mysquare 4.0)
;Value: 2.0000000929222947

;(mysquare 16)
;Value: 4.000000636692939

;(mysquare 5)
;Value: 2.2360688956433634
