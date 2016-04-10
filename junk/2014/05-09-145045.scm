;;sicp 2.17
(define (last-pair a)
  (if (null? (cdr a))
      (car a)
      (last-pair (cdr a))))

;(print (last-pair (list 23 72 149 34)))

;;sicp 2.18
(define (rev a)
  (if (null? a)
      a
      (append (rev (cdr a)) (list (car a)))))

;; (define (rev a)
;;   (define (iter a r)
;;     (if (null? a)
;; 	r
;; 	(iter (cdr a) (cons (car a) r))))
;;   (iter a ()))

;(print (rev (list 1 4 9 16 25)))


;;sicp 2.19
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

(define (first-denomination a)
  (car a))
(define (except-first-denomination a)
  (cdr a))
(define (no-more? a)
  (null? a))
  
;(print (cc 100 us-coins))




;;sicp 2.20
(define (same-parity x . a)
  ;;可変長の部分にリスト渡すとリストのリストになって再帰不可
  (define (same-parity-iter y b)
    (if (null? b)
	()
	(if (= 0 (remainder (- x (car b)) 2))
	    (append (list (car b)) (same-parity-iter x (cdr b)))
	    (same-parity-iter x (cdr b)))))
  (append (list x) (same-parity-iter x a)))

;; (define (same-parity x . a)
;;   (define judge? (if (even? x) even? odd?))
;;   (define (iter b r)
;;     (if (null? b)
;; 	r
;; 	(if (judge? (car b))
;; 	    (iter (cdr b) (append r (list (car b))))
;; 	    (iter (cdr b) r))))
;;   (iter a ()))

;; (print (same-parity 1 2 3 4 5 6 7))
;; (print (same-parity 2 3 4 5 6 7))

;;sicp 2.21
;; (define (square-list items)
;;   (if (null? items)
;;       ()
;;       (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))
;(print (square-list (list 1 2 3 4 5)))
;;sicp 2.22
(define (square-list-k items)
  (define (square x) (* x x))
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items ()))
;(print (square-list-k (list 1 2 3 4 5)))

;sicp 2.23
(define (for-each-k f a)
  (if (null? a)
      #f
      (begin
	(f (car a))
	(for-each-k f (cdr a)))))

(for-each-k (lambda (x) (display x) (newline))
	    (list 57 321 88))
