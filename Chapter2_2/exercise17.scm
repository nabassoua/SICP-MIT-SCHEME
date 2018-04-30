;;;;Exercise 17: Finding the last item in a list and return it as a list

(load "list-basics.scm")

(define (last-pair a-list)
  (define (last-pair-iter a n)
    (if (= n (- (length a) 1))
	(list (list-refs a n))
	(last-pair-iter a (+ 1 n))))
  (last-pair-iter a-list 0))


