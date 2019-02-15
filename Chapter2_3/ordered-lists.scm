;;;Ordered lists operations

(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (car set)) true)
	((< x (car set)) false)
	(else
	 (element-of-set? x (cdr set)))))

;(element-of-set? 2 (list 1 2 3 4))
;Value: #t

(define (intersection-of-sets set1 set2)
  (if (or (null? set1)(null? set2))
      '()
      (let ((x1 (car set1))(x2 (car set2)))
	(cond ((= x1 x2) (cons x1
			       (intersection-of-sets (cdr set1)
						     (cdr set2))))
	      ((< x1 x2) (intersection-of-sets (cdr set1)
					       set2))
	      ((< x2 x1) (intersection-of-sets set1
					       (cdr set2)))))))
;(intersection-of-sets (list 2 3 4)(list 4 5))
;Value 15: (4)
	      
