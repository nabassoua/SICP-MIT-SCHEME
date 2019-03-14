;;;;Key exercises from chapter 2 of SICP


;;;Exercise 20: dotted-tail notation

(define (even? x)
  (= 0 (remainder x 2)))

(define (odd? x)
  (= 1 (remainder x 2)))

(define (same-parity head . tail)   ;head is the first element and tail refers to a list
  (cons head
	(filter (if (even? head)    ;filter depending on the parity of the head
		    even?
		    odd?)
		tail)))

;(same-parity 1 2 3 4 5 6 7)
;Value 16: (1 3 5 7)

;(same-parity  2 3 4 5 6 7)
;Value 17: (2 4 6)

   

