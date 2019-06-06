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
      init
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

;exercise 19: Deep Reverse      

(define (deep-reverse lst)
  (if (null? lst)
      '()
      (append (deep-reverse (reverse (cdr lst)))
	      (list (reverse (car lst))))))

(define z (list (list 1 2) (list 3 4)))

;exercise 28: fringe

(define (fringe tree)
  (cond ((null? tree) '())
	((not (pair? tree))
	 (list tree))
	(else
	 (append (fringe (car tree))
		 (fringe (cdr tree))))))

(define w (list (list 1 2) (list 3 4)))
	 
;;Exercise 37: Matrix operations


(define (dot-product v w)
  (my-accumulate + 0 (map * v w)))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (my-accumulate op init (map car seqs))
	    (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define v (list 1 2 3 4))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

;(matrix-*-vector m v)
;Value 16: (30 56 80)

(define (transpose mat)
  (accumulate-n cons '() mat))

;(transpose m)
;Value 19: ((1 4 6) (2 5 7) (3 6 8) (4 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda(x) (dot-product cols x)) m)))


;;Exercise 35

(define (my-count-leaves-tree t)
  (my-accumulate +
		 0
		 (map (lambda (x) 1) (fringe-tree t))))

(define a-tree (list 1
		     (list 2 (list 3 4) 5)
		     (list 6 7)))

;(my-count-leaves-tree s)
;Value: 12


;;Tree manipulation utilities

(define tree-test (cons (list 1 2) (list 3 4)))

(define (accumulate-tree tree term combiner null-value)
  (cond ((null? tree) null-value)
	((not (pair? tree))
	 (term tree))
	(else 
	 (combiner (accumulate-tree (car tree) term combiner null-value)
		   (accumulate-tree (cdr tree) term combiner null-value)))))

(define (sum-fringe tree)
  (accumulate-tree tree (lambda (x) x) + 0))

;(sum-fringe tree-test)
;Value: 10

;(sum-fringe a-tree)
;Value: 28

(define (count-leaves-tree tree)
  (accumulate-tree tree (lambda(x) 1) + 0))


;(count-leaves-tree tree-test)
;Value: 4

;(count-leaves-tree a-tree)
;Value: 7

(define (fringe-tree tree)
  (accumulate-tree tree (lambda (x) (list x)) append '()))


(define (fringe-tree2 tree)
  (accumulate-tree tree (lambda (x) (list x)) (lambda (x y) (append x y)) '()))

;(fringe-tree2 a-tree)
;Value 16: (1 2 3 4 5 6 7)

(define (map-tree op tree)
  (accumulate-tree tree (lambda (x) (op x)) cons '()))

;(map-tree + a-tree)
;Value 17: (1 (2 (3 4) 5) (6 7))

(define (scale-tree tree factor)
  (map-tree (lambda (x) (* x factor)) tree))

;(scale-tree a-tree 5)
;Value 18: (5 (10 (15 20) 25) (30 35))


