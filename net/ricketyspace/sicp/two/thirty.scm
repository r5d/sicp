;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirty)
  #:export (square-tree
            square-tree-steroids))

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree-steroids tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (* sub-tree sub-tree)
             (square-tree-steroids sub-tree)))
       tree))


;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirty)
;;; scheme@(guile-user)> (square-tree
;;;                       (list 1
;;;                             (list 2 (list 3 4) 5)
;;;                             (list 6 7)))
;;; $6 = (1 (4 (9 16) 25) (36 49))
;;; scheme@(guile-user)> (square-tree-steroids
;;;                       (list 1
;;;                             (list 2 (list 3 4) 5)
;;;                             (list 6 7)))
;;; $7 = (1 (4 (9 16) 25) (36 49))
