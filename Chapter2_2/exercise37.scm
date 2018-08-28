;;;;Exercise 37: Matrix operations

(load "exercise36.scm")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;(dot-product (list 1 2 3)(list 4 5 6))
;Value: 32

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

;(matrix-*-vector (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)) (list 1 2 3 4))
;Value 15: (30 56 80)

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

;(matrix-*-matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9))(list (list 1 4 3 3) (list 4 7 6 6) (list 6 9 8 9)))
;Value 17: ((27 45 39 42) (60 105 90 96) (82 145 124 132))