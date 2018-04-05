;;;;Exercise 2: Line segments

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-point x y)
  (cons x y))

(define (start-segment p)
  (car p))

(define (end-segment p)
  (cdr p))


  

(define (make-segment a b)
  (cons a b))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


;;;Mid-point of a segment

(define (mid-point s)
  (make-point (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
	(/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)))
  
;;;Tests for midpoint

(print-point (mid-point (make-segment point-a point-b)))

;(4,6)
;Unspecified return value




;;;Tests

(define point-a (make-segment 2 4))
(define point-b (make-segment 6 8))
	   

;(2,4)
;Unspecified return value

;(print-point point-b)

;(6,8)
;Unspecified return value

;;;Tests to print line segments

