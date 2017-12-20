;;;Exercise 6: special form (if)

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
  (new-if (good-enough? guess x)
      guess
      (mysquare-iter (improve-guess guess x) x)))

;;; Finds whether the guess is a good approximation

(define (good-enough? guess x)
  (< (abs (- (mysq guess) x)) 0.001))

;;; Improves the guess

(define (improve-guess guess x)
  (average guess (/ x guess)))

;;;Mimics the primitive if special form
;;;A call to this procedure follows the normal applicative order
;;;that a procedure application follows. Please not that new-if is not a special form expression

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

;;; Testing on integers

;(new-if (= 2 3) 0 5)
;Value: 5

;(new-if (= 1 1) 0 5)
;Value: 0

;;; Testing on square root procedure

;;; The program quits at run time and returns the error below
;;; When the else-clause formal parameter in the new-if procedure is
;;; replaced by the argument that invloves a rescursive call, an infinite
;;; loop occurs. To evaluate a procedure application, all expressions must be evaluated. 
;;; In this case evaluating the second operator results in an endless loop.

;(mysquare 5)
;Aborting!: maximum recursion depth exceeded
;Start debugger? (y or n):n

