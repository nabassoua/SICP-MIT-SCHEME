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