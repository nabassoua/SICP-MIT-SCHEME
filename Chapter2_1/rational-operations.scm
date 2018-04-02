;;;;Operations on rational numbers


(define (mult-rat x y)
  (make-rat (* (num x) (num y))
	    (* (den x) (den y))))

(define (div-rat x y)
  (make-rat (* (num x) (den y))
	    (* (den x) (num y))))


(define (add-rat x y)
  (make-rat (+ (* (num x) (den y))
	       (* (num y) (den x)))
	    (* (den x) (den y))))


(define (sub-rat x y)
  (make-rat (- (* (num x) (den y))
	       (* (num y) (den x)))
	    (* (den x) (den y))))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (num x)
  (car x))

(define (den x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (num x))
  (display "/" )
  (display (den x)))

;;;Examples

(define one-half (make-rat 1 2))

;(print-rat one-half)

(define five-eigth (make-rat 5 8))
(define seven-fourth (make-rat 7 4))

(define result1 (add-rat five-eigth seven-fourth))


;(print-rat result1)

;19/8
;Unspecified return value


