;;;;SICP Exercise 1.5: applicative vs normal order evaluation


;;;MIT/GNU Scheme uses applicative order evaluation.As a result,
;;;Evaluating the last expression ends up in an infinite loop
;;;since (p) evaluates to itself


;;;Had MIT/GNU Scheme used normal order evaluation,the last expression will 
;;;evaluates to 0 because under normal order expressions are not evaluated
;;;until they are needed

(define (p) (p))

(define (test x y)
  (if (= 0 x)
      0
      y))

(test 0 (p))


;Value: p

;Value: test