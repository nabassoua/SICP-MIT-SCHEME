;;;Computes elements of Pascal triangle


;;;Pascal(j,n) represents an element at the jth entry in the nth row


(define (pascal j n)
  (cond ((= j 0) 1)
	((= j n) 1)
	(else (+ (pascal (- j 1) (- n 1))
		 (pascal j (- n 1))))))

;;;Examples

;(pascal 2 2)
;Value: 1

;(pascal 3 2)
;Aborting!: maximum recursion depth exceeded

;(pascal 1 2)
;Value: 2

;(pascal 3 4)
;Value: 4

;(pascal 2 4)
;Value: 6