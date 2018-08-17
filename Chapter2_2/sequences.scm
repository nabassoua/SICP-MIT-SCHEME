;;;Map, filter and accumulate functions

;;;Computes the Fibonacci number given a number n

(define (fib-recursive n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+(fib-recursive (- n 1))
		(fib-recursive (- n 2))))))


;;;Create a list of even Fibonacci numbers

(define (fibs-even n)
  (define (fibs-k k)
    (if (> k n)
	'()
	(let ((fn (fib-recursive k)))
	  (if (even? fn)
	      (cons fn (fibs-k (+ k 1)))
	      (fibs-k (+ k 1))))))
  (fibs-k 0))
    
;(fibs-even 20)
;Value 16: (0 2 8 34 144 610 2584)

(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
	((not (pair? tree))
	 (if (odd? tree)
	     (square tree)
	     0))
	(else (+ (sum-odd-squares (car tree))
		 (sum-odd-squares (cdr tree))))))
	 
;(sum-odd-squares (list 1 5 7))
;Value: 75	     

(define (accumulate op ini sequence)
  (if (null? sequence)
      ini
      (op (car sequence)
	  (accumulate op ini (cdr sequence)))))

;(accumulate + 0 (list 1 2 3))
;Value: 6

(define (filter predicate? sequence)
  (cond ((null? sequence) '())
	((predicate? (car sequence))
	     (cons (car sequence)
		   (filter predicate? (cdr sequence))))
	(else
	 (filter predicate? (cdr sequence)))))

;(filter even? (list -2 5 7 4 128))
;Value 14: (-2 4 128)


(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low
	    (enumerate-interval (+ 1 low) high))))

;(enumerate-interval 1 5)
;Value 16: (1 2 3 4 5)

(define (enumerate-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (list tree))
	(else
	 (append (enumerate-tree (car tree))
		 (enumerate-tree (cdr tree))))))

;(enumerate-tree (list 1 (list 2 (list 4 5))))
;Value 17: (1 2 4 5)

(define (fibs-even2 n)
  (accumulate cons
	      '()
	      (filter even?
		      (map fib-recursive
			   (enumerate-interval 0 n)))))


;(fibs-even2 20)
;Value 14: (0 2 8 34 144 610 2584)


(define (sum-odd-squares2 tree)
  (accumulate +
	      0
	      (map square
		   (filter odd?
			   (enumerate-tree tree)))))


;(sum-odd-squares2 (list 7 3 6 1))
;Value: 59





