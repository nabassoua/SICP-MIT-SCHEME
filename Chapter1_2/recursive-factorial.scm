;;;;Recursive-version of a routine to compute the factorial of a number n


(define (recursive-fact n)
  (if (= n 0)
      1
      (* n (recursive-fact (- n 1)))))

;;;Example
;(recursive-fact 3)
;Value: 6