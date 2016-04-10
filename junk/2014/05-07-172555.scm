(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


;;sicp 2.7
(define (make-interval a b) (cons a b))

(define (upper-bound i) (cdr i))
(define (lower-bound i) (car i))

;;sicp 2.8
(define (sub-interval a b)
  (make-interval (- (upper-bound a) (lower-bound b))
		 (- (lower-bound a) (upper-bound b))))


;;sicp 2.9 よんだだけ

;;sicp 2.10
(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (< 0 (upper-bound y)))
      (error "error")
      (mul-interval x 
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))

(define a (make-interval 2.0 3.0))
(define b (make-interval -1.0 2.0))  

;; (print (div-interval a b))
;;sicp 2.11 とばした









;;sicp 2.12
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))


(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))


(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((lb (* c (- 1.0 p)))
	(ub (* c (+ 1.0 p))))
    (make-interval lb ub)
    )
  )

;; c - cp = lb
;; c - lb = cp
;; (c - lb) / c = p
;; 1 - (lb / c) = p
(define (percent i)
  (- 1 (/ (lower-bound i) (center i))))

(define c (make-center-percent 92 0.045))
;(print (percent c))

;; sicp2.14
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define d (make-center-percent 3.0 0.1))
(define e (make-center-percent 3.0 0.05))
(define f (make-center-percent 5.0 0.0001))

(print d)
(print (center d))
(print (percent d))
(newline)

(print "d")
(print (par1 d d))
(print (center (par1 d d)))
(print (percent (par1 d d)))
(print (par2 d d))
(print (center (par2 d d)))
(print (percent (par2 d d)))
(newline)

(print "f")
(print (par1 f f))
(print (center (par1 f f)))
(print (percent (par1 f f)))
(print (par2 f f))
(print (center (par2 f f)))
(print (percent (par2 f f)))
(newline)

(print (par1 d e))
(newline)
(print (par2 d e))
