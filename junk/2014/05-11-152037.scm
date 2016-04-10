;;sicp 2.40
;; prime start
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
;;prime end
(define (accumulate op initial sequence)
  ;(print sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      ()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append () (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

;; (define (prime-sum-pairs n)
;;   (map make-pair-sum
;;        (filter prime-sum?
;;                (flatmap
;;                 (lambda (i)
;;                   (map (lambda (j) (list i j))
;;                        (enumerate-interval 1 (- i 1))))
;;                 (enumerate-interval 1 n)))))

;(print (prime-sum-pairs 5))

(define (unique-pairs n)
  (flatmap (lambda (i) (map (lambda (j) (list i j))
			    (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n)))

;(print (unique-pairs 4))
(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (unique-pairs n))))

;;(print (prime-sum-pairs 5))

;;sicp 2.41
(define (permutations s)
  (if (null? s)                    ; 空集合?
      (list ());(list nil)                   ; 空集合を含むリスト
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (unique-triad n)
  (flatmap (lambda (k)
	     (map (lambda (l)
		    (append k (list l))) (enumerate-interval 1 (- (cadr k) 1))))
	   (flatmap (lambda (i) (map (lambda (j) (list i j))
				     (enumerate-interval 1 (- i 1))))
		    (enumerate-interval 1 n))))

(define (unique-triad-sum n s)
  (map permutations (filter (lambda (a)
			      (if (= s (+ (car a) (cadr a) (caddr a)))
				  #t
				  #f) 
			     ) (unique-triad n))))

;(print (unique-triad 5))
;(print (unique-pairs 4))
;(print (unique-triad 4))
;(print (enumerate-interval 1 3))

;;sicp 2.42
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) ;(newline)(print "call:safe?")
		 (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
		   ;(print new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define empty-board ())

(define (adjoin-position new-row k rest-of-queens)
  ;(print k " " new-row)
  ;(print "(a-p)r-o-q: " rest-of-queens)
  ;(append rest-of-queens (list (list new-row k)))
  (cons (list new-row k) rest-of-queens)
  )

(define (safe? k positions)
  ;(print positions)
  (let ((s (caar positions)))
    (define (iter c pos)
      ;(print pos)
      (let ((lu (- s c))
	    (ll (+ s c))
	    (crow (- k c)))
	(define (lu-chk u)
	  (and (= (car u) lu) (= (cadr u) crow)))
	  ;; (if (and (< 0 lu) (< 0 crow))
	  ;;     #f
	  ;;     (or (= (car u) lu) (= (cadr u) crow)))
	(define (ll-chk u)
	  (and (= (car u) ll) (= (cadr u) crow)))
	  ;; (if (and (<= ll 4) (< 0 crow))
	  ;;     #f
	  ;;     (or (= (car u) ll) (= (cadr u) crow))))
	      
	;(print "k: "k ", pos: "pos)
	(if (or (null? pos) (= k 1))
	    #t
	    (let ((t (car pos)))
	      (if (or (= s (car t)) (lu-chk t) (ll-chk t));(or (= k (car t)) (= k (cadr t)))
		  #f
		  (begin
		    ;(print "#f:"(cdr pos))
		    (iter (+ c 1) (cdr pos))))))))
    (iter 1 (cdr positions))))

;(print (queens 3))
;(print (queens 10))
(print (length (queens 8)))

;; (flatmap
;;  (lambda (rest-of-queens)
;;    (map (lambda (new-row)
;; 	  (adjoin-position new-row k rest-of-queens))
;; 	(enumerate-interval 1 board-size)));;すべての行の数字
;;  (queen-cols (- k 1)))
;;それまでの大丈夫だった置き方

;;sicp 2.43読んだだけ

;;sicp 2.44 やってない ;;2.2.4項 まるごと流し読みしただけ
