;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtytwo)
  #:export (subsets))

(define (subsets s)
  "All subsets of a Set X (P) is the union of all subsets of CDR of
Set X (Q) and a subset R derived from the union of CAR X with each of
the subsets in Q."
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (item) (cons (car s) item)) rest)))))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtytwo)
;;; scheme@(guile-user)> (subsets '(1 2 3))
;;; $6 = (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
