;;;Exercise 62: Union of ordered sets

(define (union-sets set1 set2)
  (if (or (null? set1)(null? set2))
      '()
      (let ((x1 (car set1))(x2 (car set2)))
	(cond ((= x1 x2)
	       (cons x1
		     (union-sets (cdr set1)
				 (cdr set2))))
	      ((> x1 x2)
	       (cons set2 set1))
	      ((< x1 x2)
	       (cons set1 set2))))))

;(union-sets (list 1 2 3)(list 4 5 6))
;Value 14: ((1 2 3) 4 5 6)

;(union-sets (list 5 6 7)(list 2 3 4))
;Value 15: ((2 3 4) 5 6 7)

;(union-sets (list 2 3 4)(list 5 7 8))
;Value 16: ((2 3 4) 5 7 8)

	 