;;;;Practice writing, editing and evaluating Scheme expressions using Edwin 

-37
(* 3 4)
(> 10 9.7)
(- (if (> 3 4)
       7
       10)
   (/ 16 10))
(* (- 25 10)
 (+ 6 3))
+
(define double (lambda (x) (* 2 x)))
double
(define c 4)
c
(double c)
c
(double c)
c
(double (double (+ c 5)))
(define times-2 double)
(times-2 c)
(define d c)
(= d c)
(cond ((>= c 2) d)
      ((= c (- d 5)) (+ c d))
      (else (abs (- c d))))

(define abs
  (lambda (a)
    (if (> a 0)
	a
	(- a))))

(abs -10)
