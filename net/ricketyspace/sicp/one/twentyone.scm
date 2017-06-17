;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one twentyone)
  #:export (sm-divisor-of-199
            sm-divisor-of-1999
            sm-divisor-of-19999))

(define (small-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x)
  (expt x 2))

(define (sm-divisor-of-199)
  (small-divisor 199))

(define (sm-divisor-of-1999)
  (small-divisor 1999))

(define (sm-divisor-of-19999)
  (small-divisor 19999))

;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one twentyone)
;;; ...
;;; scheme@(guile-user)> (sm-divisor-of-199)
;;; $3 = 199
;;; scheme@(guile-user)> (sm-divisor-of-1999)
;;; $4 = 1999
;;; scheme@(guile-user)> (sm-divisor-of-19999)
;;; $5 = 7
;;;
