;;;;Key exercises from chapter 2 of SICP


;;;Exercise 20: dotted-tail notation

(define (even? x)
  (= 0 (remainder x 2)))

(define (odd? x)
  (= 1 (remainder x 2)))

(define (same-parity head . tail)   ;head is the first element and tail refers to a list
  (cons head
	(filter (if (even? head)    ;filter depending on the parity of the head
		    even?
		    odd?)
		tail)))

;(same-parity 1 2 3 4 5 6 7)
;Value 16: (1 3 5 7)

;(same-parity  2 3 4 5 6 7)
;Value 17: (2 4 6)

   
;;;Exercise 29

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

(define (total-weight mobile)
  (if (null? mobile)
      0
      (+ (total-weight (left-branch mobile))
	 (total-weight (right-branch mobile)))))

(define (balanced? mobile)
  (= (* (branch-length (left-branch mobile))
	(total-weight (left-branch mobile)))
     (* (branch-length (right-branch mobile))
	(total-weight (right-branch mobile)))))
     