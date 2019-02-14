;;;Exercise 60: Set operations with duplicates allowed


(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? (car set) x) true)
	(else
	 (element-of-set? x (cdr set)))))

;(element-of-set? 2 (list 1 2 2 4))


(define (adjoin-set x set)
  (if (element-of-set? x set)
      (cons x set)
      (adjoin-set x (cdr set))))

;(adjoin-set 3 (list 3 4 5 6))
;Value 15: (3 3 4 5 6)
	
(define (intersection-set set1 set2)
  (cond ((or (null? set1)(null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else
	 (intersection-set (cdr set1) set2))))


;(intersection-set (list 4 5 6 7)(list 6 6 7))
;Value 16: (6 7)

;(intersection-set (list 4 5 )(list 5 5 7))
;Value 17: (5)


(define (union-set set1 set2)
  (append set1 set2))


;(union-set (list 4 5 6) (list 7 7 8 9))
;Value 18: (4 5 6 7 7 8 9)
