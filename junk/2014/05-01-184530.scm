;;sicp 1.19 1.20 ;;電車で飛ばした

(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
              (+ (* a 1000000) b)))

;;sicp 1.21
(define (square n)
  (* n n))

(define (smallest-divisor n)
  (find-divisor n 2))


;; (define (find-divisor n test-divisor)
;;   (cond ((> (square test-divisor) n) n)
;;         ((divides? test-divisor n) test-divisor)
;;         (else (find-divisor n (+ test-divisor 1)))))


(define (divides? a b)
  (= (remainder b a) 0))

;;sicp 1.22
(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (begin
	(report-prime (- (runtime) start-time))
	#t)
      (begin
	(newline)
	#f)
      ))

(define (report-prime elapsed-time)
  (display " *** ")
  (print elapsed-time))


(define (search-for-primes n)
  (if (even? n)
      (search-for-primes-iter (+ n 1) 3)
      (search-for-primes-iter n 3)
      )
  )

(define (search-for-primes-iter n count)
  (if (not (= count 0))
      (search-for-prime n count)
      (newline)
      )
  )

(define (search-for-prime n count)
  (if (timed-prime-test n) ;(prime? n) ;;FIXME
      (search-for-primes-iter (+ n 2) (- count 1))
      (search-for-prime (+ n 2) count)
      )
  )

;;sicp 1.23
(define (next n)
  (if (= n 2)
      3
      (+ n 2)
      )
  )

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))


;; (search-for-primes 1000)
;; (search-for-primes 10000)
;; (search-for-primes 100000)

;;sicp 1.24
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         ;; (remainder (square (expmod base (/ exp 2) m))
         ;;            m))
         (remainder (* (expmod base (/ exp 2) m)
		       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(use srfi-27)
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (fast-timed-prime-test n)
  (display n)
  (fast-start-prime-test n (runtime))
  )

(define (fast-start-prime-test n start-time)
  (if (fast-prime? n 10)
      (begin
	(report-prime (- (runtime) start-time))
	#t)
      (begin
	(newline)
	#f)
      ))

(define (fast-search-for-primes n)
  (if (even? n)
      (fast-search-for-primes-iter (+ n 1) 3)
      (fast-search-for-primes-iter n 3)
      )
  )

(define (fast-search-for-primes-iter n count)
  (if (not (= count 0))
      (fast-search-for-prime n count)
      (newline)
      )
  )

(define (fast-search-for-prime n count)
  (if (fast-timed-prime-test n) ;(prime? n) ;;FIXME
      (fast-search-for-primes-iter (+ n 2) (- count 1))
      (fast-search-for-prime (+ n 2) count)
      )
  )

(fast-search-for-primes-iter 1001 12)
(search-for-primes-iter 1001 12)

;;sicp 1.25
;;A. 答えは変わらないが巨大な数の余剰計算(remainder)は時間がかかるので遅い
