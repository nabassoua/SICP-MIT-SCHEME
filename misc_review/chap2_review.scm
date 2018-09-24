;;;;Chapter 2 review

(list 1 2 3)
(cons 1 (cons 2 (cons 3 '())))

;;;Lenght of a list

(define (length alist)
  (if (null? alist)
      0
      (+ 1 (length (cdr alist)))))

(define test-list (list 2 4 8 10))

;(length test-list)
;Value: 4

;;;Appending a list

(define (append_list list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append_list (cdr list1) list2))))


;(append_list test-list test-list)
;Value 16: (2 4 8 10 2 4 8 10)

;;;Reversing a list

(define (reverse_list list1)
  (if (null? list1)
      '()
      (append (reverse_list (cdr list1))(list (car list1)))))

;(reverse_list test-list)
;Value 18: (10 8 4 2)


;;;Map function

(define (map fnct lst)
  (if (null? lst)
      '()
      (cons (fnct (car lst))
	    (map fnct (cdr lst)))))


;(map square test-list)
;Value 16: (4 16 64 100)

;(map (lambda(el) (* el 10)) test-list)
;Value 17: (20 40 80 100)

;;;Function to filter a list

(define (filter funct lst)
  (if (null? lst)
      '()
      (if (funct (car lst))
	  (cons (car lst) (filter funct (cdr lst)))
	  (filter funct (cdr lst)))))
		  
	  
  
(define (even? x)
  (= (remainder x 2) 0))

(define list2 (list 1 4 3 8 0 2 11 23))

;(filter even? list2)
;Value 18: (4 8 0 2)
 
;;;Enumerate function

(define (enumerate from to)
  (if (> from to)
      '()
      (cons from (enumerate (+ 1 from) to))))

;(enumerate 1 5)
;Value 21: (1 2 3 4 5)

;;;Adding an element to the end of a list

(define (tack x lst)
  (if (null? lst)
      (list x)
      (cons (car lst) (tack x (cdr lst)))))

;(tack -1 list2)
;Value 16: (1 4 3 8 0 2 11 23 -1)

(define (flatmap fnct lst)
  (if (null? lst)
      '()
      (append (fnct (car lst))
	    (flatmap fnct (cdr lst)))))

;(map (lambda (start) (enumerate start (+ start 6))) list2)
;Value 19: ((1 2 3 4 5 6 7) (4 5 6 7 8 9 10) (3 4 5 6 7 8 9) (8 9 10 11 12 13 14) (0 1 2 3 4 5 6) (2 3 4 5 6 7 8) (11 12 13 14 15 16 17) (23 24 25 26 27 28 29))

;(flatmap (lambda (start) (enumerate start (+ start 6))) list2)
;Value 20: (1 2 3 4 5 6 7 4 5 6 7 8 9 10 3 4 5 6 7 8 9 8 9 10 11 12 13 14 0 1 2 3 4 5 6 2 3 4 5 6 7 8 11 12 13 14 15 16 17 23 24 25 26 27 28 29)



;;;Additional car and cdr practice

(define l1 ( list 1 3 (list 5 7) 9)) 
l1
(car (cdr (car (cdr (cdr l1)))))
;Value: 7

(define l2 (list (list 7)))
l2
(car (car l2))
;Value: 7

;;;counting leaves in a tree

(define (count-leaves my_tree)
  (cond ((null? my_tree) 0 )
	((not (pair? my_tree)) 1)
	(else (+ (count-leaves (car my_tree))
		 (count-leaves (cdr my_tree))))))

(define sample_tree (cons (list 1 2) (list 3 4)))

;(count-leaves sample_tree)
;Value: 4


(define (deep-reverse mylist)
  (if (null? mylist)
      '()
      (let ((x (car mylist))
	    (newlst (cdr mylist)))
	(append newlst
		(if (pair? x)
		    (deep-reverse x)
		    (list x))))))

;(deep-reverse sample_tree)
;Value 19: (3 4 2 1)
		 

(define (scale-tree tree factor)
  (cond ((null? tree) '())
	((not (pair? tree)) (* tree factor))
	(else
	 (cons (scale-tree (car tree) factor)
	       (scale-tree (cdr tree) factor)))))

;(scale-tree (list (list 3 4) (list 5 6)) 3)
;Value 18: ((9 12) (15 18))


(define (square-tree tree)
  (cond ((null? tree) '())
	((not (pair? tree)) (square tree))
	(else
	 (cons (square-tree (square (car tree)))
	       (square-tree (cdr tree))))))


;;;Nested mapping


(define (flatmapp proc seq)
  (accumulate append
	      '()
	      (map proc seq)))
	      
(define (prime-sum? pair)
  (prime? (+ (car pair)(car (cdr pair)))))


(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair)(car (cdr pair)))))

(define (prime-sum-pairs n)
  (map make-pair-sum 
       (filter prime-sum? 
	       (flatmapp 
		(lambda (i)
		    (map (lambda(j) (list i j)) 
			 (enumerate-interval 1 (- i 1))))
		(enumerate-interval 1 n)))))







  