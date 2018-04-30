;;;;Basic list manipulation

(define (list-refs items n)
  (if (= n 0)
      (car items)
      (list-refs (cdr items) (- n 1))))

(define four-items (list 8 3 -1 0))

;(list-refs four-items 2)
;Value: -1

(define (length items)
  (define (length-iter a-list count)
    (if (null? a-list)
	count
	(length-iter (cdr a-list) (+ 1 count))))
  (length-iter items 0))

;(length four-items)
;Value: 4
 
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define three-items (list 0 0 -5))
      
      
      