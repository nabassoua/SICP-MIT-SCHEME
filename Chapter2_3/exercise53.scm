;;;Intro to quotes

(list 'a 'b 'c)
(list (list 'george))
(cdr '((x1 x2)(y1 y2)))
(cadr '((x1 x2)(y1 y2)))
(pair? (car '(a short list)))
(memq 'red '((red shoes) (blue socks)))
(memq 'red '(red shoes blue socks))

;;Respective outputs of the expressions above

;Value 13: (a b c)

;Value 14: ((george))

;Value 15: ((y1 y2))

;Value 17: (y1 y2)

;Value: #f

;Value: #f

;Value 18: (red shoes blue socks)

