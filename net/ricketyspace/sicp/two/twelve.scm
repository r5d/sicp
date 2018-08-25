;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two twelve)
  #:use-module (net ricketyspace sicp two seven)
  #:export (make-center-width
            make-center-percent
            center
            width
            percent))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (make-center-percent c p)
  (define (pof p c) (* c (/ p 100.0)))
  (make-interval (- c (pof p c))
                 (+ c (pof p c))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent i)
  (* (/ (width i) (center i)) 100))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> (percent (make-center-percent 45 15))
;;; $16 = 15.0
;;; scheme@(guile-user)> (percent (make-center-percent 40 16))
;;; $17 = 15.999999999999998
