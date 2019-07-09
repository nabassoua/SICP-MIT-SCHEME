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

;;Lab exercise 2: list of all associate professors in our DB


(define (associate-profs-db db)
  (filter (lambda (x)
	    (same-list2? '(associate professor)
			 (position (posn-struct x))))
	  db))

;;Names of all associate profs in the DB

(define (names-of-associate-profs db)
  (names-in-database (associate-profs-db db)))

;(names-of-associate-profs linear-test-data)
;Value 17: ((xiong hal) (jones jill) (wells abraham) (czerwinski martin) (chapin joanne) (tserng berthold) (miller eric) (mikkelson hal) (abelson berthold) (jones eric) (dally chris) (vaneyk gerry) (vaneyk hal) (horn joanne) (mikkelson steven) (housinger steven) (miller berthold) (stein jill) (stark lynn) (czerwinski steven) (miller rebecca) (schlecht gerry) (tserng ellen) (grimson peter) (maritime albert) (jacknis andrew) (smith yale) (maritime bill) (stein peter) (meyer sandy) (czerwinski sandy) (stein yale) (abelson sandy) (jordan andrew) (jacknis hal) (jacknis john) (maritime paul) (abelson abraham) (beebee andrew) (xiong joanne))




;;Average age of all associate profs in the DB

(define (age-of-associate-profs db)
  (average-age (associate-profs-db db)))

;(age-of-associate-profs linear-test-data)
;Value: 63.7

;;Lab exercise 3: Create database entries

(define my-entry-1 (make-struct '(mike prudence) '33 '(assistant professor)))
(define my-entry-2 (make-struct '(ali beast) '39 '(associate professor)))
(define my-entry-3 (make-struct '(albert king) '67 '(associate professor)))



  
(define my-db
  (list
   (make-struct (make-name 'mike 'prudence)
		(make-age '33)
		(make-posn '(assistant professor)))
   (make-struct (make-name 'bruce 'spencer)
		(make-age '39)
		(make-posn '(assistant professor)))
   (make-struct (make-name 'mike 'prudence)
		(make-age '71)
		(make-posn '(associate professor)))))

;Value 18: ((entry (name mike prudence) (age 33) (posn (assistant professor))) (entry (name bruce spencer) (age 39) (posn (assistant professor))) (entry (name mike prudence) (age 71) (posn (associate professor))))


;;Copy of linear test DB

(define copy-linear-test-data linear-test-data)

(define my-db2
  (list
   (make-struct (make-name 'ali 'prudence)
		(make-age '38)
		(make-posn '(assistant professor)))
   (make-struct (make-name 'paul 'li)
		(make-age '30)
		(make-posn '(assistant professor)))
   (make-struct (make-name 'laue 'po)
		(make-age '79)
		(make-posn '(associate professor)))))

 
;;lab exercise 5: test membership in the database

(define (member2? list-of-words lst)
  (cond ((null? lst) #f)
	((same-list2? list-of-words (car (names-in-database lst)))
	 (filter (lambda(x)
		   (equal? (names (name-struct x)) list-of-words))
		 lst))
	(else
	 (member? list-of-words (cdr lst)))))

;(member2? '(grimson eric) linear-test-data)
;Value 15: ((entry (name grimson eric) (age 31) (posn (dean))))


(define (merge-db db1 db2)
  (cond ((null? db1) db2)
	((null? db2) db1)
	((or (null? db1)(null? db2)) '())
	((member2? (car db1) db2)
	 (merge-db (cdr db2) db1)) 
	(else
	 (cons (car db1)
	       (merge-db (cdr db1)(cdr db2))))))

;(pretty-print (merge-db my-db my-db2))
;((entry (name mike prudence) (age 33) (posn (assistant professor))) (entry (name bruce spencer) (age 39) (posn (assistant professor)))
                                                                    (entry (name mike prudence) (age 71) (posn (associate professor))))
	      


