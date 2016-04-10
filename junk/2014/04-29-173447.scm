;;sicp 1.11

;;n<3に対してf(n)=n, n ≥ 3に対してf(n)=f(n - 1) + 2 f(n - 2) + 3 f(n - 3)なる規則で定義する関数fがある.
;;再帰的プロセスの方法でf を計算する手続きを書け. 反復的プロセスの方法でfを計算する手続きを書け.
(define (fr n)  
  (if (< n 3) n
      (+
       (fr (- n 1))
       (* 2 (fr (- n 2)))
       (* 3 (fr (- n 3))))  
      )
  )

(define (fi n)
  (if (< n 3) n
      (fi-iter 2 1 0 n)
      )
  )

(define (fi-iter x y z n)
  (if (< n 4)
      (+ x (* 2 y) (* 3 z))
      (fi-iter (+ x (* 2 y) (* 3 z)) x y (- n 1))
      )
  )

;;109834719327491

(define (pascal n k)
  (if (or (<= k 1) (<= n k))
      1
      (+ (pascal (- n 1) (- k 1))
	 (pascal (- n 1) k)
	 )
      )
  )
