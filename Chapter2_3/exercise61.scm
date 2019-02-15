;;;Exercise 61: Adjoin of ordered sets


(load "ordered-lists.scm")

(define (adjoin-set x set)
  (cond ((element-of-set? x set) set)
	((< x (car set))(cons x set))
	((= x (car set)) set)
	(else
	 (cons (car set)
	       (adjoin-set x (cdr set))))))

;(adjoin-set 27 (list 4 7 8 9 11 28))
;Value 23: (4 7 8 9 11 27 28)



	



