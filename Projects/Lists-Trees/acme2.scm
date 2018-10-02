;;;Solutions to the exercises in the attached problem set

;;;Quick review: reproducing map,filter and accumulate from memory

(define (my-map fct seq)
  (if (null? seq)
      '()
      (cons (fct (car seq))
	    (my-map fct (cdr seq)))))

;(my-map square (list 1 2 3 4))
;Value 14: (1 4 9 16)

(define (my-filter predicate? seq)
  (cond ((null? seq) '())
	((predicate? (car seq))(cons (car seq) (my-filter predicate? (cdr seq))))
	(else 
	 (my-filter predicate? (cdr seq)))))

;(my-filter even? (list 1 2 4 5 7))
;Value 15: (2 4)
      
(define (my-accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
	  (my-accumulate op initial (cdr seq)))))

;(my-accumulate + 0 (list 1 2 3 5 7))
;Value: 18

;(my-accumulate * 1 (list 1 2 3 5 7))
;Value: 210

;(my-accumulate cons '() (list 1 2 3 5 7))
;Value 18: (1 2 3 5 7)


(define (cube x)
  (* x x x))

(define (sum-some-cubes lst)
  (let ((value (cube (car lst))))
    (my_accumulate +
		   0
		   (map cube
			(my-filter (and (> value 10) (< value 10000)) lst)))))
		    

