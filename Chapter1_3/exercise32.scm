;;;; A more general version of sum and product

(define (recursive-accumulate combiner null-value  term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
	 (recursive-accumulate combiner null-value term (next a) next b))))


(define (iterative-accumulate combiner null-value  term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))))
  (iter a null-value))  

(define (inc x)
  (+ x 1))

(define (identity x) x)

;;;Test with sum of integers

;(recursive-accumulate + 0 identity 1 inc 5)
;Value: 15

;(iterative-accumulate + 0 identity 1 inc 5)
;Value: 15

;;;Test with product of integers

;(iterative-accumulate * 1 identity 1 inc 5)
;Value: 120