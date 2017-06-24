;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one twentytwo)
  #:use-module (net ricketyspace sicp utils)
  #:export (timed-prime-test
            search-for-primes))

(define (square x)
  (expt x 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time) #t)

(define (odd-and-prime n)
  (and (odd? n) (timed-prime-test n)))

(define (search-for-primes start end)
  (cond ((> start end) '())
        ((odd-and-prime start)
         (cons start (search-for-primes (1+ start) end)))
        (else (search-for-primes (1+ start) end))))
