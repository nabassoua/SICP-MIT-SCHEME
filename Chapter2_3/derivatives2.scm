;;;A simplified version of dreivatives

(define (make-sum e1 e2)
  (cond ((=number? e1 0) e2)
	((=number? e2 0) e1)
	((and (number? e1)(number? e2)) (+ e1 e2))
	(else
	 (list '+ e1 e2))))

(define (addend expr)
  (cadr expr))

(define (augend expr)
  (caddr expr))

(define (make-product e1 e2)
  (cond ((or (=number? e1 0)(=number? e2 0)) 0)
	((=number? e1 1) e2)
	((=number? e2 1) e1)
	((and (number? e1)(number? e2)(* e1 e2)))
	(else
	 (list '* e1 e2))))

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (multiplier expr)
  (cadr expr))

(define (multiplicand expr)
  (caddr expr))

(define (is-sum? expr)
  (and (pair? expr)(eq? (car expr) '+)))

(define (is-product? expr)
  (and (pair? expr)(eq? (car expr) '*)))

(define (variable? x)
  (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (deriv expr var)
  (cond ((number? expr) 0)
	((variable? expr) 
	 (if (same-variable? expr var) 1 0))
	((is-sum? expr)
	 (make-sum (deriv (augend expr) var)
		   (deriv (addend expr) var)))
	((is-product? expr)
	 (make-sum
	  (make-product (deriv (multiplicand expr) var)
			(multiplier expr))
	  (make-product (deriv (multiplier expr) var)
			(multiplicand expr))))
	(else
	 (error "Invalid expression --DERIV"))))

;;Examples

;(deriv '(* x y) 'x)
;Value: y

;(deriv '(+ (* 2 x) (* x y)) 'x)
;Value 15: (+ y 2)