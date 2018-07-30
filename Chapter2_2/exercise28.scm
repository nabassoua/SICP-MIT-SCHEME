;;;fringe

(define (fringe mytree)
  (if (null? mytree)
      '()
      (let ((first (car mytree))
	    (rest (cdr mytree)))
	(append 
         ;;Always check if the car is a pair, if yes use recursion, else make it into a list
	 (if (pair? first)
	     (fringe first)
	     (list first))
	 (fringe rest)))))
	    
		   
(define (append_list list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append_list (cdr list1) list2))))

(define x (list (list 1 2) (list 3 4)))

;;;Incorrect output
;(fringe x)
;Value 15: ((1 2) (3 4))

;;;Correct output
;(fringe x)
;Value 14: (1 2 3 4)