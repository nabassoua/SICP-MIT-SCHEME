;;;;A quick overview of symbolic data manipulation in Scheme

'((Norah 15) (Molly 12) (Anna 9) (Lauren 9) (Charlotte 6))

;Value 16: ((norah 15) (molly 12) (anna 9) (lauren 9) (charlotte 6))

;;Equivalent list expression

(list '(Norah 15)
      (list 'Molly 12)
      (list 'Anna '9)
      '(Lauren 9)
      (list 'Charlotte 16))

;Value 19: ((norah 15) (molly 12) (anna 9) (lauren 9) (charlotte 16))

;;Symbols are case-insensitive on input
(eq? 'Abc 'ABC)
;Value: #t

;;Example: generating sentences

(define noun-list (list 'dog 'cat 'professor 'student 'rat))

(define verb-list (list 'ran 'ate 'slept 'drank))

(define adjective-list (list 'red 'slow 'dead))

(define adverb-list (list 'quickly 'happily 'well))

(define (sentence)
  (append (append '(the)
		  (noun-phrase))
	  (verb-phrase)))



