;;;Fold-left and Fold-right procedures 


(define (fold-left op initial seq)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial seq))

;Value: fold-left

;(fold-right / 1 (list 1 2 3))
;Value: 3/2

;(fold-left / 1 (list 1 2 3))
;Value: 1/6

;(fold-left list '() (list 1 2 3))
;Value 14: (((() 1) 2) 3)

;(fold-right list '() (list 1 2 3))
;Value 15: (1 (2 (3 ())))

