;;sicp 2.24 ノートでやった

;;sicp 2.25

;; (define x (list 1 3 (list 5 7) 9))
;; (print x)
;; (print (car (cdaddr x)))


;; (define y (list (list 7)))
;; (print y)
;; (print (caar y))

;; (define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
;; (print z)
;; (print (cadadr (cadadr (cadadr z))))

;;sicp 2.26
;; (define x (list 1 2 3))
;; (define y (list 4 5 6))

;; (print (append x y))
;; (print (cons x y))
;; (print (list x y))

;sicp 2.27

(define (deep-rev b)
  (define (iter a r)
    (cond
     ((null? a) r)
     ((list? (car a)) (iter (cdr a) (cons (deep-rev (car a)) r)))
     (else
      (iter (cdr a) (cons (car a) r)))))
  
  (iter b ()))

;; (define x (list (list 1 2) (list 3 4)))
;; (print x)
;; (print (deep-rev x))









;;sicp 2.28
(define x (list (list 1 2) (list 3 4)))

(define (fringe a)
;  (print a)
  (cond
   ((null? a) ())
   ((list? a) (append (fringe (car a)) (fringe (cdr a))))
   (else (list a))
   ))

;; (print (fringe x))
;; (print (fringe (list x x)))

;;sicp 2.29
;;a.
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))
(define (right-branch m)
  (cadr m))
  
(define (branch-length b)
  (car b))
(define (branch-structure b)
  (cadr b))
;;b. ;;間違った
;; (define (total-weight m)
;;   (print m)
;;   (cond
;;    ((null? m) 0)    
;;    ((list?  m) ;;きもい
;;     (if (list? (car m))
;; 	(+ (total-weight (car m)) (total-weight (cdr m)))
;; 	(if (= (length (cdr m)) 1)
;; 	    (begin
;; 	      (print "cdr:"(cdr m))
;; 	      (cadr m))
;; 	    (total-weight (cdr m)))	      	  
;; 	  ))
;;    ))

;; (define b1 (make-branch 1 1))
;; (print "b1:" (total-weight b1))
;; (define b2 (make-branch 2 4))
;; (print "b2:" (total-weight b2))
;; (define m (make-mobile b1 b2))
;; (print "m:" (total-weight m))
;; (define m2 (make-mobile m b1))
;; (print "m2:" (total-weight m2))
;; (define m3 (make-mobile m2 m))
;; (print "m3:"(total-weight m3))

;;ぱくってきた
;枝の重さを計算
(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (number? structure)
	structure
	(mobile-weight structure))))

;１つのモービルの重さを計算
(define (mobile-weight mobile)
  (print mobile)
  (let ((left (left-branch mobile))
	(right (right-branch mobile)))
    (+ (branch-weight left)
       (branch-weight right))))

;全重量を計算
(define (total-weight mobile)
  (mobile-weight mobile))

;;c. akirame
;; (define (balanced? m)
;;   (cond
;;    ((null? m) #t)
;;    ((list? m)
;;     (if (list? (car m))
;; 	(and (balanced? (car m)) (balanced? (cdr m)))
;; 	(if (= (length (cdr m)) 1)
;; 	    (* (car m) (cadr m))
;; 	    (balanced? (cdr m)))	      	  
;; 	  )
;;     )
;;    ))


;;ぱくってきた
(define (balanced? m)
  (define (branch-balance b)
    (* (branch-length b) (branch-weight b)))
  (if (not (pair? m))
      #t
      (let ((l (left-branch m))
            (r (right-branch m)))
        (and (= (branch-balance l)
                (branch-balance r))
             (balanced? (branch-structure l))
             (balanced? (branch-structure r))))))

;;d. 読んだだけ

;;sicp2.30
(define (square x) (* x x))

(define (square-tree tree)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	     (square-tree sub-tree)
	     (square sub-tree)))
       tree))

(define (square-tree-rec tree)
  (cond
   ((null? tree) ())
   ((pair? tree) (cons (square-tree-rec (car tree)) (square-tree-rec (cdr tree))))
   (else (square tree))
   )
  )

;; (print (square-tree-rec
;; 	(list 1
;; 	      (list 2 (list 3 4) 5)
;; 	      (list 6 7))))
;(1 (4 (9 16) 25) (36 49))



;;sicp 2.31
(define (tree-map f tree)
  (map (lambda (sub-tree) 
	 (if (pair? sub-tree)
	     (tree-map f sub-tree)
	     (f sub-tree)))
       tree))

(define (square-tree-abs tree) (tree-map square tree))

;; (print (square-tree-abs
;; 	(list 1
;; 	      (list 2 (list 3 4) 5)
;; 	      (list 6 7))))

;;sicp 2.32 答えみた
(define (subsets s)
  (if (null? s)
      (list ())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

;(print (subsets (list 1 2 3)))


