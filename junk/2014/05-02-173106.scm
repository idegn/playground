;; (define (sum term a next b)
;;   (if (> a b)
;;       0
;;       (+ (term a)
;; 	 (sum term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
	result
        (iter (next a) (+ result (term a)))))
  (iter a 0))


(define (inc n)
  (+ n 1))

(define (cube n)
  (* n n n))

(define (simp f a b n)
  (let ((h
  	 (/ (- b a) n)
  	 ))
    
    (define (wf k) ;;(wf f k)にしたかったけど甘えた
      (let ((y
	     (f (+ a (* h k)))
	     ))
	(cond
	 ((or (= k 0) (= k n)) y)
	 ((even? k) (* y 2))
	 (else (* y 4))
	 )	
	)      
      )
    (* (/ h 3) (sum wf 0.0 inc n))
    )  
  )

(print (simp cube 0 1 100))
(print (simp cube 0 1 1000))

;;問題 1.29

;; Simpsonの公式は上に示したのより更に正確な数値積分法である. Simpsonの公式を使えば, aからbまでの関数fの積分は, 偶整数nに対し, h = (b - a)/nまたyk = f(a + kh)として
;; で近似出来る. (nの増加は近似の精度を増加する.) 引数としてf, a, bとnをとり, Simpson公式を使って計算した積分値を返す手続きを定義せよ. その手続きを使って(n = 100とn = 1000で)0から1までcubeを積分し, またその結果を上のintegral手続きの結果と比較せよ.

