;;;Recursive exponentiation


(define (recursive-exponentiation b n)
  (if (= n 0)
       1
       (* b (recursive-exponentiation b (- n 1)))))

;;;Examples

;(recursive-exponentiation 2 2)
;Value: 4