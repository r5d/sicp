;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one twentyseven)
  #:use-module (srfi srfi-1)
  #:export (carmichael-numers-fool-fermat-test?))

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
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (carmichael-numers-fool-fermat-test?)
  "Returns #t if all `carmichael-numbers` pass (fool) the fermat test."
  (let* ((fooled-test? (lambda (n) (fast-prime? n 100000)))
        (fooled? (lambda (result) (eq? result #t)))
        (results (map fooled-test? carmichael-numbers)))
    (every fooled? results)))
