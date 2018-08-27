;;;Count-leaves using accumulation

(load "sequences.scm")

(define (count-leaves t)
  (accumulate +
	      0
	      (map (lambda (x)
		      1)
		   (enumerate-tree t))))

;(count-leaves (list 1 2 3 4))
;Value: 4