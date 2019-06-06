;;; PS5 spring97 utils

;; basic abstraction

(define (make-struct name-st age-st posn-st)
  (list 'entry  name-st age-st posn-st))

(define name-struct cadr)
(define age-struct caddr)
(define posn-struct cadddr)

(define (make-name sur given)
  (list 'name sur given))

(define surname cadr)
(define given-name caddr)
(define names cdr)

(define (make-age age)
  (list 'age age))

(define age cadr)

(define (make-posn p)
  (list 'posn p))

(define position cadr)

;;; first data base will just be an unordered list

(define empty-db? null?)
(define empty-db '())
(define next-db car)
(define rest-db cdr)
(define add-struct cons)

(define (accumulate op init items)
  (cond ((null? items) init)
	(else (op (car items) (accumulate op init (cdr items))))))

(define (filter predicate items)
  (cond ((null? items) '())
	((predicate (car items))
	 (cons (car items) (filter predicate (cdr items))))
	(else (filter predicate (cdr items)))))

(define (map proc items)
  (if (null? items)
      '()
       (cons (proc (car items))
             (map proc (cdr items)))))

(define (alpha<? s1 s2)
  ;; procedure to compare two symbols
  (let ((c1 (symbol->string s1))
	(c2 (symbol->string s2)))
    (string<? c1 c2)))

(define tree-entry car)
(define left-branch cadr)
(define right-branch caddr)
(define (make-tree entry l r)
  (list entry l r))
(define empty-tree? null?)
(define empty-tree '())
