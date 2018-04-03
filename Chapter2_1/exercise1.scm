;;;Exercise 1

(load "rational-operations.scm")

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
	(cons ((/ (* -1 n) g) (/ (* -1 d) g))
	(cons ((/ n g) (/ d g)))))))


(define test (make-rat 1 -2))

(print-rat test)



