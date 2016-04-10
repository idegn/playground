;• 変数は記号とする. 基本手続き symbol?で識別出来る:
(define (variable? x) (symbol? x))

;• 二つの変数はそれを表現している記号がeq?なら同じである:
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

;• 和は最初の要素が記号+であるリストである:
(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

;• 加数は和のリストの第二項である:
(define (addend s) (cadr s))

;• 被加数は和のリストの第三項である:
(define (augend s) (caddr s))

;• 積は最初の要素が記号*であるリストである:
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

;• 乗数は積のリストの第二項である:
(define (multiplier p) (cadr p))

;• 被乗数は積のリストの第三項である:
(define (multiplicand p) (caddr p))

;• 和と積はリストとして構成する:
(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))





;;sicp 2.56
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base x) (cadr x))
(define (exponent x) (caddr x))
(define (make-exponentiation e1 e2)
  (cond ((=number? e2 0) 1)
	((=number? e2 1) e1)
	;((and (number? e1) (number? e2)) )
	(else (list '** e1 e2))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
	((exponentiation? exp)
	 (make-product 
	  (make-product (exponent exp)
			(make-exponentiation (base exp)
					     (- (exponent exp) 1)))
	  (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

;(print (deriv '(+ x 3) 'x))
;1

;(print (deriv '(* x y) 'x))
;y

;(print (deriv '(* (* x y) (+ x 3)) 'x))
;(+ (* x y) (* y (+ x 3)))
;(print (deriv '(** x 4) 'x))

;;sicp2.57 答え見た
; 任意個の項の和を扱えるようにした被加数
(define (augend s)
  (if (null? (cdddr s))
      (caddr s)
      (cons '+ (cddr s))));;複数個あったらそれをまるごと'(+ .. ..)化する
; 任意個の項の積を扱えるようにした被乗数
(define (multiplicand p)
  (if (null? (cdddr p))
      (caddr p)
      (cons '* (cddr p))));;

;(print (deriv '(* (+ x y z) x) 'x))
;; (print (deriv '(+ (** x 5) (** x 4) (** x 3)) 'x))
;; (print (deriv '(* (* x y) (+ x 3)) 'x))
;; (print (deriv '(* x y (+ x 3)) 'x))
;; (print (deriv '(* x x x) 'x))
;; (print (deriv '(* x x x x) 'x))
;; (print (deriv '(* x x x x x) 'x))

;;sicp2.58
;;a.
(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s) (caddr s))
(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 '+ a2))))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))

;(print (deriv '(x + (3 * (x + (y + 2)))) 'x))
;(print (deriv '(x * (x * x)) 'x))

;;b. 読んだだけ
