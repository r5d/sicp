;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtyone)
  #:export (tree-map
            square-tree))

(define (tree-map fun tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (fun tree))
        (else (cons (tree-map fun (car tree))
                    (tree-map fun (cdr tree))))))

(define (square-tree tree) (tree-map (lambda (x) (* x x)) tree))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,user (net ricketyspace sicp two thirtyone)
;;; scheme@(guile-user)> (square-tree
;;;                        (list 1
;;;                              (list 2 (list 3 4) 5)
;;;                              (list 6 7)))
;;; $2 = (1 (4 (9 16) 25) (36 49))
