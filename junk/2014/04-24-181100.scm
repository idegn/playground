;;SICP 1.6 1.7 1.8
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (abs x)
  (cond ((< x 0) (- x))
        (else x)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (cublic-iter guess x)
  (print guess)
  (if (cublic-ge? guess x)
      guess
      (cublic-iter (cublic-improve guess x)
		   x)))

(define (cublic-ge? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001)


(define (cublic-improve guess x)
  (print guess)
  ;; (format #t "~D\n" guess)
  (/
   (+
    (/ x (square guess))
    (* 2 guess))
   3))  
