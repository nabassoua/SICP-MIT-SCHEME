;;;;Exercise 63

(load "binary-trees.scm")

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (left-branch tree)
					  (cons (entry tree)
						(copy-to-list (right-branch tree)
							      result-list)))))))
  (copy-to-list tree '()))

;;;tree->list-1 follows a resursive process while tree->list-2 follows an iterative process
;;;The procedures do not produce the same resut for every tree (see examples below)
;;;tree->list-1 grows more slowly

;;;Examples

(define my-tree-1 (make-tree 7
			     (make-tree 3
					(make-tree 1 '() '())
					(make-tree 5 '() '()))
			     (make-tree 9
					'()
					(make-tree 11 '() '()))))

(define my-tree-2 (make-tree 3
			     (make-tree 1 '() '())
			     (make-tree 7
					(make-tree 5 '() '())
					(make-tree 9
						   '()
						   (make-tree 11 '() '())))))
			     
			     
			
			

(define my-tree-3 (make-tree 5
			     (make-tree 3
					(make-tree 1 '() '())
					'())
			     (make-tree 9
					(make-tree 7 '() '())
					(make-tree 11 '() '()))))

;my-tree-1
;Value 13: (7 (3 (1 () ()) (5 () ())) (9 () (11 () ())))

;my-tree-2
;Value 14: (3 (1 () ()) (7 (5 () ()) (9 () (11 () ()))))

;my-tree-3
;Value 15: (5 (3 (1 () ()) ()) (9 (7 () ()) (11 () ())))




;(tree->list-1 my-tree-1)
;Value 14: (1 3 5 7 9 11)

;(tree->list-1 my-tree-2)
;Value 15: (1 3 5 7 9 11)

;(tree->list-1 my-tree-3)
;Value 16: (1 3 5 7 9 11)

;(tree->list-2 my-tree-1)
;Value 17: (1 1 3 1 1 3 5 5 7 1 1 3 1 1 3 5 5 7 9 9 11 11)

;(tree->list-2 my-tree-2)
;Value 18: (1 1 3 1 1 3 5 5 7 5 5 7 9 9 11 11)

;(tree->list-2 my-tree-3)
;Value 19: (1 1 3 1 1 3 5 1 1 3 1 1 3 5 7 7 9 7 7 9 11 11)


