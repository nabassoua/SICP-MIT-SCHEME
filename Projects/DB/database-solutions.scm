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

;;People aged 65 and over in the DB

(define aged-65-and-over-db
  (filter (lambda (x)
	    (> (age (age-struct x)) 65))
	  linear-test-data))

(define (names-of-people-over-65 my-data)
  (names-in-database my-data))


;;;Lab exercise 2

;;Test equality of 2 lists

(define (same-list2? lst1 lst2)
  (cond ((and (null? lst1) (null? lst2))
	      #t)
	((and (and (symbol? (car lst1))(symbol? (car lst2)))
	      (eq? (car lst1) (car lst2)))
	 (same-list2? (cdr lst1) (cdr lst2)))
	((and (equal? (car lst1) (car lst2))
	      (equal? (cdr lst1) (cdr lst2)))
	 (same-list2? (cdr lst1) (cdr lst2)))
	(else
	 #f)))

;(same-list2? '(alfa bravo alpha 2 5 7 9) '(alfa bravo alpha 2 5 7 9))
;Value: #t

;(same-list2? '(alfa bravo alpha 2 5 5 9) '(alfa bravo alpha 2 5 7 9))
;Value: #f

;;List of all associate professors in our DB


(define associate-profs-db 'TBD)

;;Names of all associate profs in the DB

(define (names-of-associate-profs db)
  (names-in-database db))

;;Average age of all associate profs in the DB

(define (age-of-associate-profs db)
  (average-age db))
 
;;lab exercise 5: test membership in the database

(define (member? list-of-words lst)
  (cond ((null? lst) #f)
	((same-list2? list-of-words (car (names-in-database lst)))
	 (filter (lambda(x)
		   (equal? (names (name-struct x)) list-of-words))
		 lst))
	(else
	 (member? list-of-words (cdr lst)))))

;(member? '(grimson eric) linear-test-data)
;Value 15: ((entry (name grimson eric) (age 31) (posn (dean))))




	      

