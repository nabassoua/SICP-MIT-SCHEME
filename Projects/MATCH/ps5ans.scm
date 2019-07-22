;;; these procedures require modification or completion

(define (p x y)
  (= x y))

(define test-tree (list 1 (list 2 3)))

(define test-tree2 (list 2 (list 2 3)))

(define (match1? t1 t2 pred)
  (cond ((null? t1) (null? t2))
        ((null? t2) false)
        ((and (not (pair? t1))(not (pair? t2)))
	 (if (pred t1 t2) 
	     true
	     (and (match1? (cdr t1)(cdr t2) pred)
		  (match1? (car t1)(car t2) pred))))	     
        (else (and (match1? (cdr t1) (cdr t2) pred)
                   (match1? (car t1) (car t2) pred)))))
                   

(define (match2? t1 t2 pred)
  (cond ((null? t1) (null? t2))
        ((null? t2) false)
        <clause3>
        <clause4>
        ((match2? (cdr t1) (cdr t2) pred)
         (match2? (car t1) (car t2) pred))
        (else false)))

(define (match3? tree1 tree2 equal-test)
  (define (helper t1 t2 result)
    (cond ((not result) false)
          ((null? t1) (null? t1))
          ((null? t2) false)
          <clause4>
          <clause5>
          (else (helper <exp1> 
                        <exp2> 
                        (helper (car t1) (car t2) <exp3>)))))
  (helper <exp4> <exp5> true))

(define (extend-dictionary key data dictionary)
  (let ((v (assq key dictionary)))
    (cond (...))))

(define (apply-restriction expression data)
  (let ((rest (cddr expression)))
    (if <a>
        <b>
        ((evaluate (car rest)) data))))

(define (instantiate skeleton dictionary)
  (cond ((not (pair? skeleton)) <exp1>)
        ((skeleton-variable? skeleton) <exp2>)
        ((skeleton-evaluation? skeleton) 
         (evaluate <exp3>))
        (else (cons (instantiate (car skeleton) dictionary)
                    (instantiate (cdr skeleton) dictionary))))))

(define (make-transformer the-rules)
  (define (transform-exp exp)
    (try-rules (if (pair? exp)
                   (map transform-exp exp)
                   exp)))
  (define (try-rules exp)
    (define (scan rules)
      (if (null? rules)
          <exp1>
          (let ((dictionary (match (pattern <exp2>)
                                   exp
                                   (make-empty-dictionary))))
            (if (eq? dictionary 'failed)
                (scan <exp3>)
                (transform-exp (instantiate (skeleton <exp4>)
                                            dictionary))))))
    (scan <exp5>))
  <exp6>)

(define deriv-rules
  '(
    ((DD (? C constant?) (? V variable?))
     0                                 )
    <more rules>
    ))

(define alg-simp (make-transformer algebra-rules))

(define deriv (make-transformer deriv-rules))
