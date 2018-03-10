;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one fortyone)
  #:export (double inc))

(define (double func)
  (lambda (x) (func (func x))))

(define (inc x) (1+ x))

;;; GNU Guile REPL

;;; scheme@(guile-user)> ,use (net ricketyspace sicp one fortyone)
;;; scheme@(guile-user)> (((double (double double)) inc) 5)
;;; $9 = 21

