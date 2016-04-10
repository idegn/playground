;;sicp 1.40
(define tolerance 0.00001)

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

(define dx 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
  (+ (* x x x) (* a x x) (* b x) c)))

;(print (newtons-method (cubic a b c) 1))
;(print (newtons-method (cubic 1 1 1) 1))

;;sicp 1.41
(define (inc x) (+ x 1))
(define (double f)
  (lambda (x)
    (f (f x))))

;; (print (((double (double double)) inc) 5))
;; (print ((double inc) 5))
;; (print (((double double) inc) 5))
;; (print ((double (double inc)) 5))


;;sicp 1.42
(define (compose f g)
  (lambda (x) (f (g x))))

(define (square x)
  (* x x))

;(print ((compose square inc) 6))

;;sicp 1.43
;; (define (repeated f x)
;;   (lambda (c) ))

;; (define (repeated f n)
;;   (if (= n 1)
;;       f
;;       (lambda (x)
;;         (f ((repeated f (- n 1)) x)))))

(define (repeated f n)
  (define (iter g c)
    (if (= c 1)
	g
	(iter (compose g f) (- c 1))))
  (iter f n))

;; (print ((repeated square 2) 5))
;; (print ((repeated inc 4) 0))

;;sicp 1.44
(define (smooth f x)
  (/ (+ (f x) (f (+ x dx) (- x dx))) 3))

(define (n-smooth f n)
  ((repeated smooth n) f))

;;sicp 1.45
(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (nth-root x n c)
  (fixed-point ((repeated average-damp c) (lambda (y) (/ x (expt y (- n 1)))))
		1.0))

;; (print (nth-root 2 2 1))
;; (print (nth-root 3 2 1))
;; (print (nth-root 4 2 1))

;; (print (nth-root 2 3 1))
;; (print (nth-root 3 3 1))
;; (print (nth-root 27 3 1))

;;sicp 1.46
(define (iterative-improve judge? predict)
  (define (try x)
    (let ((next (predict x)))
      (print next)
      (if (judge? next x)
	  next
	  (try next)
	  ))))

(define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
;(print (iterative-improve close-enough? (lambda (x) (+ 1.0 (/ 1 x)))))
;(print ((iterative-improve close-enough? (lambda (x) (+ 1.0 (/ 1 x)))) 1))

(define (new-fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

;(print (new-fixed-point (lambda (x) (+ 1.0 (/ 1 x))) 1))

(define (sqrt x)
  ((iterative-improve close-enough? (lambda (y)
				      (average y (/ x y))))
   1.0))

;(sqrt 2)
