;;;;Exercise 18: Reverse the elements in a list 

(load "exercise17.scm")

(define (reverse a-list)
  (if (null? a-list)
      a-list
      (append (reverse (cdr a-list)) (list (car a-list)))))












(define sample-list (list 1 4 9 16 25))
