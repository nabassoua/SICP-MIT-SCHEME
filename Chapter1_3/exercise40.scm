;;;Exercise 40: cubic procedure


(load "general-procedures2.scm")

(define (cubic a b c)
  (lambda (x)(+ (* x x x)
		(* a (* x x))
		(* b x)
		c)))
		