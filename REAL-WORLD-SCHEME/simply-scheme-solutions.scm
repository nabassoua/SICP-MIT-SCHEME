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

;;;8.4


(define beatles '(John Paul George Ringo))

(define (vowel? letter)
  (member? letter '(a e i o u)))

(define (ends-vowel? wd)
  (vowel? (last wd)))

(define (even-count? wd)
  (even? (count wd)))

(define (choose-beatles predicate?)
  (lambda(sent)
    (keep predicate? sent)))

;((choose-beatles ends-vowel?) beatles)
;Value 16: (george ringo)

;((choose-beatles even-count?) beatles)
;Value 17: (john paul george)


;;;8.5

(define (amazify name)
  (word 'the-amazing- name))

(define (transform-beatles proc)
  (lambda (wrd)
    (every proc wrd)))



;((transform-beatles amazify) beatles)
;Value 14: (the-amazing-john the-amazing-paul the-amazing-george the-amazing-ringo)


;;;8.8

(define (double var)
  (* 2 var))

(define (before-last-word sent)
  (last (bl sent)))

(define (change-before-last-word wrd)
  (cond ((number? wrd)
	 (* 2 wrd))
	((equal? wrd 'good)
	 'great)
	((equal? wrd 'bad)
	 'terrible)
	(else
	 wrd)))

(define (exaggerate sent)
  (every change-before-last-word sent))

;(exaggerate '(the chow fun is good here))
;Value 16: (the chow fun is great here)



;;;8.12

(define (count-ums sent)
  (count (keep (lambda(wrd)
		 (equal? wrd 'um))
	       sent)))

(define (find-ums sent)
  (keep (lambda(wrd)
		 (equal? wrd 'um))
	sent))

(define (count-ums2 sent)
  (count (find-ums sent)))

;(count-ums '(today um we are going to um talk about functional um programming))
;Value: 3

;;;8.10

(define (true-for-all? predic? sent)
  (= (count sent)
     (count (keep predic? sent))))

;(true-for-all? even? '(2 4 6 8))
;Value: #t

;(true-for-all? even? '(2 6 3 4))
;Value: #f




;;;8.13

(define (translate-letters wrd)
  (cond ((equal? wrd 'p) 7)
	((equal? wrd 'o) 6)
	((equal? wrd 'c) 2)
	((equal? wrd 'r) 1)
	((equal? wrd 'n) 2)
	((equal? wrd 'd) 8)
	((equal? wrd 'e) 9)
	((equal? wrd 'l) 3)))

	 
(define (phone-unspell letter-tel-num)
  (accumulate word (every translate-letters letter-tel-num)))

;(phone-unspell 'popcorn)
;Value: 7672612


;;;Recursion

(define (explode wrd)
  (if (= 1 (count wrd))
      wrd
      (se (first wrd)
	  (explode (bf wrd)))))

;(explode 'dynamite)
;Value 17: (d y n a m i t e)

(define (letter-pairs wrd)
  (if (<= (count wrd) 1)
      '()
      (se (word (first wrd) (first (bf wrd)))
	  (letter-pairs (bf wrd)))))

;(letter-pairs 'george)
;Value 18: (ge eo or rg ge)

;;;11.5
	  
(define (initials sent)
  (if (empty? sent)
      '()
      (se (first (first sent))
	  (initials (bf sent)))))

;(initials '(if i need someone))
;Value 19: (i i n s)

;;;11.6

(define (countdown num)
  (if (= num 0)
      'blastoff
      (se num
	  (countdown (- num 1)))))
	  
;(countdown 10)
;Value 22: (10 9 8 7 6 5 4 3 2 1 blastoff)

;(countdown 3)
;Value 23: (3 2 1 blastoff)


;;;11.7

(define (copies num wrd)
  (if (= num 0)
      '()
      (se wrd
	  (copies (- num 1) wrd))))

;(copies 8 'spam)
;Value 25: (spam spam spam spam spam spam spam spam)

		  