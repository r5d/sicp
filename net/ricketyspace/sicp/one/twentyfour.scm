;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one twentyfour)
  #:use-module (srfi srfi-1)
  #:export (three-primes-gt-f
            three-primes-gt-1000-f
            three-primes-gt-10000-f
            three-primes-gt-100000-f
            three-primes-gt-1000000-f))

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (odd-and-prime n)
  (and (odd? n) (fast-prime? n (quotient n 2))))

(define (search-for-primes start end)
  (cond ((> start end) '())
        ((odd-and-prime start)
         (cons start (search-for-primes (1+ start) end)))
        (else (search-for-primes (1+ start) end))))

(define (three-primes-gt-f n)
  (three-primes-gt-iter n 10 '()))

(define (three-primes-gt-iter n e l)
  (cond ((> (length l) 3) (take l 3))
        (else (three-primes-gt-iter n
                                    (+ e 10)
                                    (search-for-primes n e)))))

(define (three-primes-gt-1000-f)
  (three-primes-gt 1000))

(define (three-primes-gt-10000-f)
  (three-primes-gt 10000))

(define (three-primes-gt-100000-f)
  (three-primes-gt 100000))

(define (three-primes-gt-1000000-f)
  (three-primes-gt 1000000))
