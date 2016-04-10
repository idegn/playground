(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)        
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;;sicp 2.59
(define (union-set set1 set2)
  ;(print "u-s:"set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1)
		    (union-set (cdr set1) set2)))))


;; (print (union-set '(a b c d e f) '(a b c d e f g h i j)))
;; (print (union-set '(a b c d e f) '(h i j)))
;; (print (union-set '(a) '(b)))
;; (print (union-set '(a) '()))
;; (print (union-set '(f g h) '(a b c d e f)))

;;sicp 2.60
;(define (element-of-set? x set)) そのまま
(define (adjoin-set x set)
  (cons x set))
(define (union-set set1 set2)
  (append set1 set2))
;(define (intersection-set set1 set2)) そのまま








;;sicp2.61
(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((= (car set) x) set)
	((< (car set) x) (cons (car set) (adjoin-set x (cdr set))))
	(else (cons x set))))

;(print (adjoin-set (list 1 2 3 4 5)))

;;sicp 2.62
(define (union-set set1 set2)
    (cond ((null? set1) set2)
	  ((null? set2) set1)
	  ((= (car set1)(car set2)) (cons (car set1) (union-set (cdr set1) (cdr set2))))
	  ((< (car set1)(car set2)) (cons (car set1) (union-set (cdr set1) set2)))
	  (else (cons(car set2) (union-set set1 (cdr set2))))
	  ))
      
;(print (union-set () (list 3 4 5)))

;;sicp 2.63
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (entry set)) true)
        ((< x (entry set))
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))
(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set))
         (make-tree (entry set) 
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))



(define t1 (adjoin-set 11 (adjoin-set 5 (adjoin-set 1 (adjoin-set 9 (adjoin-set 3 (adjoin-set 7 ())))))))
(define t2 (adjoin-set 11 (adjoin-set 9 (adjoin-set 5 (adjoin-set 7 (adjoin-set 1 (adjoin-set 3 ())))))))
(define t3 (adjoin-set 11(adjoin-set 7 (adjoin-set 1 (adjoin-set 9 (adjoin-set 3 (adjoin-set 5 ())))))))


(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

;; (print t1)
;; (print (tree->list-1 t1))
;; (print (tree->list-2 t1))
;; (newline)
;; (print t2)
;; (print (tree->list-1 t2))
;; (print (tree->list-2 t2))
;; (newline)
;; (print t3)
;; (print (tree->list-1 t3))
;; (print (tree->list-2 t3))

;;sicp 2.64 読んだだけ
(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))
;(print (list->tree (list 1 3 5 7 9 11)))

;;sicp 2.65
(define (b-union-set set1 set2)
  (list->tree (union-set (tree->list-2 set1) (tree->list-2 set2))))
(define (b-intersection-set set1 set2)
  (list->tree (intersection-set (tree->list-2 set1) (tree->list-2 set2))))

;;sicp 2.66
(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
        ((equal? given-key (key (car set-of-records)))
         (car set-of-records))
        (else (lookup given-key (cdr set-of-records)))))

(define (o-lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
	((= given-key (key set-of-records)) (entry set-of-records))
	((< given-key (key set-of-records)) (o-lookup given-key (left-branch set-of-records)))
	(else (o-lookup given-key (right-branch set-of-records)))
   ))
