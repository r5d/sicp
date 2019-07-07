;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twentynine)
  #:export (make-mobile
            make-branch
            left-branch
            right-branch
            branch-length
            branch-structure
            total-weight))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (total-weight mobile)
  (define (branch-weight b)
    (let ((bs (branch-structure b)))
      (cond ((not (pair? bs)) bs)
            (else (branch-weight bs)))))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,re (net ricketyspace sicp two twentynine)
;;; scheme@(guile-user)> (make-mobile (make-branch 3 45) (make-branch 4 (make-branch 5 50)))
;;; $4 = ((3 45) (4 (5 50)))
;;; scheme@(guile-user)> (left-branch $4)
;;; $5 = (3 45)
;;; scheme@(guile-user)> (right-branch $4)
;;; $6 = (4 (5 50))
;;; scheme@(guile-user)> (branch-length (left-branch $4))
;;; $7 = 3
;;; scheme@(guile-user)> (branch-structure (left-branch $4))
;;; $8 = 45
;;; scheme@(guile-user)> (branch-length (right-branch $4))
;;; $9 = 4
;;; scheme@(guile-user)> (branch-structure (right-branch $4))
;;; $10 = (5 50)
;;; scheme@(guile-user)> (branch-length (branch-structure (right-branch $4)))
;;; $11 = 5
;;; scheme@(guile-user)> (branch-structure (branch-structure (right-branch $4)))
;;; $12 = 50
;;; scheme@(guile-user)> (total-weight $4)
;;; $14 = 95

