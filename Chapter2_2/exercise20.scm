;;;;dotted-tail notation

(load "list-basics.scm")

(define (even? x)
  (= (remainder x 2) 0))

(define (odd? x)
  (= (remainder x 2) 1))


(define (filter-list a-list predicate?)
  (if (eq? a-list '())
      '()
      (let ((x (car a-list))
	    (y (cdr a-list)))
	(append (if (predicate? x)
		    (list x)
		    '())
		(filter-list y predicate?)))))


(define (same-parity x . y)
  (let ((parity ((even? x) even? odd?)))
    (append (list x) (filter-list y parity))))

;(define sample (list 1 2 3 4 5 6 7))

;(define sample2 (list 2 3 4 5 6 7)) 