;;;;Iterative version of the Exponentiation procedure

(define (iterative-exponentiation b n)
  (cond ((= n 0) 1)
	((even? n) (square (iterative-exponentiation b (/ n 2))))
	(else (* b (iterative-exponentiation b (- n 1))))))

;;;Finds if n is even

;;;Finds if n is even
;;;remainder is a primitive procedure

(define (even? n)
  (= (remainder n 2) 0))

;;;Examples

;(even? 7)
;Value: #f

;(even? 10)
;Value: #t


;(recursive-exponentiation 10 2)
;Value: 100

;(recursive-exponentiation 7 2)
;Value: 49