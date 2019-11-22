;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtyfour)
  #:export (horner-eval))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
  (accumulate (λ (this-coeff higher-terms)
                (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtyfour)
;;; scheme@(guile-user)> (horner-eval 2 (list 1 3 0 5 0 1))
;;; $2 = 79
;;;
