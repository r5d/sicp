;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.
;;;;

(define-module (net ricketyspace sicp one fortyfive)
  #:use-module (net ricketyspace sicp one fortythree)
  #:export (nth-root))

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

(define (average a b) (/ (+ a b) 2.0))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (log2 x) (/ (log x) (log 2.0)))

(define (nth-root n x)
  (let ((avg-dmp (repeated average-damp (floor (log2 n))))
        (func (lambda (y) (/ x (expt y (1- n))))))
    (fixed-point (avg-dmp func) 1.0)))

;;; GNU Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one fortyfive)
;;; scheme@(guile-user)> (nth-root 4 (expt 9 4))
;;; $68 = 9.0
;;; scheme@(guile-user)> (nth-root 10 (expt 9 10))
;;; $69 = 9.000001442413728
;;; scheme@(guile-user)> (nth-root 15 (expt 9 15))
;;; $70 = 8.999995679416626
;;; scheme@(guile-user)> (nth-root 16 (expt 9 16))
;;; $71 = 9.00000000000018
;;; scheme@(guile-user)> (nth-root 31 (expt 9 31))
;;; $72 = 9.000004691148337
;;; scheme@(guile-user)> (nth-root 32 (expt 9 32))
;;; $73 = 9.0
;;; scheme@(guile-user)> (nth-root 63 (expt 9 63))
;;; $74 = 8.999995131856686
;;; scheme@(guile-user)> (nth-root 64 (expt 9 64))
;;; $75 = 9.000000000000114
;;; scheme@(guile-user)> (nth-root 128 (expt 9 128))
;;; $76 = 9.000000000000083
;;; scheme@(guile-user)> (nth-root 255 (expt 9 255))
;;; $77 = 9.00000496391279
;;; scheme@(guile-user)> (nth-root 256 (expt 9 256))
;;; $78 = 9.000000000000018
;;;
