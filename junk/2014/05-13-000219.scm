;;sicp 2.53
;(print (list 'a 'b 'c))

;(print (list (list 'george)))

;(print (cdr '((x1 x2) (y1 y2))))

;(print (cadr '((x1 x2) (y1 y2))))

;(print (pair? (car '(a short list))))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

;(print (memq 'red '((red shoes) (blue socks))))

;(print (memq 'red '(red shoes blue socks)))

;;sicp 2.54
;(print (equal? '(this is a list) '(this is a list)))

;(print (equal? '(this is a list) '(this (is a) list)))

;(print (eq? 1 1))
;(newline)

;(print (eq? '(1) '(1)))

(define (eequal? a b) ;;糞
  (if (and (pair? a)
	   (pair? b))
      (if (eq? (car a) (car b))
	  (eequal? (cdr a) (cdr b))
	  #f)
      (if (not (or (pair? a)
		   (pair? b)))
	  (eq? a b)
	  #f)))

;; (print (eequal? '(this is a list) '(this is a list))) 
;; (print (eequal? '(this is a list) '(this (is a) list)))
;; (print (eequal? (list 1) (list 2)))
;; (print (eequal? '1 '2))
;; (print (eequal? '1 '1))
;; (print (eequal? '1 (list 1)))

;;sicp 2.55
;(print (car ''abracadabra))
;(print ''abracadabra)

