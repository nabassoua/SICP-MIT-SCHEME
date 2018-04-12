;;;Exercise9

(load "exercise7.scm")
(load "exercise8.scm")

(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(define (sum-width x y)
  (width (add-interval x y)))

(define (sub-width x y)
  (width (add-interval x y)))

(define (mult-width x y)
  (width (mul-interval x y)))

(define (div-width x y)
  (width (div-interval x y)))



;;;Test cases

(define interval-a (make-interval 20 22))
(define interval-b (make-interval 37 43))

;(mult-width interval-a interval-b)
;Value: 103

;Value: div-width

;(div-width interval-a interval-b)
;Value: .0647391577624136