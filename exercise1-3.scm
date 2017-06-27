;;;;SICP Exercise 1.3: Compute sum of squares of two largest numbers given three numbers


(define (sum-of-square-largest-two-numbers x y z)
  (cond ( (= (min x y z) x)(+ (square y)(square z)))
	( (= (min x y z) y)(+ (square x)(square z)))
	( (= (min x y z) z)(+ (square x)(square y)))))

(define (square x)(* x x))
  
;;;Below are the result of test cases

;Value: sum-of-square-largest-two-numbers

;(sum-of-square-largest-two-numbers 4 5 6)
;Value: 61

;(sum-of-square-largest-two-numbers -5 8 8)
;Value: 128

;(sum-of-square-largest-two-numbers -5 -10 -2)
;Value: 29






