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

(define (simpson f a b n k)
  (* (* (sum f a (next-point a b k n) b)
     (coefficient k n))
     (/ (- b a) 3)))

;;;Test cases

(simpson cubes 0 1 100 1) 