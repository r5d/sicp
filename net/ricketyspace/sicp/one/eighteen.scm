;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one eighteen)
  #:use-module (net ricketyspace sicp one seventeen)
  #:export (ifast-*))

(define (ifast-iter-* a b n)
  (cond ((= b 0) n)
        ((even? b) (ifast-iter-* (double a) (halve b) n))
        (else (ifast-iter-* a (- b 1) (+ a n)))))

(define (ifast-* a b)
  "Compute A * B.

Iterative version of fast-*."
  (ifast-iter-* a b 0))
