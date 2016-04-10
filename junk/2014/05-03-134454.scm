;;sicp1.33

;; 問題 1.33

;; 組み合せる項に フィルタ(filter)の考えを入れることで, accumulate(問題1.32)の更に一般的なものが得られる. つまり範囲から得られて, 指定した条件を満した項だけを組み合せる. 出来上ったfiltered-accumulate抽象は, accumulate と同じ引数の他, フィルタを指定する一引数の述語をとる. filtered-accumulateを手続きとして書け. filtered-accumulateを使い, 次をどう表現するかを示せ.

;; a. 区間a, bの素数の二乗の和(prime?述語は持っていると仮定する.)

;; b. nと互いに素で, nより小さい正の整数(つまりi < nでGCD(i, n)=1なる全整数i)の積

(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
	  (combiner (filtered-accumulate
	   filter combiner null-value term (next a) next b) (term a))
	  (filtered-accumulate
	   filter combiner null-value term (next a) next b)))
  )

(define (acc-q-pi n)
  (define (filter k) #t)
  (define (inc k) (+ k 1))
  (define (pi-term k)
    (/
     (+ (* (floor (/ (+ k 1) 2)) 2) 2)
     (+ (* (floor (/ k 2)) 2) 3)))

  (filtered-accumulate filter * 1 pi-term 0.0 inc n))

;(print (* (acc-q-pi 1000) 4))










;a.
;;cp start
(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))


(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))
;;cp end
(define (inc k) (+ k 1))

(define (sum-prime a b)
  (define (square k) (* k k))
  (filtered-accumulate prime? + 0 square a inc b))

;(print (sum-prime 2 10))

;;b. 
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity n) n)

(define (prod-gcd n)
  (define (gcd-one i) (= 1 (gcd i n)))
  (filtered-accumulate gcd-one * 1 identity 1 inc (- n 1)))

(print (prod-gcd 10))
