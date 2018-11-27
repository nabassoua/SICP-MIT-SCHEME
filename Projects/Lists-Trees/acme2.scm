;;;Solutions to the exercises in the attached problem set

;;;Quick review: reproducing map,filter and accumulate from memory

(define (my-map fct seq)
  (if (null? seq)
      '()
      (cons (fct (car seq))
	    (my-map fct (cdr seq)))))

;(my-map square (list 1 2 3 4))
;Value 14: (1 4 9 16)

(define (my-filter predicate? seq)
  (cond ((null? seq) '())
	((predicate? (car seq))(cons (car seq) (my-filter predicate? (cdr seq))))
	(else 
	 (my-filter predicate? (cdr seq)))))

;(my-filter even? (list 1 2 4 5 7))
;Value 15: (2 4)
      
(define (my-accumulate op initial seq)
  (if (null? seq)
      initial
      (op (car seq)
	  (my-accumulate op initial (cdr seq)))))

;(my-accumulate + 0 (list 1 2 3 5 7))
;Value: 18

;(my-accumulate * 1 (list 1 2 3 5 7))
;Value: 210

;(my-accumulate cons '() (list 1 2 3 5 7))
;Value 18: (1 2 3 5 7)


(define (cube x)
  (* x x x))

;;Tests if the cube of a number x 
;;is between 10 and 10000

(define (included? x)
  (and (> (cube x) 10)(< (cube x) 10000)))

;(included? 2)
;Value: #f

;(included? 100)
;Value: #f

;(included? 10)
;Value: #t


(define (sum-some-cubes lst)
    (my-accumulate +
		   0
		   (map cube
			(my-filter included? lst))))

;(sum-some-cubes (list 1 2 10 11 100))
;Value: 2331

;;This procedure returns the copy of a given list

(define (copy lst)
  (if (null? lst)
      '()
      (cons (car lst)
	    (copy (cdr lst)))))

;(copy (list 1 23 4 5))
;Value 15: (1 23 4 5)

;;This procedure returns the copy of a list using the map function

(define (copy2 lst)
  (map (lambda(x)
	 (if (null? x)
	     '()
	     x))
       lst))

;(copy2 (list 1 23 4 5))
;Value 17: (1 23 4 5)

;; copy using filter

(define (copy3 lst)
  (my-filter (lambda(x)
	       (if (null? x)
		   '()
		   x))
	     lst))

;(copy3 (list 1 23 4 5))
;Value 18: (1 23 4 5)

;;copy using accumulate

(define (copy4 lst)
  (my-accumulate cons
		 '()
		 lst))

;(copy4 (list 1 23 4 5))
;Value 19: (1 23 4 5)

;;HOPS using HOPS

(define (map2 p sequence)
  (my-accumulate (lambda (x y)
		   (cons (p x) y))
		 '()
		 sequence))

;(map2 square (list 1 2 3 4))
;Value 15: (1 4 9 16)

(define (append2 seq1 seq2)
  (my-accumulate cons
		 seq2
		 seq1))

;(append2 (list 12 3 4) (list 5 7 8))
;Value 17: (12 3 4 5 7 8)
		
(define  (my-lenght sequence)
  (my-accumulate (lambda (x y)
		   (+ 1 y))
		 0
		 sequence))

;(my-lenght (list 1 2 3 4))
;Value: 4
		 
;;SICP 2.28

(define (fringe tree)
  (if (null? tree)
      '()
      (let ((first (car tree))
	    (rest (cdr tree)))
	(append
	 (if (pair? first)
	     (fringe first)
	     (list first))
	 (fringe rest)))))

;(fringe (list (list 1 2) (list 3 4)))
;Value 16: (1 2 3 4)
	 
;(fringe (list 1 (list 3 4)))
;Value 17: (1 3 4)	 

(define (last-pair lst)
  (if (null? (cdr lst))
      (list (car lst))
      (last-pair (cdr lst))))

;(last-pair (list 23 72 149 34))
;Value 18: (34)

(define (last lst)
  (if (null? (cdr lst))
      (car lst)
      (last (cdr lst))))

;(last (list 23 72 149 34))
;Value: 34

	
;(list 1 (list 2 3) (list 4 (list 5)))
;Value 13: (1 (2 3) (4 (5)))



;; ------------------------------------------------------------
;;
;; Some stock data.  The ibm examples are from the problem set,
;; while the acme examples are defined here.

(define ibm-previous-close 100.0)
(define ibm-prices (list 100.5 101.0))

; If you're curious about how I generated the prices...
(define (random-walk start n)
  (define (helper count last so-far)
    (if (= count n)
	so-far
	(let ((step (* (- (random 16) 8) 0.25)))
	  (helper (+ count 1)
		  (+ last step)
		  (append so-far (list (+ last step)))))))
  (helper 0 start nil))

; (define acme-prices (random-walk acme-previous-close 10))

(define acme-previous-close 50.0)
(define acme-prices 
  (list 49.75 48.75 47.0  45.0  46.25
	48.0  47.5  48.5  47.25 46.75))

;;This procedure computes net gain/loss in the price of the stock

(define (price-trend previous-close ticker)
  (- (last ticker) previous-close))

;(price-trend ibm-previous-close ibm-prices)
;Value: 1.

;(price-trend acme-previous-close acme-prices)
;Value: -3.25

;;this procedure computes the average price of the stock
   
(define (price-average ticker)
  (/ (my-accumulate + 0 ticker)
     (my-lenght ticker)))

;(price-average acme-prices)
;Value: 47.475


;;This procedure returns the highest price of the stock during the trading day

(define (price-high ticker)
  (list-max ticker))

(define (list-max lst)
  (if (null? (cdr lst))
      (car lst)
      (max  (car lst)
	    (list-max (cdr lst)))))

;list-max follows an recursive processed (defered operations)
;s(n) is linear in space where n is the number of elements in the list
;(list-max acme-prices)
;Value: 49.75

;Iterative version of price-high

(define (price-high-iter ticker)
  (list-max-iter ticker))

(define (list-max-iter lst)
  (define (helper lst  max-so-far)
    (if (null? lst)
	max-so-far
	(helper (cdr lst)
		(max max-so-far (car lst)))))
  (helper (cdr lst) (car lst)))
  
;(price-high-iter acme-prices)
;Value: 49.75


;;Rewriting the same procedure using HOP
	   
(define (price-high2 lst)
  (my-accumulate max
		 0
		 lst))

;(price-high2 acme-prices)
;Value: 49.75		 

;; COMPUTER EXERCISE 5 - price-range
(define (price-range ticker)
  (define (helper ticker low-so-far high-so-far)
    (if (null? ticker)
	(list low-so-far high-so-far)
	(helper (cdr ticker)
		(min low-so-far (car ticker))
		(max high-so-far (car ticker)))))
  (helper (cdr ticker) (car ticker) (car ticker)))


;(price-range acme-prices)
;Value 14: (45. 49.75)
 
; ------------------------------------------------------------
; ON THE FLOOR

(define (ask-price  ask) (car ask))
(define (ask-shares ask) (cdr ask))

(define (bid-price  bid) (car bid))
(define (bid-shares bid) (cdr bid)) ; corrected 9/24/96
; (define (bid-shares bid) (cdr ask)) -- ERROR

(define ibm-ask (list (cons 101.0 200) (cons 100.5 200) (cons 101.0 100)))
(define ibm-bid (list (cons 100.5 100) (cons 100.5 100) (cons 101.0 100)))

;; The acme data.  This should be consistent 
(define acme-ask
  (list (cons 50.0 100) (cons 49.75 100) (cons 50.0 100)
	(cons 48.75 100) (cons 49.0 100) (cons 47.0 200)
	(cons 47.0 100) (cons 45.0 500)	(cons 46.25 300)
	(cons 48.0 400) (cons 48.0 400)	(cons 48.0 200)
	(cons 47.5 200) (cons 48.5 100)	(cons 49.0 100)
	(cons 47.25 100) (cons 47.5 100) (cons 46.75 100)))

(define acme-bid
  (list (cons 49.75 200) (cons 49.75 200) (cons 48.5 100)
	(cons 48.75 100) (cons 45.0 100) (cons 47.0 100)
	(cons 44.0 100) (cons 45.0 400)	(cons 46.25 100)
	(cons 47.0 100) (cons 48.0 200)	(cons 47.0 400)
	(cons 47.5 300) (cons 48.5 100)	(cons 47.0 100)
	(cons 47.25 200) (cons 45.0 100) (cons 46.75 100)))

; COMPUTER EXERCISE 6 - price-spreads

(define (price-spreads asklist bidlist)
  (define (price-spreads-iter asklist bidlist spread-so-far)
    (if (null? <TBD>)
	(list spread-so-far)
	(price-spreads-iter (cdr asklist)
			    (cdr bidist)
			    (- (ask-price asklist)(bid-price bidlist)))))
  (price-spreads-iter (cdr asklist) (cdr bidlist) <TBD>))








; COMPUTER EXERCISE 7 - map2 & price-spreads
; COMPUTER EXERCISE 8 - trade? and ticker-prices
; COMPUTER EXERCISE 9 - merge2
; COMPUTER EXERCISE 10 - ticker-prices using merge2
; COMPUTER EXERCISE 11 - ticker-shares and total-shares
; COMPUTER EXERCISE 12 - price-volume



