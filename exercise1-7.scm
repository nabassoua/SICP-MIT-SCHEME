;;;;SICP Exercise 1.6




(define (sqrt-iter-improved guess previous-guess x)
		 (if(good-enough? guess previous-guess)
		    guess
		    (sqrt-iter-improved (improve-guess guess x) guess x)))





(define (good-enough? guess previous-guess)
		     (< (abs (- guess previous-guess)) 0.001)) 


(define (square x) (* x x))

(define (average m n)
	       (/ (+ m n) 2))


(define (improve-guess guess x)
		     (average guess (/ x guess)))




(define (sqroot-improved x)
  (sqrt-iter-improved 1.0 2.0 x))

;;;testing our square root iteration by computing the square root of 2
	
;;for large values of x the programs hangs. 

#|

(sqroot 20.0)
;Value: 4.4721402170657

(sqroot 1000)
;Value: 31.622782450701045

(sqroot 2000000)
;Value: 1414.2135626178515

(sqroot 2000000000)
;Value: 44721.359549995796

(sqroot 20000000000000000004)
;Value: 4472135954.999579

(sqroot 200000000000000000000000000000000000000000020)
|#

;;Testing our square root procedure with a modified guess-enough? routine
;;With this new version of guess-enough, the interpreter does not hang while trying
;;to evaluate very large numbers

#|


(sqroot-improved 4)
;Value: 2.0000000929222947

(sqroot-improved 10000)
;Value: 100.

(sqroot-improved 1000000000000004)
;Value: 31622776.601683855

(sqroot-improved 10000000000000000000000000000000000000000000004)
;Value: 0.9999999999999999e23
|#