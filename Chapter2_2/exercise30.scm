;;;Squaring the elements of a tree

(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree))
	(else
	 (cons (square-tree (car tree))
	       (square-tree (cdr tree))))))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;Error message
;The object (6 7), passed as the first argument to integer-zero?, is not the correct type.
;After fixing error we get the correct output
;Value 13: (1 (4 (9 16) 25) (36 49))

(define (square-tree2 tree)
  (map (lambda(x)
	 (if (pair? x)
	     (square-tree2 x)
	     (square x)))
       tree))

;(square-tree2 (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;Value 15: (1 (4 (9 16) 25) (36 49))

