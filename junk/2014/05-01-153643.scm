;;sicp 1.15
(define (cube x) (* x x x))

(define (p x)  
   (- (* 3 x) (* 4 (cube x)))
  )

(define (sine angle)
  (print angle)
   (if (not (> (abs angle) 0.1))
       angle
       (p (sine (/ angle 3.0)))
       )
   )

;;sicp 1.16
(define (square n)
  (* n n))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

(define (it-expt b n)
  (it-fast-expt 1 b n))

(define (it-fast-expt a b n)
  (cond ((= n 0) a)
      ((even? n) (it-fast-expt a (square b) (/ n 2)))
      (else (it-fast-expt (* a b) (square b) (floor (/ n 2)))
	    )
      )
  )

;;sicp 1.17
;; (define (* a b)
;;   (if (= b 0)
;;       0
;;       (+ a (* a (- b 1)))))

;;このアルゴリズムはbに線形のステップ数をとる. 加算の他に整数を二倍する
;;double演算と(偶数の)整数を2で割るhalve演算もあるとしよう. これらを
;;使い, fast-exptと類似の対数的ステップ数の乗算手続きを設計せよ. 

(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (mul a b)
  (print a " " b)
  (cond ((= b 0) 0)
	((even? b) (mul (double a) (halve b)))
	(else (+ a (mul (double a) (floor (halve b)))))
	)
  )

;;sicp 1.18
(define (it-mul a b)
  (it-mul-iter 0 a b)
  )

(define (it-mul-iter x a b)
  (print x " " a " " b)
  (cond ((= b 0) x)
	((even? b) (it-mul-iter x (double a) (halve b)))
	(else (it-mul-iter (+ x a) (double a) (floor (halve b))))
   )
  )


