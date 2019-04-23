;;;Solutions to exercises from the Simply Scheme book by Harvey

;;;Custom functions needed in Harvey's book

(load "simply.scm")

;;;5.1

;(sentence 'I '(me mine))
;Value 15: (i me mine)

;(sentence '() '(is empty))
;Value 16: (is empty)

;(word '23 '45)
;Value: 2345

;(se '23 '45)
;Value 17: (23 45)

;(bf 'a)
;Value 18: ""

;(bf '(aye))
;Value: ()

;(count (first '(maggie mae)))
;Value: 6

;(se "" '() "" '())
;Value 19: ("" "")

;(count (se "" '() "" '()))
;Value: 2

;;;5.2

(define (f1 arg1 arg2)
  (se (bf arg1) (bl arg2)))

;(f1 '(a b c)'(d e f))
;Value 22: (b c d e)


(define (f2 arg1 arg2)
  (se (bf arg1) (bl arg2) (word (first arg1) (last arg2))))

;(f2 '(a b c)'(d e f))
;Value 24: (b c d e af)

(define (f3 arg1 arg2)
  (se arg1 arg1))

;(f3 '(a b c)'(d e f))
;Value 26: (a b c a b c)

(define (f4 arg1 arg2)
  (word (first (bf arg1)) (first (bf arg2))))

;(f4 '(a b c)'(d e f))
;Value: be

;;;5.14

;;Selects tehe third letter of a word (or the third word of a sentence)

(define (third expr)
  (first (bf (bf expr))))

;(third 'fine)
;Value: n

;(third '(hello yacouba nabassoua))
;Value: nabassoua

;(third '(hello mohamed yacouba askia))
;Value: yacouba

;;;5.15

(define (first-two wrd)
  (word (first (bl wrd)) (first (bf wrd))))

;(first-two 'ambulatory)
;Value: am


(define (two-first wrd1 wrd2)
  (word (first (bl wrd1)) (first (bl wrd2))))

;Value: be