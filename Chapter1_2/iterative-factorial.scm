;;;;Iterative version of the factorial procedure


(define (iterative-fact n)
  (iterative-fact-helper 1 1 n))

(define (iterative-fact-helper product counter n)
  (if (> counter n)
      product
      (iterative-fact-helper (* product counter) (+ counter 1) n)))

;;;Example
;(iterative-fact 6)
;Value: 720