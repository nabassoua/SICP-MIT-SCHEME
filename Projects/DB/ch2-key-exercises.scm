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

(define mobile-foo (make-mobile (make-branch 2 5)
				(make-branch 5 6)))

(define mobile-foo2 (make-mobile (make-branch 2 5)
				 (make-branch 2 5)))


(define (total-weight mobile)
  (cond ((null? mobile) 0)
	((not (pair? mobile)) mobile)
	(else
	 (+ (total-weight (branch-structure (left-branch mobile)))
	    (total-weight (branch-structure (right-branch mobile)))))))

;(total-weight mobile-foo)
;Value: 11

(define (balanced? mobile)
  (cond ((null? mobile) true)
	((not (pair? mobile)) false)
	(else 
	 (and 
	  ( = (* (branch-length (left-branch mobile))
		 (total-weight (branch-structure (left-branch mobile))))
	      (* (branch-length (right-branch mobile))
		 (total-weight (branch-structure (right-branch mobile)))))
	  (balanced? (branch-structure (left-branch mobile)))
	  (balanced? (branch-structure (right-branch mobile)))))))

(balanced? mobile-foo)
;Value: #f

;;;Most important utilities so far     


(define (my-accumulate op init items)
  (if (null? items)
      '()
      (op (car items)
	  (my-accumulate op init (cdr items)))))

(define (my-filter predicate? items)
  (cond ((null? items) '())
	((predicate? (car items))
	 (cons (car items)
	       (my-filter predicate? (cdr items))))
	(else
	 (my-filter predicate? (cdr items)))))

(define list-test (list 1 2 3 4 5))

;(my-filter odd? list-test)
;Value 16: (1 3 5)

;(my-filter even? list-test)
;Value 17: (2 4)

(define (my-map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
	    (my-map proc (cdr items)))))


;;;Exercise 26

(define x (list 1 2 3))
(define y (list 4 5 6))

;(append x y)
;Value 14: (1 2 3 4 5 6)

;(cons x y)
;Value 15: ((1 2 3) 4 5 6)

;(list x y)
;Value 16: ((1 2 3) (4 5 6))

;;;Exercise 17

(define (last-pair lst)
  (if (null? (cdr lst))
      (list (car lst))
      (last-pair (cdr lst))))

;(last-pair (list 1 4 9 16 25))
;Value 24: (25)


;;;Exercise 18: Reverse

(define (reverse lst)
  (if (null? lst)
      '()
      (append (reverse (cdr lst))
	      (list (car lst)))))

;(reverse (list 1 4 9 16 25))
;Value 14: (25 16 9 4 1)

      


