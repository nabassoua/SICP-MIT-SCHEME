;;;;Exercise 66: Findind record from a DB structured as a tree


(load "binary-trees.scm")

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) '())
	((= given-key (entry set-of-records))
	 (entry set-of-records))
	((< given-key (entry set-of-records))
	 (lookup given-key (left-branch set-of-records)))
	((> given-key (entry set-of-records))
	 (lookup given-key (right-branch set-of-records)))))
	
	 