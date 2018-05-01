;;;;Exercise 18: Reverse the elements in a list 

(load "exercise17.scm")

(define (reverse a-list)
  (define (reverse-iter a n)
    (if (= n 0)
	(list (list-refs a n))
	(reverse-iter a (- (length a) 1))))
  (reverse-iter a-list (- (length a-list) 1)))

(define sample-list (list 1 4 9 16 25))
