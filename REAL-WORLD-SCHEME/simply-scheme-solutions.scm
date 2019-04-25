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

;;;5.20

(define (middle-names expr)
  (se (bf (bl expr))))

;(middle-names '(peter blair denis bernard mike alexander george noone))
;Value 14: (blair denis bernard mike alexander george)

;(middle-names '(bugs bunny))
;Value: ()

;;;5.19

(define (insert-and expr)
  (se (bl expr) '(and) (se (last expr))))

;(insert-and '(john bill wayne fred joey))
;Value 15: (john bill wayne fred and joey)

;;;5.17

(define (knight expr)
  (se '(sir) expr))

;(knight '(david wessel))
;Value 17: (sir david wessel)

;;;5.21

(define (query expr)
  (se (se (first (bf expr)))
      (se (first expr))
      (se (bf (bf expr)))
      '(?)))

;(query '(i should have known better))
;Value 18: (should i have known better ?)

;(query '(you are experienced))
;Value 19: (are you experienced ?)


;;;6.14

(define (describe-time secs)
  (cond (( and (> secs 0) (< secs 60))
	 (se secs 'seconds))
	(( and (> secs 60) (< secs 3600))
	 (let ((secs-to-minutes (/ secs 60.0)))
	   (se secs-to-minutes 'minutes)))
	(( > secs 300000000)
	 (let ((secs-to-centuries (* secs (* 3.168 (expt 10 (- 10))))))
	   (se secs-to-centuries 'centuries)))))

;(describe-time 30000000000)
;Value 25: (9.504000000000001 centuries)

