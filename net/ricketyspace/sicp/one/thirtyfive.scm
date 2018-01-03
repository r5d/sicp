;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtyfive)
  #:export (golden-ratio))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio )
  (fixed-point  (lambda (x) (+ 1 (/ 1.0 x))) 1.0))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtyfive)
;;; scheme@(guile-user)> (golden-ratio)
;;; $1 = 1.6180327868852458

