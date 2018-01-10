;;;;Towers of Hanoi procedure

;;;Move disks from the "from" tower to the "To" tower
;;;using the "extra" tower as an extra peg
;;;n represents the number of disks to move

(define (move-disks n from to extra)
  (cond ((= n 0) '())
        ;;Move the top disks from the "from" peg to the "extra" peg using "to" as the extra peg
	(else (move-disks (- n 1) from extra to)
	      (print-move from to)
	;;Move disks from the "extra" peg to the "to" peg using "from" as the extra peg
	      (move-disks (- n 1) extra to from))))

;;;Prints move sequences

(define (print-move from to)
  (newline)
  (display "Move disk from ")
  (display from )
  ;;Notice the spaces between to in the " " expression. This space ensures that there is space with the string just preceding to
  (display " to ")
  (display to))

;Value: move-disks

;(move-disks 3 1 3 2)

Move disk from 1 to 3
Move disk from 1 to 2
Move disk from 3 to 2
Move disk from 1 to 3
Move disk from 2 to 1
Move disk from 2 to 3
Move disk from 1 to 3
;Value: ()








