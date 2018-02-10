;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtynine)
  #:use-module (net ricketyspace sicp one thirtyseven)
  #:export (tan-cf))

(define (tan-cf x k)
  (define (n i) (if (= 1 i) x (* -1 (expt x 2.0))))
  (define (d i) (1- (* 2.0 i)))
  (cont-frac-rec n d k))

;;; GNU Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtynine)
;;; scheme@(guile-user)> (tan-cf 45 1000)
;;; $39 = 1.6197751905438595
;;; scheme@(guile-user)> (tan-cf 90 1000)
;;; $40 = -1.9952004122082423
;;; scheme@(guile-user)> (tan-cf 135 1000)
;;; $41 = -0.08871575677005962
;;; scheme@(guile-user)> (tan-cf 180 1000)
;;; $42 = 1.3386902103511542
