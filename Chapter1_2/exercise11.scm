;;;;Recursive version

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
	       (* 2 (f-recursive (- n 2)))
	       (* 3 (f-recursive (- n 3))))))

;;;Sample values

;Value: f-recursive

;(f-recursive 3)
;Value: 4

;(f-recursive 6)
;Value: 59

;(f-recursive 5)
;Value: 25


;;;;Iterative version of the same function 

;;;Observe that f(0)=0, f(1)=1, f(2)=2.
;;;Set initial conditions to c=f(0)=0, b=f(1)=1, a=f(2)=2
;;;For example, f(3)=f(2)+2f(1)+3f(3)=a + 2b +3c= 2 + 2 +0= 4

(define (f-iterative n)
  (f-helper 2 1 0 n))

(define (f-helper a b c count)
  (if (= count 0)
      c
      (f-helper (+ a (* 2 b) (* 3 c)) a b (- count 1))))

;Value: f-iterative

;Value: f-helper

;(f-iterative 3)
;Value: 4

;(f-iterative 4)
;Value: 11

;(f-iterative 5)
;Value: 25