;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirty)
  #:export (sum))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

;;; GNU Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirty)
;;; scheme@(guile-user)> (define (inc n) (+ n 1))
;;; scheme@(guile-user)> (define (cube x) (* x x x))
;;; scheme@(guile-user)> (sum cube 1 inc 10)
;;; scheme@(guile-user)> (define (pi-sum a b)
;;;   (define (pi-term x)
;;;     (/ 1.0 (* x (+ x 2))))
;;;   (define (pi-next x) (+ x 4))
;;; (sum pi-term a pi-next b))
;;; scheme@(guile-user)> (* 8 (pi-sum 1 1000))
;;; $9 = 3.139592655589782
;;;
