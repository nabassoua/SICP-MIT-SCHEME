;;; Exercise 7: Efficiency of the square root procedure

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



;;;;Testing a very large number

;(mysquare 4)
;Value: 2.0000000929222947

;(mysquare 100000000000000000000)
;Value: 10000000000.

;(mysquare 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
;Value: 3.162277660168379e42

;(mysquare 100000000000000444444444444444000000000055555555555555555599999999999999999999222222222222228888877745)


;;;Testing a very small number