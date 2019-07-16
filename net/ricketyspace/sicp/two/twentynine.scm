;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twentynine)
  #:export (make-mobile
            make-branch
            left-branch
            right-branch
            branch-length
            branch-structure
            total-weight
            mobile-balanced?))

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

(define (has-submobile? branch)
  (not (number? (branch-structure branch))))

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (mobile-balanced? m)
  (let ((lb (left-branch m))
        (rb (right-branch m)))
    (and
     (cond ((has-submobile? lb)
            (mobile-balanced? (branch-structure lb)))
           (else #t))
     (cond ((has-submobile? rb)
            (mobile-balanced? (branch-structure rb)))
           (else #t))
     (= (torque lb) (torque rb)))))

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
;;;
;;; scheme@(guile-user)> (make-mobile (make-branch 5 50) (make-branch 5 50))
;;; $37 = ((5 50) (5 50))
;;; scheme@(guile-user)> (mobile-balanced? $37)
;;; $38 = #t
;;; scheme@(guile-user)> (make-mobile (make-branch 5 50) (make-branch 5 48))
;;; $39 = ((5 50) (5 48))
;;; scheme@(guile-user)> (mobile-balanced? $39)
;;; $40 = #f
;;; scheme@(guile-user)> (make-mobile (make-branch 6
;;;                                                (make-mobile (make-branch 2 25)
;;;                                                             (make-branch 2 25)))
;;;                                   (make-branch 6 50))
;;; $41 = ((6 ((2 25) (2 25))) (6 50))
;;; scheme@(guile-user)> (mobile-balanced? $41)
;;; $42 = #t
;;; scheme@(guile-user)> (make-mobile (make-branch 6
;;;                                                (make-mobile (make-branch 2 24)
;;;                                                             (make-branch 2 25)))
;;;                                   (make-branch 6 50))
;;; $43 = ((6 ((2 24) (2 25))) (6 50))
;;; scheme@(guile-user)> (mobile-balanced? $43)
;;; $44 = #f
;;; scheme@(guile-user)> (make-mobile (make-branch 3
;;;                           (make-mobile
;;;                            (make-branch 10
;;;                                         (make-mobile
;;;                                          (make-branch 10
;;;                                                       (make-mobile
;;;                                                        (make-branch 20 10)
;;;                                                        (make-branch 10
;;;                                                                     (make-mobile
;;;                                                                      (make-branch 2 10)
;;;                                                                      (make-branch 2 10)))))
;;;                                          (make-branch 30 10)))
;;;                            (make-branch 40 10)))
;;;              (make-branch 3 50))
;;; $45 = ((3 ((10 ((10 ((20 10) (10 ((2 10) (2 10))))) (30 10))) (40 10))) (3 50))
;;; scheme@(guile-user)> (mobile-balanced? $45)
;;; $46 = #t
;;; scheme@(guile-user)> (make-mobile (make-branch 3
;;;                           (make-mobile
;;;                            (make-branch 10
;;;                                         (make-mobile
;;;                                          (make-branch 2
;;;                                                       (make-mobile
;;;                                                        (make-branch 20 10)
;;;                                                        (make-branch 10
;;;                                                                     (make-mobile
;;;                                                                      (make-branch 2 10)
;;;                                                                      (make-branch 2 10)))))
;;;                                          (make-branch 30 10)))
;;;                            (make-branch 40 10)))
;;;              (make-branch 3 50))
;;; $47 = ((3 ((10 ((2 ((20 10) (10 ((2 10) (2 10))))) (30 10))) (40 10))) (3 50))
;;; scheme@(guile-user)> (mobile-balanced? $47)
;;; $48 = #f
