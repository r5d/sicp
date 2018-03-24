;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.
;;;;

(define-module (net ricketyspace sicp one fortythree)
  #:use-module (net ricketyspace sicp one fortytwo)
  #:export (repeated square))

(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        (else (sicp-compose f (repeated f (1- n))))))

(define (square x) (* x x))

;;; GNU Guile REPL
;;;
;;; scheme@(guile-user)> ,re (net ricketyspace sicp one fortythree)
;;; scheme@(guile-user)> ((repeated square 1) 5)
;;; $7 = 25
;;; scheme@(guile-user)> ((repeated square 2) 5)
;;; $8 = 625
;;; scheme@(guile-user)> ((repeated square 3) 5)
;;; $9 = 390625
