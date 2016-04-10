;; sicp 1.31
;;a. sum手続きは高階手続きとして書ける, 同様な数多い抽象の最も単純なものに過ぎない.51 与えられた範囲の点での関数値の積を返すproductという似た手続きを書け. productを使って, factorialを定義せよ. また式

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

;;b.
(define (it-product term a next b)
  (define (product-iter a result)
    (if (> a b)
	result
	(product-iter (next a) (* (term a) result))))
  
  (product-iter a 1))

(define (identity n) n)

(define (dec n) (- n 1))
(define (inc n) (+ n 1))

(define (factorial n) (product identity 1 inc n))

(define (q-pi n)
  (define (pi-term k)
    (/
     (+ (* (floor (/ (+ k 1) 2)) 2) 2)
     (+ (* (floor (/ k 2)) 2) 3)))

  (it-product pi-term 0.0 inc n))

;(print (* (q-pi 100000) 4))













;; sicp 1.32
;; a. sumと(問題1.31の)productは, 一般的なアキュムレーションの関数:

;; (accumulate combiner null-value term a next b)

;; を使い, 項の集りを組み合せるaccumulateという更に一般的なものの特殊な場合であることを示せ. accumulateは引数としてsumや productと同様, 項と範囲指定と, 先行する項のアキュムレーションと現在の項をどう組み合せるかを指定する(二引数の)combiner手続き, 項がなくなった時に使う値を指定するnull-valueをとる. accumulateを書き, sumやproductがaccumulateの単なる呼出しで定義出来ることを示せ.

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))


(define (it-accumulate combiner null-value term a next b)
  (define (it-accumulate-iter a result)
    (if (> a b)
	result
	(it-accumulate-iter (next a) (combiner (term a) result))))
  (it-accumulate-iter a 1))

(define (acc-q-pi n)
  (define (pi-term k)
    (/
     (+ (* (floor (/ (+ k 1) 2)) 2) 2)
     (+ (* (floor (/ k 2)) 2) 3)))

  (it-accumulate * 1 pi-term 0.0 inc n))


(print (* (acc-q-pi 1000000)4))
