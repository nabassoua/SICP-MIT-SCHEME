;;;Section 1.3 code on higher order procedures

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))  

(define (inc n)
  (+ n 1))

(define (sum-cubes a b)
  (sum cubes a inc  b)) 

(define (cubes x)
  (* x x x))

(define (identity x)
  x)

(define (new-sum-ints a b)
  (sum identity a inc b))


(define (sum-integrals f a b dx)
  (define (add-next x) (+ x dx))
  (* dx (sum f (+ a (/ dx 2)) add-next b)))

(define (pie-sum a b)
  (define (add-next x) (+ x 4))
  (define (term a) (/ 1.0 (* a (+ a 2))))
  (sum term a add-next b))

;;;Test cases

;(sum-cubes 3 3)
;Value: 27

;(sum-cubes 1 10)
;Value: 3025

;Value: sum-integrals





