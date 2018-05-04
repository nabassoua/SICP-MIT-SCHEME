;;;;Exercise 21

(define (square-list items)
  (if (null? items)
      '()
      (cons (square (car items))
	    (square-list (cdr items)))))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items))


;(square-list2 (list 1 2 3 4))
;Value 18: (1 4 9 16)

;(square-list2 (list 1 2 3 4))
;Value 19: (1 4 9 16)





