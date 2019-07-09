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
	((same-list2? (car db1) (car db2))
	 (cons (car db1)
	       (merge-db (cdr db1) (cdr db2))))
	(else
	 (merge-db (cdr db1)(cdr db2)))))

	      
;(merge-db my-db copy-linear-test-data)
;Value 15: ((entry (name stein ellen) (age 80) (posn (administrative assistant))) (entry (name abelson calista) (age 74) (posn (assistant professor))) (entry (name grimson berthold) (age 55) (posn (dean))) (entry (name xiong christiana) (age 64) (posn (assistant professor))) (entry (name toutet jim) (age 39) (posn (dean))) (entry (name tait albert) (age 85) (posn (dean))) (entry (name jones gerry) (age 46) (posn (administrative assistant))) (entry (name grimson steven) (age 75) (posn (dean))) (entry (name dally arthur) (age 99) (posn (assistant professor))) (entry (name jones jill) (age 57) (posn (associate professor))) (entry (name wells abraham) (age 38) (posn (associate professor))) (entry (name czerwinski martin) (age 65) (posn (associate professor))) (entry (name toutet andrew) (age 62) (posn (assistant professor))) (entry (name brown calista) (age 93) (posn (administrative assistant))) (entry (name wells calista) (age 35) (posn (assistant professor))) (entry (name chapin joanne) (age 65) (posn (associate professor))) (entry (name jones albert) (age 27) (posn (dean))) (entry (name wells ellen) (age 57) (posn (assistant professor))) (entry (name rodriguez jill) (age 33) (posn (dean))) (entry (name stark jim) (age 45) (posn (administrative assistant))) (entry (name sussman gerry) (age 59) (posn (assistant professor))) (entry (name vaneyk peter) (age 51) (posn (assistant professor))) (entry (name smith eric) (age 96) (posn (administrative assistant))) (entry (name tserng berthold) (age 70) (posn (associate professor))) (entry (name xiong michael) (age 50) (posn (professor))) (entry (name housinger yale) (age 72) (posn (administrative assistant))) (entry (name tait chris) (age 86) (posn (professor))) (entry (name wells yale) (age 86) (posn (administrative assistant))) (entry (name jones andrew) (age 67) (posn (professor))) (entry (name vaneyk joanne) (age 73) (posn (professor))) (entry (name toutet jill) (age 91) (posn (administrative assistant))) (entry (name vaneyk sandy) (age 31) (posn (dean))) (entry (name meyer peter) (age 53) (posn (administrative assistant))) (entry (name abelson lynn) (age 83) (posn (assistant professor))) (entry (name jacknis arthur) (age 67) (posn (dean))) (entry (name sussman ellen) (age 70) (posn (administrative assistant))) (entry (name sussman hal) (age 42) (posn (assistant professor))) (entry (name vaneyk steven) (age 56) (posn (assistant professor))) (entry (name tserng jim) (age 49) (posn (assistant professor))) (entry (name grimson john) (age 65) (posn (dean))) (entry (name miller eric) (age 60) (posn (associate professor))) (entry (name jones steven) (age 58) (posn (assistant professor))) (entry (name mikkelson hal) (age 78) (posn (associate professor))) (entry (name abelson berthold) (age 25) (posn (associate professor))) (entry (name smith steven) (age 50) (posn (administrative assistant))) (entry (name jones eric) (age 50) (posn (associate professor))) (entry (name housinger hal) (age 25) (posn (dean))) (entry (name housinger abraham) (age 88) (posn (professor))) (entry (name maritime sandy) (age 87) (posn (assistant professor))) (entry (name sussman yale) (age 94) (posn (professor))) (entry (name dally chris) (age 76) (posn (associate professor))) (entry (name grimson paul) (age 37) (posn (administrative assistant))) (entry (name vaneyk michael) (age 92) (posn (professor))) (entry (name jones martin) (age 65) (posn (dean))) (entry (name czerwinski andrew) (age 75) (posn (administrative assistant))) (entry (name dally joanne) (age 42) (posn (dean))) (entry (name dally jill) (age 66) (posn (administrative assistant))) (entry (name vaneyk gerry) (age 39) (posn (associate professor))) (entry (name xiong ellen) (age 69) (posn (administrative assistant))) (entry (name meyer michael) (age 98) (posn (administrative assistant))) (entry (name smith michael) (age 71) (posn (professor))) (entry (name vaneyk hal) (age 52) (posn (associate professor))) (entry (name rodriguez jim) (age 42) (posn (administrative assistant))) (entry (name grimson lynn) (age 25) (posn (dean))) (entry (name beebee joanne) (age 60) (posn (administrative assistant))) (entry (name dally andrew) (age 83) (posn (professor))) (entry (name beebee martin) (age 27) (posn (professor))) (entry (name stark gerry) (age 47) (posn (administrative assistant))) (entry (name jordan yale) (age 87) (posn (professor))) (entry (name jacknis steven) (age 69) (posn (assistant professor))) (entry (name horn joanne) (age 85) (posn (associate professor))) (entry (name meyer jill) (age 75) (posn (professor))) (entry (name mikkelson steven) (age 35) (posn (associate professor))) (entry (name xiong steven) (age 30) (posn (assistant professor))) (entry (name jones ellen) (age 95) (posn (assistant professor))) (entry (name housinger steven) (age 72) (posn (associate professor))) (entry (name miller berthold) (age 77) (posn (associate professor))) (entry (name xiong sandy) (age 34) (posn (dean))) (entry (name stein jill) (age 73) (posn (associate professor))) (entry (name stark lynn) (age 62) (posn (associate professor))) (entry (name jacknis christiana) (age 79) (posn (administrative assistant))) (entry (name czerwinski steven) (age 38) (posn (associate professor))) (entry (name stein calista) (age 50) (posn (dean))) (entry (name jacknis martin) (age 34) (posn (administrative assistant))) (entry (name tait christiana) (age 71) (posn (assistant professor))) (entry (name jacknis gerry) (age 29) (posn (dean))) (entry (name stark chris) (age 68) (posn (assistant professor))) (entry (name meyer albert) (age 40) (posn (professor))) (entry (name meyer jim) (age 41) (posn (professor))) (entry (name dally albert) (age 34) (posn (professor))) (entry (name miller rebecca) (age 60) (posn (associate professor))) (entry (name jordan jim) (age 66) (posn (dean))) (entry (name dally john) (age 69) (posn (dean))) (entry (name maritime joanne) (age 38) (posn (assistant professor))) (entry (name mikkelson gerry) (age 49) (posn (assistant professor))) (entry (name jacknis berthold) (age 31) (posn (dean))) (entry (name schlecht gerry) (age 94) (posn (associate professor))) (entry (name meyer arthur) (age 32) (posn (dean))) (entry (name chapin chris) (age 68) (posn (assistant professor))) (entry (name schlecht arthur) (age 92) (posn (professor))) (entry (name brown hal) (age 41) (posn (assistant professor))) (entry (name beebee ellen) (age 51) (posn (dean))) (entry (name mikkelson lynn) (age 38) (posn (administrative assistant))) (entry (name dally jim) (age 39) (posn (assistant professor))) (entry (name xiong john) (age 54) (posn (professor))) (entry (name housinger lynn) (age 71) (posn (administrative assistant))) (entry (name miller ellen) (age 56) (posn (dean))) (entry (name czerwinski jim) (age 94) (posn (professor))) (entry (name tait gerry) (age 99) (posn (dean))) (entry (name tserng ellen) (age 71) (posn (associate professor))) (entry (name sussman albert) (age 92) (posn (assistant professor))) (entry (name jordan eric) (age 74) (posn (administrative assistant))) (entry (name jordan bill) (age 53) (posn (professor))) (entry (name housinger arthur) (age 65) (posn (professor))) (entry (name grimson peter) (age 74) (posn (associate professor))) (entry (name miller sandy) (age 34) (posn (administrative assistant))) (entry (name schlecht hal) (age 53) (posn (professor))) (entry (name tserng arthur) (age 43) (posn (professor))) (entry (name maritime albert) (age 45) (posn (associate professor))) (entry (name jacknis andrew) (age 26) (posn (associate professor))) (entry (name sussman steven) (age 45) (posn (dean))) (entry (name gertner lynn) (age 62) (posn (dean))) (entry (name mikkelson albert) (age 54) (posn (dean))) (entry (name beebee christiana) (age 82) (posn (administrative assistant))) (entry (name beebee albert) (age 63) (posn (dean))) (entry (name wells martin) (age 76) (posn (professor))) (entry (name stein andrew) (age 54) (posn (dean))) (entry (name jones john) (age 28) (posn (professor))) (entry (name smith yale) (age 39) (posn (associate professor))) (entry (name grimson chris) (age 72) (posn (administrative assistant))) (entry (name czerwinski ellen) (age 34) (posn (assistant professor))) (entry (name jones jim) (age 49) (posn (dean))) (entry (name maritime bill) (age 98) (posn (associate professor))) (entry (name horn michael) (age 57) (posn (dean))) (entry (name wells michael) (age 27) (posn (assistant professor))) (entry (name brown chris) (age 43) (posn (dean))) (entry (name chapin michael) (age 33) (posn (administrative assistant))) (entry (name wells joanne) (age 54) (posn (assistant professor))) (entry (name vaneyk christiana) (age 56) (posn (administrative assistant))) (entry (name jacknis eric) (age 85) (posn (professor))) (entry (name czerwinski rebecca) (age 56) (posn (assistant professor))) (entry (name stein peter) (age 96) (posn (associate professor))) (entry (name abelson rebecca) (age 58) (posn (assistant professor))) (entry (name meyer sandy) (age 49) (posn (associate professor))) (entry (name czerwinski sandy) (age 56) (posn (associate professor))) (entry (name housinger jim) (age 37) (posn (dean))) (entry (name mikkelson christiana) (age 98) (posn (administrative assistant))) (entry (name toutet paul) (age 70) (posn (professor))) (entry (name stein yale) (age 93) (posn (associate professor))) (entry (name miller jill) (age 54) (posn (dean))) (entry (name housinger joanne) (age 97) (posn (assistant professor))) (entry (name stein albert) (age 78) (posn (assistant professor))) (entry (name sussman martin) (age 54) (posn (assistant professor))) (entry (name stein hal) (age 90) (posn (assistant professor))) (entry (name miller andrew) (age 45) (posn (administrative assistant))) (entry (name abelson sandy) (age 94) (posn (associate professor))) (entry (name stein sandy) (age 29) (posn (professor))) (entry (name gertner sandy) (age 51) (posn (dean))) (entry (name gertner steven) (age 48) (posn (administrative assistant))) (entry (name meyer calista) (age 81) (posn (administrative assistant))) (entry (name grimson eric) (age 31) (posn (dean))) (entry (name dally abraham) (age 92) (posn (assistant professor))) (entry (name jordan andrew) (age 98) (posn (associate professor))) (entry (name jacknis hal) (age 97) (posn (associate professor))) (entry (name meyer rebecca) (age 78) (posn (assistant professor))) (entry (name jacknis john) (age 71) (posn (associate professor))) (entry (name maritime paul) (age 85) (posn (associate professor))) (entry (name smith calista) (age 46) (posn (assistant professor))) (entry (name housinger eric) (age 65) (posn (assistant professor))) (entry (name abelson abraham) (age 30) (posn (associate professor))) (entry (name beebee andrew) (age 28) (posn (associate professor))) (entry (name sussman eric) (age 40) (posn (administrative assistant))) (entry (name dally lynn) (age 98) (posn (dean))) (entry (name xiong joanne) (age 55) (posn (associate professor))) (entry (name gertner jim) (age 60) (posn (administrative assistant))) (entry (name stark andrew) (age 77) (posn (administrative assistant))) (entry (name tserng john) (age 50) (posn (assistant professor))))

