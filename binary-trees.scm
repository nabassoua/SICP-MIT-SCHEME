;;;Binary Tree


(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (entry set)) true)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define simple-tree (make-tree 2
			       (make-tree 1 '() '())
			       (make-tree 5
					  (make-tree 3 '() '())
					  (make-tree 6 '() '()))))

;Value 14: (2 (1 () ()) (5 (3 () ()) (6 () ())))

;(element-of-set? 3 simple-tree)
;Value: #t

;(element-of-set? 9 simple-tree)
;Value: #f


			       
			       