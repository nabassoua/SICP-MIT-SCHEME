;;;;Rectangle

(load "exercise2.scm")


(define (rectangle width height)
  (cons width height))



(define point-a (make-point 3 8)) 
;(define point-b (make-point 5 8))
(define point-c (make-point 3 7))
(define point-d (make-point 5 7))


(define example-width (make-segment point-c point-d))
(define example-height (make-segment point-c point-a))


(define (perimeter width-segment height-segment)
  (* 2 (+ (- (x-point (end-segment width-segment)) (x-point (start-segment width-segment)))
	  (- (y-point (end-segment height-segment)) (y-point (start-segment height-segment))))))
  

(define (area width-segment height-segment)
  (* (- (x-point (end-segment width-segment)) (x-point (start-segment width-segment)))
     (- (y-point (end-segment height-segment)) (y-point (start-segment height-segment)))))

;;;Test cases

(perimeter example-width example-height)
(area example-width example-height) 