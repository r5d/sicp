;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.
;;;;

(define-module (net ricketyspace sicp one fortysix)
  #:export (fixed-point fp-sqrt))

(define (iterative-improve good-enough? improve)
  (define (try guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (try next))))
  try)

(define (fixed-point f guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  ((iterative-improve close-enough? f) guess))

(define (fp-sqrt x)
  (define (average x y) (/ (+ x y) 2.0))
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
