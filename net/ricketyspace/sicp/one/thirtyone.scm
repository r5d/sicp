;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtyone)
  #:export (product factorial pi))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (let ((term (lambda (x) x))
        (next (lambda (x) (1+ x))))
    (product term 1 next n)))

(define (pi precision)
  (let* ((n (lambda (x) (* (+ (quotient x 2) 1) 2))) ; numerator of term.
         (d (lambda (x) (+ (* (quotient (1+ x) 2) 2) 1))) ; denominator of term.
         (term (lambda (x) (/ (* (n x) 1.0) (* (d x) 1.0))))
         (next (lambda (x) (1+ x))))
    (* (product term 1 next precision) 4)))

;;; Guile REPL
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtyone)
;;; scheme@(guile-user)> (factorial 5)
;;; $9 = 120
;;; scheme@(guile-user)> (factorial 10)
;;; $7 = 3628800
;;; scheme@(guile-user)> (factorial 20)
;;; $8 = 2432902008176640000
;;; scheme@(guile-user)> (pi 1000)
;;; $10 = 3.143160705532257
;;; scheme@(guile-user)> (pi 10000)
;;; $11 = 3.1417497057379635
;;; scheme@(guile-user)> (pi 100000)
;;; $12 = 3.1416083612780903
;;; scheme@(guile-user)> (pi 1000000)
;;; $13 = 3.1415942243828017


