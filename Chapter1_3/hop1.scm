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

;;;Test cases

;(sum-cubes 3 3)
;Value: 27

;(sum-cubes 1 10)
;Value: 3025