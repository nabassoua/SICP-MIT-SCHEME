;;;;Exercise 8: Newton's method for cube root

;;;Computes average of 2 numbers

(define (average x y)
  (/ (+ x y) 2))

;;;Squares 2 numbers

(define (mysq x)
  (* x x))

;;;Cube of a number

(define (mycube x)
  (* x x x))

;;;Square root procedure

(define (mycuberoot x)
  (mycube-iter 1.0 x))

;;; Square iteration via newton's method

(define (mycube-iter guess x)
  (if (good-enough? guess x)
      guess
      (mycube-iter (improve-guess guess x) x)))

;;; Finds whether the guess is a good approximation

(define (good-enough? guess x)
  (< (abs (- (mycube guess) x)) 0.001))

;;; Improves the guess

(define (improve-guess guess x)
  (/ (+ (/ x (mysq guess)) (* 2 guess)) 3))

;;;Examples

;(mycuberoot 27)
;Value: 3.0000005410641766