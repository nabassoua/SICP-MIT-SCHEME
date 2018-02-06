;;;;Iterative version of sum

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (+ (term a) result))))
  (iter a 0))  

(define (inc x)
  (+ x 1))

(define (identity x) x)

;;;Testing our Iteratie sum with the Identity function

(define (sum-ints a b)
  (sum identity a inc b))

;;;Test case

;(sum-ints  1  5)
;Value: 15