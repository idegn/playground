;;sicp 1.35
(define tolerance 0.00001)

;; (define (fixed-point f first-guess)
;;   (define (close-enough? v1 v2)
;;     (< (abs (- v1 v2)) tolerance))
;;   (define (try guess)
;;     (let ((next (f guess)))
;;       (if (close-enough? guess next)
;;           next
;;           (try next))))
;;   (try first-guess))

(define (golden-ratio n)
  (fixed-point (lambda (x) (+ 1.0 (/ 1 x))) n))

;(print (golden-ratio 1))

;;sicp 1.36
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)

    (let ((next (f guess)))
      (print next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (log-fixed n)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) n))
(define (ave-log-fixed n)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) n))

;; (print (log-fixed 2))
;; (newline)
;; (print (ave-log-fixed 2))

;;sicp 1.37
;; (define (cont-frac n d k)
;;   (/ (n (- k 1)) (+ (/ (n k) (d k)) (d (- k 1))))
;;   )

(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
	(/ (n k) (d k))
	(/ (n i) (+ (d i) (iter (+ i 1))))))
  (iter 1))

;; (print (/ 1 (cont-frac (lambda (x) 1.0)
;; 		  (lambda (x) 1.0)
;; 		  1000)))

;;b.

(define (it-cont-frac n d k)
  (define (iter i t)
    (if (= i 1)
	(/ (n i) (+ (d i) t))
	(iter (- i 1) (/ (n i) (+ (d i) t)))
	))
  (iter k 0)
  )

;; (print (/ 1 (cont-frac (lambda (x) 1.0)
;; 		  (lambda (x) 1.0)
;; 		  1000)))

;;sicp 1.38

;; (print (cont-frac (lambda (x) 1.0)
;; 		  (lambda (i) (if (= (remainder i 3) 2)
;; 				  (+ (* (floor (/ i 3)) 2) 2)
;; 				  1))
;; 		  1000))

(define (tan-cf x k)
 (cont-frac (lambda (i) (if (= i 1)
			     x
			     (* (* x x) -1)))
	     (lambda (i) (+ (* i 2) -1))
	     k))



(print (tan-cf (/ 3.14 4) 100000))
(print (tan-cf (/ 3.14 2) 100000))
