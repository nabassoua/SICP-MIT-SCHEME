;;;;Exercise 10: Ackerman function

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

;;;Testing Ackerman function
;;;To do these calculations manually, follow "Applicative order"
;;;And doing so will yield recursive processes in each case


;Value: a

;(A 1 10)
;Value: 1024

;(A 2 4)
;Value: 65536

;(A 3 3)
;Value: 65536

(define (g n)
  (A 1 n))

;;;Trying a few values to identify what might the mathematical definition
;;;for the function computed by the procedure g above given positive integers value of n
;;;We observe that as n increases by 1 unit, the value doubles from the previous one
;;;For example, when n=2, g=4 and increasing n by 1 unit gives n=3 and g=2*4=8


;(g 1)
;Value: 2

;(g 2)
;Value: 4

;(g 3)
;Value: 8

;(g 4)
;Value: 16

;(g 5)
;Value: 32

(define (f n)
  (A 0 n))

;;;Trying a few values to identify what might the mathematical definition
;;;for the function computed by the procedure f above given positive integers value of n


(define (h n)
  (A 2 n))

;;;Trying a few values to identify what might the mathematical definition
;;;for the function computed by the procedure h above given positive integers value of n

(define (k n)
  (* 5 5))

;;;Trying a few values to identify what might the mathematical definition
;;;for the function computed by the procedure k above given positive integers value of n