;;;equal? procedure


(define (equal? a b)
  (if (and (pair? a) (pair? b)) 
      (and (equal? (car a) (car b))
	   (equal? (cdr a) (cdr b)))
      (eq? a b)))

;(equal? '(this is a list) '(this a list))
;Value: #f

;(equal? '(this is a list) '(this is a list))
;Value: #t





