;;;Database manipulation

(load "database.scm")
(load "ch2-key-exercises.scm")

;;;Lab exercise 1

;;collapse the sub-lists into 1 list

(define single-list (fringe linear-test-data))
   

(define (length lst)
  (if (null? lst)
      0
      (+ 1 (length (cdr lst)))))
				     

(define (average-age db)
  (/ (accumulate (lambda (x y)
		   (+ (age (age-struct x)) y))
		 0
		 db)
     (accumulate (lambda (x y)
		   (+ 1.0 y))
		 0
		 db)))

;(average-age linear-test-data)
;Value: 60.76111111111111

(define (names-in-database db)
  (map (lambda(x)
	 (names (name-struct x)))
       db))
(define (names-of-people-over-65 my-data)
  TBD)