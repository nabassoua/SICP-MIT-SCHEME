;;;Procedures as return values


(load "general-procedures.scm")

(define dx 0.00001)

(define (deriv g)
  (lambda(x)(/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda(x)(- x
	       (/ (g x) ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point(newton-transform g) guess))

;;;Applying Newton square to compute square root

(define (mysquare x) 
  (newton-method(lambda(y) (- (square y) x)) 1.0)) 

