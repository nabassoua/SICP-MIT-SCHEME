;;;Product procedure similar to sum

;;;Recursive version

(define (recursive-product  term a next b)
  (if (> a b)
      1
      (* (term a)
	 (recursive-product term (next a) next b))))

;;;Iterative version

(define (iterative-product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))

;;; Testing product of integers

(define (inc x)
  (+ x 1))

(define (identity x) x)


(define (product-ints a b)
  (recursive-product identity a inc b))

(define (product-ints2 a b)
  (iterative-product identity a inc b))


;(product-ints 1 4)
;Value: 24

;(product-ints2 1 4)
;Value: 24

;;;Factorial in terms of the product procedure

(define (factorial2 n)
  (define (identity x) x)
  (define (increment x)
    (+ x 1))
  (iterative-product identity 1 increment n))
