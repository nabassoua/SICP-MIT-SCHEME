;;;;Recursive version of the Fibonacci sequence

;;;Computes the Fibonacci number given a number n

(define (fib-recursive n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+(fib-recursive (- n 1))
		(fib-recursive (- n 2))))))

;;;Examples of Fibonacci numbers

;(fib-recursive 2)
;Value: 1

;(fib-recursive 3)
;Value: 2

;(fib-recursive 11)
;Value: 89
