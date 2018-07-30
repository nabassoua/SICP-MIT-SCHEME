;;;fringe

(define (fringe mytree)
  (if (null? mytree)
      '()
      (let ((first (car mytree))
	    (rest (cdr mytree)))
	(append (list first)
		(fringe rest)))))
	    
		   
(define (append_list list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append_list (cdr list1) list2))))

(define x (list (list 1 2) (list 3 4)))

;(fringe x)
;Value 15: ((1 2) (3 4))