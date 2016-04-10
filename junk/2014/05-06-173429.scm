;;sicp 2.2
(define (make-segment p q)
  (cons p q))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (midpoint-segment s)
  (define (average x y)
    (/ (+ x y) 2))
  (let ((p (start-segment s))
	   (q (end-segment s))))
    (cons (average (x-point p) (x-point q))
	  (average (y-point p) (y-point q)))
    )

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define p (make-point 0 10))
;(print-point p)
(define q (make-point 4 4))
;(print-point q)
;(print-point (midpoint-segment (make-segment p q)))

;;sicp 2.3
(define (make-rectangle ul lr)
  (cons ul lr))

(define (upper-left rec)
  (car rec))
(define (lower-right rec)
  (cdr rec))
(define (perimeter rec)
  (let ((ul (upper-left rec))
	(lr (lower-right rec)))
    (* 2 (+ (- (x-point lr) (x-point ul)) (- (y-point ul) (y-point lr))))))

(define (area rec)
  (let ((ul (upper-left rec))
	(lr (lower-right rec)))
    (* (- (x-point lr) (x-point ul)) (- (y-point ul) (y-point lr)))
  ))

;; (print (perimeter (make-rectangle p q)))
;; (print (area (make-rectangle p q)))
;;A.抽象だめだめ

;;sicp 2.4
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))


(define a (cons 1 2))

;; (print a)
;; (print (car a))
;; (print (cdr a))

;;sicp 2.5 答え読んだだけ
