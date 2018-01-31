;;;Integration by Simpson's rule

(load "hop1.scm")

(define (coefficient k n)
  (cond ((= k 0) 1)
	((= k n) 1)
	((even? k) 2)
	(else 4)))

(define (even? k)
  (= (remainder k 2) 0))

(define (next-point a b k n)
  (cond ((= n 0) a)
	((= n k) b)
	(else (+ k (/ (- b a) n)))))

(define (simpson f a b n )
  (define h (/ (- b a) n))
  (define (y-of-k k) (f (+ a (* k h))))
  (define (increment x) (+ x 1)) 
  (define (even? k)
    (= (remainder k 2) 0))
  (define (term k)
    (* (cond ((= k 0) 1)
	  ((= k n) 1)
	  ((even? k) 2)
	  (else 4)) (y-of-k k)))
  (* (/ h 3)  (sum term 0 increment n)))
		  
			   
;(simpson cubes 0 1 100.0)
;Value: .24999999999999992

;(simpson cubes 0 1 1000.0)
;Value: .2500000000000003			   
		  
     
     




