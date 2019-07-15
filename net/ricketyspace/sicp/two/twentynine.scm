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

(define (branch-weight b)
  (let ((bs (branch-structure b)))
    (cond ((not (pair? bs)) bs)
          (else (+ (branch-weight (left-branch bs))
                   (branch-weight (right-branch bs)))))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> (make-mobile
;;;                        (make-branch 3 45)
;;;                        (make-branch 4
;;;                                     (make-mobile (make-branch 5 50)
;;;                                                  (make-branch 1 20))))
;;; $11 = ((3 45) (4 ((5 50) (1 20))))
;;; scheme@(guile-user)> (left-branch $11)
;;; $12 = (3 45)
;;; scheme@(guile-user)> (right-branch $11)
;;; $13 = (4 ((5 50) (1 20)))
;;; scheme@(guile-user)> (branch-length (left-branch $11))
;;; $14 = 3
;;; scheme@(guile-user)> (branch-structure (left-branch $11))
;;; $15 = 45
;;; scheme@(guile-user)> (branch-length (right-branch $11))
;;; $16 = 4
;;; scheme@(guile-user)> (branch-structure (right-branch $11))
;;; $17 = ((5 50) (1 20))
;;; scheme@(guile-user)> (branch-structure (right-branch $11))
;;; $18 = ((5 50) (1 20))
;;; scheme@(guile-user)> (left-branch (branch-structure (right-branch $11)))
;;; $19 = (5 50)
;;; scheme@(guile-user)> (right-branch (branch-structure (right-branch $11)))
;;; $20 = (1 20)
;;; scheme@(guile-user)> (total-weight $11)
;;; $21 = 115
