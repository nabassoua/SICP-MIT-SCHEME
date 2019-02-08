;;;Union of sets

;;The procedures below are needed


(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? (car set) x) true)
	(else
	 (element-of-set? x (cdr set)))))

;(element-of-set? 2 (list 1 2 3 4))
;Value: #t

;(element-of-set? 0 (list 1 2 3 4))
;Value: #f

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

;(adjoin-set 3 (list 4 5 6))
;Value 14: (3 4 5 6)

	
(define (intersection-set set1 set2)
  (cond ((or (null? set1)(null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else
	 (intersection-set (cdr set1) set2))))

;(intersection-set (list 4 5 6 7)(list 6 7))
;Value 15: (6 7)

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((or (null? set1) (null? set2))'())
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else
	 (cons (car set1)
	       (union-set (cdr set1) set2)))))

;(union-set (list 4 5 6) (list 7 8 9))
;Value 20: (4 5 6 7 8 9)

