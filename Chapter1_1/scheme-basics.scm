;;;;Scheme basics: Evaluation; Expressions and Procedures

4
;Value: 4
;Expression type: primitive

5.5
;Value: 5.5
;Expression type: primitive

4.2e1
;Value: 42.
;Expression type: primitive

(+ 1 2)
;Value: 3
;Expression type: procedure application

(* (+ 7 8) (- 5 6))
;Value: -15
;Expression type: procedure application

(define one 1)
;Value: one
;Expression type: special form (naming)

(7)
;The object 7 is not applicable.
;invalid expression

(define two (+ 1 one))
;Value: two
;Expression type: special form (naming)

(define five 3)
;Value: five
;Expression type: special form (naming)

(+ five two)
;Value: 5
;Expression type: procedure application

(define biggie-size *)
;Value: biggie-size
;Expression type: special form (naming)


(define hamburger 1)
;Value: hamburger
;Expression type: special form (Naming)

(biggie-size hamburger five)
;Value: 3
;Expression type: procedure application


(= 7 (+ 3 4))
;Value: #t
;Expression type: procedure application

(= #t #f)
;The object #t, passed as the first argument to integer-equal?, is not the correct type.
;Expression type: illegal expression


((+ 5 6))
;The object 11 is not applicable.
;Expression type: illegal expression

biggie-size
;Value 13: #[arity-dispatched-procedure 13 *]
;Expression type: simple - built in???


(if #t 1 (+ 3 0))
;Value: 1
;Expression type: special form

(if (if #f #t #f) #f #t)
;Value: #t
;Expression type: special form


(if (if (= hamburger five) 3 7)
    (+ (if (= (+ 1 one) two)
	   3
	   5)
       7)
    "yay")
;Value: 10
;Expression type: special form

(/ 256
   (if (> five (+ two 1))
       (/7 (- hamburger 1))
       2))
;Value: 128
;Expression type: procedure application


