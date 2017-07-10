;;;;Miscellaneous exercises related to SICP section 1.1


(define p1
  (lambda (x y)
    (+ (p2 x y) (p3 x y))))

(define p2
  (lambda (z w)
    (* z w)))

(define p3
  (lambda (a b)
    (+ (p2 a) (p2 b))))

(define fold
  (lambda (x y)
    (* (spindle x)
       (+ (mutilate x)
	  (spindle x)))))

(define spindle
  (lambda (w) (* w w)))

(define mutilate
  (lambda (z)
    (+ (spindle z) z)))


(define m 1)

;;; Procedure to compute factorial of a number n

(define fact
  (lambda (n)
    (if (= n 0)		
	m
	(* n (fact (- n 1))))))


;;;Procedure to compute the combinations of n objects taken k at a time

(define combination (lambda (n k)
		     (/ (fact n)
			(* (fact k)
			   (fact (- n k))))))




;;;Procedure to compute the cube of a number n

(define my-cube
  (lambda(x)
    (* x x x)))

;;;Procedure to compute sum of cubes of two numbers x and y

(define sum-of-cubes
  (lambda (x y)
    (+ (my-cube x)(my-cube y))))


;;;;Procedure to find largest number given three numbers

(define biggest-of-three
  (lambda(x y z)
    (cond ((> x y)(if (> x z) x z))
	  (else (if (> y z) y z)))))


;;; Procedure that computes cube of the largest number

(define cube-of-largest
  (lambda(x y z)
    (my-cube (biggest-of-three x y z))))


;;; Testing some our routines

;(sum-of-cubes 9 9)
;Value: 1458

;Value: cube-of-largest

;(cube-of-largest 4 5 6)
;Value: 216


;;;;Routine to evaluate an arbitrary third degree polynomial


(define (my-square x)
  (* x x))

(define third-degree-polynomial
  (lambda(x a0 a1 a2 a3)
    (+ a0
       (* a1 x)
       (* a2 (my-square x))
       (* a3 (my-cube x)))))



;(third-degree-polynomial 0.5 1 2 3 4)
;Value: 3.25