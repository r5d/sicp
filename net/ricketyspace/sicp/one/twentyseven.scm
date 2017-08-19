;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one twentyseven)
  #:use-module (srfi srfi-1)
  #:export (carmichael-numbers-fool-fermat-test?))

(define carmichael-numbers '(561 1105 1729 2465 2821 6601))

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (pass? a)
    (= (expmod a n n) a))
  (fold (lambda (a p) (and (pass? a) p)) #t (iota (1- n) 1)))

(define (prime? n)
  (if (fermat-test n) #t #f))

(define (carmichael-numbers-fool-fermat-test?)
  "Returns #t if all `carmichael-numbers` pass (fool) the fermat test."
  (define (fooled-test? n) (prime? n))
  (fold (lambda (n p) (and (fooled-test? n) p)) #t carmichael-numbers))
