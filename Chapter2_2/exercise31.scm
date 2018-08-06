;;;tree-map abstraction

(define (tree-map f tree)
  (map (lambda(x)
	 (if (pair? x)
	     (tree-map f x)
	     (f x)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

(square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
;;First attempt returned the error message below. 
;Aborting!: maximum recursion depth exceeded
;Correct solution. You should alsways pass an element of the tree and not the entire tree itself
;Value 13: (1 (4 (9 16) 25) (36 49))