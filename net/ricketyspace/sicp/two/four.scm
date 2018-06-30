;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two four)
  #:export (sicp-cons sicp-car sicp-cdr))

(define (sicp-cons x y)
  (lambda (m) (m x y)))

(define (sicp-car z)
  (z (lambda (p q) p)))

(define (sicp-cdr z)
  (z (lambda (p q) q)))
