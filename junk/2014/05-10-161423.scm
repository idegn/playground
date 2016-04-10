;;sicp 2.33
(define (accumulate op initial sequence)
  (print sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (mapp p sequence)
  (accumulate (lambda (x y)
		(cons (p x) y)) () sequence))

(define (hoge x) (* x 3))
;(print (mapp hoge (list 1 2 3 4)))
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;(print (append (list 1 2 3 4) (list 5 6 7 8)))
(define (lengthh sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

;(print (lengthh (list 1 1 1 2 3 4 5)))

;;sicp 2.34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))

;例えばx=2で, 1+3x+5x3+x5の計算は
;(print (horner-eval 2 (list 1 3 0 5 0 1)))

;;sicp 2.35
(define (count-leaves t)
  (accumulate +
	      0 (map (lambda (sub-tree)
		       (cond
			((null? sub-tree) 0)
			((pair? sub-tree) (count-leaves sub-tree))
			(else 1))) t)))
;(print (count-leaves (list 1 2 3 4 (list 5 6 7) (list 8 9 10))))








;;sicp 2.36
(define (accumulate-n op init seqs)
  (print seqs " " init)
  (if (null? (car seqs))
      ()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;(22 26 30)
;(print (accumulate-n + 0 s))

;;sicp 2.37
(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
(define m1 (list (list 1 1 1 1) (list 2 2 2 2) (list 3 3 3 3)))
(define v (list 1 2 3 4))
(define v1 (list 3 3 3 3))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (u) (dot-product u v)) m))

(define (transpose mat)
  (accumulate-n cons () mat))

(define m2 (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
;(print (transpose m2))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector n v)) m)))

;; (define m3 (list (list 1 1 1) (list 2 2 2) (list 3 3 3)))
;; (print "m3:" m3)
;; (define m4 (list (list 1 2 3) (list 1 2 3) (list 1 2 3)))
;; (print "m4:" m4)
;; (print "tm4"(transpose m4))
;; (print (matrix-*-matrix m3 m3))
;(dot-product v w) ;総和∑i vi wiを返す

;(matrix-*-vector m v) ;ti =∑j mij vjであるようなベクタtを返す

;(matrix-*-matrix m n) ;pij=∑k mik nkjであるようなマトリックスpを返す

;(transpose m) ;nij=mjiであるようなマトリックスnを返す.

;;sicp 2.38
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define fold-right accumulate)

;; (print "1:" (fold-right / 1 (list 1 2 3)))
;; (print "2:" (fold-left / 1 (list 1 2 3)))
;; (print "3:" (fold-right list () (list 1 2 3)))
;; (print "4:" (fold-left list () (list 1 2 3)))

;;sicp 2.39
(define (r-reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) () sequence))

(define (l-reverse sequence)
  (fold-left (lambda (x y) (append (list y) x)) () sequence))

(define hoge (list 1 2 3 4 5))
;(print (l-reverse hoge))

