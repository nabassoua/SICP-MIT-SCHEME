;;;Finds the sum of squares of the two largest numbers
;;;given three numbers

;;;Loads "squareiter.scm" to be able to use the square function

(load "squareiter.scm")

;;;Test to ensure the square function works

(mysq 4)


;;;Returns the sum of squares of the two largest numbers given three numbers

(define (sum-of-largest-two x y z) 
  (cond ((= (min x y z) x) (+ (mysq y) (mysq z)))
	((= (min x y z) y) (+ (mysq x) (mysq z)))
	((= (min x y z) z) (+ (mysq x) (mysq y)))))


;;; Examples

;(sum-of-largest-two 1 2 3)
;Value: 13

;(sum-of-largest-two 1 1 1)
;Value: 2

;(sum-of-largest-two 0 -3 5)
;Value: 25