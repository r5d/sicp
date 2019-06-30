;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twentyeight)
  #:export (fringe))

(define (fringe x)
  (cond ((null? x) '())
        ((not (pair? x)) (list x))
        (else (append (fringe (car x))
                      (fringe (cdr x))))))


;;; Guile REPL

;;; scheme@(guile-user)> ,use (net ricketyspace sicp two twentyeight)
;;; scheme@(guile-user)> (define x (list (list 1 2) (list 3 4)))
;;;
;;; scheme@(guile-user)> (fringe x)
;;; $12 = (1 2 3 4)
;;; scheme@(guile-user)> (fringe (list x x))
;;; $13 = (1 2 3 4 1 2 3 4)
