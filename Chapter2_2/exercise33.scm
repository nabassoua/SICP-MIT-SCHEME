;;;List manipulation as accumulations

(load "sequences.scm")

(define (mymap p sequence)
  (accumulate (lambda (x y) 
		(cons (p x)
		      y))
	      '()
	      sequence))

(define (myappend seq1 seq2)
  (accumulate cons seq2 seq1))
	

(define (mylength sequence)
  (accumulate (lambda (x y) (+ 1 y))
	      0
	      sequence))
	      
;(mymap square (list 3 9 10))
;Value 19: (9 81 100)

;(mylength (list 2 4 5 7 9 2))
;Value: 6

;(myappend (list 1 2) (list 3 4 5))
;Value 20: (3 4 5 1 2)

;Value: myappend

;(myappend (list 1 2) (list 3 4 5))
;Value 21: (1 2 3 4 5)


