;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtyeight)
  #:export (fold-left
            fold-right))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (fold-right op initial sequence)
  (accumulate op initial sequence))


(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtyeight)
;;; scheme@(guile-user)> (fold-right / 1.0 (list 1 2 3))
;;; $2 = 1.5
;;; scheme@(guile-user)> (fold-left / 1.0 (list 1 2 3))
;;; $12 = 0.16666666666666666
;;; scheme@(guile-user)> (fold-right list '() (list 1 2 3))
;;; $13 = (1 (2 (3 ())))
;;; scheme@(guile-user)> (fold-left list '() (list 1 2 3))
;;; $14 = (((() 1) 2) 3)
;;; scheme@(guile-user)> (fold-right * 1 (list 1 2 3))
;;; $19 = 6
;;; scheme@(guile-user)> (fold-left * 1 (list 1 2 3))
;;; $20 = 6
;;;
;;;
;;; Conclusion: When the result produced by applying `op` on
;;; `sequence` is independent of the order in which `op` is applied to
;;; each element of the `sequence` then fold-right and fold-left will
;;; yield the same result.
;;;
