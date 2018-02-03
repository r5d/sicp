;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtyeight)
  #:use-module (net ricketyspace sicp one thirtyseven)
  #:export (euler-minus-2))

(define (euler-minus-2)
  (define (n i) 1.0)
  (define (d i) (cond ((= i 1) 1)
                      ((= (remainder i 3) 2) (* (+ (quotient i 3) 1) 2))
                      (else 1)))
  (cont-frac-rec n d 21))

;;; Guile REPL
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtyeight)
;;; scheme@(guile-user)> (euler-minus-2)
;;; $25 = 0.7182818284590453
