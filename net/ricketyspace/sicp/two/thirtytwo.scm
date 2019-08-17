;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtytwo)
  #:export (subsets))

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (item) (cons (car s) item)) rest)))))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtytwo)
;;; scheme@(guile-user)> (subsets '(1 2 3))
;;; $6 = (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
