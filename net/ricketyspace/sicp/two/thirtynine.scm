;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtynine)
  #:use-module (net ricketyspace sicp two thirtyeight)
  #:export (reverse-fr
            reverse-fl))

(define (reverse-fr sequence)
  (fold-right (lambda (x y) (append y (list x))) '() sequence))

(define (reverse-fl sequence)
  (fold-left (lambda (x y) (append (list y) x)) '() sequence))

;;;
;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,re (net ricketyspace sicp two thirtynine)
;;; scheme@(guile-user)> (reverse-fr '(1 2 3 4 5 6))
;;; $8 = (6 5 4 3 2 1)
;;; scheme@(guile-user)> (reverse-fl '(1 2 3 4 5 6))
;;; $9 = (6 5 4 3 2 1)
;;;
