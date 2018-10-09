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

;;Tests if the cube of a number x 
;;is between 10 and 10000

(define (included? x)
  (and (> (cube x) 10)(< (cube x) 10000)))

;(included? 2)
;Value: #f

;(included? 100)
;Value: #f

;(included? 10)
;Value: #t


(define (sum-some-cubes lst)
    (my-accumulate +
		   0
		   (map cube
			(my-filter included? lst))))

;(sum-some-cubes (list 1 2 10 11 100))
;Value: 2331

;;This procedure returns the copy of a given list

(define (copy lst)
  (if (null? lst)
      '()
      (cons (car lst)
	    (copy (cdr lst)))))

;(copy (list 1 23 4 5))
;Value 15: (1 23 4 5)

;;This procedure returns the copy of a list using the map function

(define (copy2 lst)
  (map (lambda(x)
	 (if (null? x)
	     '()
	     x))
       lst))

;(copy2 (list 1 23 4 5))
;Value 17: (1 23 4 5)

;; copy using filter

(define (copy3 lst)
  (my-filter (lambda(x)
	       (if (null? x)
		   '()
		   x))
	     lst))

;(copy3 (list 1 23 4 5))
;Value 18: (1 23 4 5)

;;copy using accumulate

(define (copy4 lst)
  (my-accumulate cons
		 '()
		 lst))

;(copy4 (list 1 23 4 5))
;Value 19: (1 23 4 5)




