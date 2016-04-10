;;sicp 2.67
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (leaf? object)
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4);0
                  (make-code-tree
                   (make-leaf 'B 2);10
                   (make-code-tree (make-leaf 'D 1);110
                                   (make-leaf 'C 1)))));111

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))


;(print (decode sample-message sample-tree))

;;sicp 2.68 あきらめ、答えみた
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

;; (define (encode-symbol x tree)
;;   (define (encode-symbol-rec sub-tree)
;;     (if (leaf? sub-tree)
;; 	(if (= x (symbols sub-tree)
;; 	       (list ))))
;;     (let (encode-symbol-rec ))
;;     ))

(define (encode-symbol symbol tree)
  (define (enc-iter tree)
    (if (leaf? tree)
        '()
        (if (memq symbol (symbols (left-branch tree)))
            (cons 0 (enc-iter (left-branch tree)))
            (cons 1 (enc-iter (right-branch tree))))))
  (if (memq symbol (symbols tree))
      (enc-iter tree)
      (error "Not Found symbol of " symbol)))

;(print (encode '(A D A B B C A) sample-tree))

;;sicp 2.69
(define (adjoin-set x set)
  ;; (print "x:"x " set:" set)
  ;; (if (not (null? set))
  ;;     (print (caddar set))
  ;;     (print set))
  (cond ((null? set) (list x))
	;((= (car set) x) set)
	((< (caddar set) (caddr x)) (cons (car set) (adjoin-set x (cdr set))))
	(else (cons x set))))

;((A 4) (B 2) (C 1) (D 1))
(define (make-leaf-set pairs)
  ;(print "mls:" pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)    ; 記号
                               (cadr pair))  ; 頻度
                    (make-leaf-set (cdr pairs))))))


;(print (make-leaf-set '((A 4) (B 2) (C 1) (D 1))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;;adjoin前の項からもってきたせいでadjoinださいうえに
;;successiveもださい
;;結合順正しいか怪しい
;; (define (successive-merge leaf-set)
;;   (define (s-m-iter l-s res)
;;     (print (length l-s))
;;     (if
;;      ;(= (length l-s) 1) res
;;      (null? l-s)res
;;      (s-m-iter (cdr l-s) (make-code-tree (car l-s) res))
;;      ))
;;   (s-m-iter (cdr leaf-set) (car leaf-set)))

;;この項のadjoin使った版 ぱくってきた
(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))
(define (successive-merge pairs)
  (if (null? (cdr pairs))
      (car pairs)
      (successive-merge
        (adjoin-set
          (make-code-tree (car pairs) (cadr pairs))
          (cddr pairs)))))

;; (print (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1))))
;; (print sample-tree)
(print (generate-huffman-tree '((A 4) (B 2))))
;;sicp 2.70
(define lock (generate-huffman-tree '((A 2) (NA 16) (BOOM 1) (SHA 3) (GET 2) (YIP 9)(JOB 2)(WAH 1))))


;; (print (length (encode '(GET A JOB
;; SHA NA NA NA NA NA NA NA NA
;; GET A JOB
;; SHA NA NA NA NA NA NA NA NA
;; WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
;; SHA BOOM) lock)))
;; (print (* 3(length '(GET A JOB
;; SHA NA NA NA NA NA NA NA NA
;; GET A JOB
;; SHA NA NA NA NA NA NA NA NA
;; WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
;; SHA BOOM))))

;;sicp 2.72 読んだだけ
;;最高頻度:1
;;最低頻度:n回、オーダーnの処理(説の存在の確認)を繰り返すのでn^2
