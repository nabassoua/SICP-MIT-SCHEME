;;;;SICP Exercise 1.4: Behavior of a specific procedure


(define (a-plus-abs-b a b)
  ((if (> b 0)+ -)a b))

;;;The above procedure applies the appropriate addition or substraction based upon the sign of the argument b

#|
;Value: a-plus-abs-b
(a-plus-abs-b 5 3)
;Value: 8

(a-plus-abs-b 3 -1)
;Value: 4
|#